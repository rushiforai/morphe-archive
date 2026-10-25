/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.util

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.dexbacked.DexBackedClassDef
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.DualReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodProtoReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.lang.ref.SoftReference
import java.util.IdentityHashMap
import java.util.WeakHashMap

/**
 * What each class of the app names, so a pass that wants the classes naming one thing can skip the
 * rest without decoding them.
 *
 * #216: a Manager patch of Facebook spent 78% of its time in about 57 passes over every class, each
 * decoding every method's instructions again, where most of them want the handful of classes that
 * call one class or hold one string. The index reads every class once and keeps, for each, the
 * 16-bit keys of what it names as a sorted CharArray: the types its instructions and declarations
 * name (an array type also names its element type), the member names its instructions call or
 * read, and the strings it loads.
 *
 * Only classes that can't change are kept: the app's own dex classes and immutable ones. A class a
 * patch has changed is a new MutableClass the index never saw, and a class added later isn't in it
 * either, so both always go to the block, as does a class naming something the index has no key
 * for (a call site or a method handle). Keys are hashes, so two names can share one. That only
 * hands the block a class it turns down itself, and the block finds what a full pass finds.
 */
internal class ReferenceIndex private constructor(private val keysByClass: IdentityHashMap<ClassDef, CharArray>) {
    /** How many classes the index knows what they name. */
    val size: Int get() = keysByClass.size

    /** Whether [classDef] may name one of [wanted]: false only when the index knows it doesn't. */
    fun mayName(classDef: ClassDef, wanted: CharArray): Boolean {
        val held = keysByClass[classDef] ?: return true
        return wanted.any { held.binarySearch(it) >= 0 }
    }

    internal companion object {
        /** The index of [context], built on the first walk, or null once memory pressure took it back. */
        fun of(context: BytecodePatchContext): ReferenceIndex? {
            val held = indexes[context] ?: return build(context).also { indexes[context] = SoftReference(it) }
            return held.get()
        }

        /** Lets the index of [context] go, the way memory pressure does. */
        fun drop(context: BytecodePatchContext) {
            indexes[context]?.clear()
        }

        // Held softly: about 26 MB for Facebook 584, which a heap short of memory can take back rather
        // than fail the patch. It isn't built again after that: a second build late in a patch, with
        // the heap at its fullest, ran out of memory at 600 MB where the patch without an index fits.
        // The walks after it read every class, as they did before the index.
        private val indexes = WeakHashMap<BytecodePatchContext, SoftReference<ReferenceIndex>>()

        private fun build(context: BytecodePatchContext): ReferenceIndex {
            var classes = 0
            context.classDefForEach { classes++ }
            // Sized up front, so the map never holds its old table and a doubled one at once.
            val keysByClass = IdentityHashMap<ClassDef, CharArray>(classes)
            val keys = KeyBuffer()
            context.classDefForEach { classDef ->
                if (classDef !is DexBackedClassDef && classDef !is ImmutableClassDef) return@classDefForEach
                keys.clear()
                if (keys.addAll(classDef)) keysByClass[classDef] = keys.sortedDistinct()
            }
            return ReferenceIndex(keysByClass)
        }
    }
}

private const val TYPE_KIND = 0x1B873593
private const val NAME_KIND = 0x5BD1E995
private const val STRING_KIND = 0x27D4EB2F

// The top 16 bits of a multiplicative hash, its best mixed. Half the memory of 32-bit keys, and about
// 35 keys a class in Facebook 584 still leave a wanted key's chance of a false match near 1 in 2000.
private fun key(hash: Int, kind: Int): Char = (((hash xor kind) * -0x61C88647) ushr 16).toChar()

/** The key of a class type, as a reference or a declaration names it. */
internal fun typeKey(type: String): Char = key(type.hashCode(), TYPE_KIND)

/** The key of a member name a field or method reference names. */
internal fun nameKey(name: String): Char = key(name.hashCode(), NAME_KIND)

/** The key of a string a const-string loads. */
internal fun stringKey(string: String): Char = key(string.hashCode(), STRING_KIND)

/** The keys of [types], [names] and [strings], sorted. A type is a class or array type: no primitive has a class to name it. */
internal fun wantedKeys(
    types: Collection<String> = emptyList(),
    names: Collection<String> = emptyList(),
    strings: Collection<String> = emptyList(),
): CharArray {
    types.forEach { require(it.length > 1) { "$it is a primitive type, which the reference index doesn't keep" } }
    return (types.map(::typeKey) + names.map(::nameKey) + strings.map(::stringKey)).distinct().sorted().toCharArray()
}

/**
 * [classDefForEach], handing [block] only the classes that may name one of [types] (a class or array
 * type an instruction refers to, or one a declaration names), [names] (the name of a field or method
 * an instruction refers to) or [strings] (a string an instruction loads). Same order as
 * classDefForEach. Exact for a block that only finds a class naming one of them: what such a block
 * finds is what it finds handed every class ([ReferenceIndex]). Once memory pressure has taken the
 * index back, every class goes to the block.
 */
internal fun BytecodePatchContext.classDefForEachReferencing(
    types: Collection<String> = emptyList(),
    names: Collection<String> = emptyList(),
    strings: Collection<String> = emptyList(),
    block: (ClassDef) -> Unit,
) {
    val wanted = wantedKeys(types, names, strings)
    val index = ReferenceIndex.of(this) ?: return classDefForEach(block)
    classDefForEach { classDef -> if (index.mayName(classDef, wanted)) block(classDef) }
}

/** Keys of one class, gathered in a buffer that's reused for the next. */
private class KeyBuffer {
    private var keys = CharArray(1024)
    private var size = 0

    fun clear() {
        size = 0
    }

    private fun add(key: Char) {
        if (size == keys.size) keys = keys.copyOf(size * 2)
        keys[size++] = key
    }

    private fun type(type: CharSequence) {
        val text = type.toString()
        if (text.length <= 1) return
        add(typeKey(text))
        if (text[0] == '[') {
            val element = text.trimStart('[')
            if (element.length > 1) add(typeKey(element))
        }
    }

    /** Adds what [reference] names. False for a reference whose names the index has no key for. */
    private fun add(reference: Reference): Boolean {
        when (reference) {
            is StringReference -> add(stringKey(reference.string))
            is TypeReference -> type(reference.type)
            is FieldReference -> {
                type(reference.definingClass)
                type(reference.type)
                add(nameKey(reference.name))
            }
            is MethodReference -> {
                type(reference.definingClass)
                type(reference.returnType)
                reference.parameterTypes.forEach(::type)
                add(nameKey(reference.name))
            }
            is MethodProtoReference -> {
                type(reference.returnType)
                reference.parameterTypes.forEach(::type)
            }
            else -> return false
        }
        return true
    }

    /** Adds what [classDef] names. False when it names something the index has no key for. */
    fun addAll(classDef: ClassDef): Boolean {
        classDef.superclass?.let(::type)
        classDef.interfaces.forEach(::type)
        classDef.fields.forEach { type(it.type) }
        for (method in classDef.methods) {
            type(method.returnType)
            method.parameterTypes.forEach(::type)
            val instructions = method.implementation?.instructions ?: continue
            for (instruction in instructions) {
                if (instruction !is ReferenceInstruction) continue
                if (!add(instruction.reference)) return false
                if (instruction is DualReferenceInstruction && !add(instruction.reference2)) return false
            }
        }
        return true
    }

    fun sortedDistinct(): CharArray {
        keys.sort(0, size)
        var distinct = 0
        for (at in 0 until size) {
            if (distinct == 0 || keys[at] != keys[distinct - 1]) keys[distinct++] = keys[at]
        }
        return keys.copyOf(distinct)
    }
}
