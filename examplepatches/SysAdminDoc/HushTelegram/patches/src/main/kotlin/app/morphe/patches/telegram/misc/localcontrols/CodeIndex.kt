/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.localcontrols

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.dexbacked.DexBackedClassDef
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.util.IdentityHashMap
import java.util.WeakHashMap
import java.util.stream.IntStream
import app.morphe.util.names.TelegramNames

/**
 * Something a class's code might mention, for [classDefsMentioning] to narrow a whole-app search
 * with before the search's own checks run.
 *
 * A mention is matched against hashes, never against the text, so a class can come back that
 * mentions nothing asked for. That's the safe direction: the caller still runs every exact check
 * it ran over the whole app. What must never happen is a class that does mention it being left
 * out, and each kind below is read from exactly the instruction reference the patches compare.
 */
internal sealed class Mention {
    internal abstract fun within(keys: IntArray): Boolean

    infix fun and(other: Mention): Mention = Both(this, other)
    infix fun or(other: Mention): Mention = Either(this, other)

    private class Key(val key: Int) : Mention() {
        override fun within(keys: IntArray) = keys.binarySearch(key) >= 0
    }

    private class Both(val first: Mention, val second: Mention) : Mention() {
        override fun within(keys: IntArray) = first.within(keys) && second.within(keys)
    }

    private class Either(val first: Mention, val second: Mention) : Mention() {
        override fun within(keys: IntArray) = first.within(keys) || second.within(keys)
    }

    /** No narrowing at all: every class is a candidate. */
    private object Anything : Mention() {
        override fun within(keys: IntArray) = true
    }

    companion object {
        /** A string constant, as `const-string` loads it. */
        fun string(value: String): Mention = Key(key(STRING, value.hashCode()))

        /**
         * A type the code names directly: what `new-instance`, `check-cast`, `instance-of`,
         * `const-class` and the array instructions take, and the owner of every field or method it
         * reads, writes or calls. Not a field's type or a call's parameter and return types.
         *
         * The index holds the dex's own names, so a source name of a class 13.2 renamed is looked
         * for under the build's name too. A name already read off the build stays as it is.
         */
        fun type(descriptor: String): Mention {
            val build = TelegramNames.current().type(descriptor)
            val raw = Key(key(TYPE, descriptor.hashCode()))
            return if (build == descriptor) raw else raw or Key(key(TYPE, build.hashCode()))
        }

        /** The name of a field or method the code reads, writes or calls, of any class. */
        fun member(name: String): Mention = names(TelegramNames.current().anyMemberNames(name))

        /** A field or method named [name] on [definingClass], read, written or called. */
        fun member(definingClass: String, name: String): Mention {
            val table = TelegramNames.current()
            return type(definingClass) and names(table.memberNames(definingClass, name) + table.anyMemberNames(name))
        }

        private fun names(names: Set<String>): Mention = anyOf(names.map { Key(key(MEMBER, it.hashCode())) })

        /** A literal any `const` or literal-operand instruction carries, sign-extended to a long. */
        fun literal(value: Long): Mention = Key(key(LITERAL, java.lang.Long.hashCode(value)))
        fun literal(value: Int): Mention = literal(value.toLong())

        /**
         * Any instruction whose reference reads as [text], the way `reference.origString()` gives it:
         * `Lowner;->name:Type`, `Lowner;->name(Parameters)Return`, a type, or a string constant,
         * since a string reference reads as the string itself.
         */
        fun reference(text: String): Mention {
            val arrow = text.indexOf("->")
            // Method handles, call sites and prototypes read differently and aren't indexed. Text
            // that could be one of them narrows nothing rather than risk leaving a class out.
            if (text.isEmpty() || (text[0] != 'L' && text[0] != '[')) return Anything
            // 13.2 has no R classes: the read of a resource id is the literal R8 put in its place.
            TelegramNames.current().resourceOf(text)?.let { return literal(it) }
            if (arrow < 0) return string(text) or type(text)
            val rest = text.substring(arrow + 2)
            val end = rest.indexOfFirst { it == ':' || it == '(' }
            if (end <= 0) return Anything
            return string(text) or member(text.substring(0, arrow), rest.substring(0, end))
        }

        fun anyOf(mentions: Iterable<Mention>): Mention = mentions.reduce { first, second -> first or second }
        fun allOf(mentions: Iterable<Mention>): Mention = mentions.reduce { first, second -> first and second }

        /** Any one of [texts], each read as [reference] reads it. */
        fun anyReference(texts: Iterable<String>): Mention = anyOf(texts.map { reference(it) })

        /** Every one of [texts], each read as [reference] reads it, anywhere in the class. */
        fun allReferences(texts: Iterable<String>): Mention = allOf(texts.map { reference(it) })

        private const val STRING = 0
        private const val TYPE = 1
        private const val MEMBER = 2
        private const val LITERAL = 3

        // An odd multiplier is a bijection on Int, so two different hashes of one kind never meet;
        // the kind in the low bits only keeps the kinds apart. A collision would add a candidate.
        internal fun key(kind: Int, hash: Int) = (hash * -0x61c88647) xor kind

        /** Every key [classDef]'s code holds, sorted and without repeats. */
        internal fun keysOf(classDef: ClassDef): IntArray {
            var keys = IntArray(64)
            var count = 0
            fun add(key: Int) {
                if (count == keys.size) keys = keys.copyOf(count * 2)
                keys[count++] = key
            }
            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions ?: continue
                for (instruction in instructions) {
                    if (instruction is WideLiteralInstruction) add(key(LITERAL, java.lang.Long.hashCode(instruction.wideLiteral)))
                    when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                        is StringReference -> add(key(STRING, reference.string.hashCode()))
                        is TypeReference -> add(key(TYPE, reference.type.hashCode()))
                        is FieldReference -> {
                            add(key(TYPE, reference.definingClass.hashCode()))
                            add(key(MEMBER, reference.name.hashCode()))
                        }
                        is MethodReference -> {
                            add(key(TYPE, reference.definingClass.hashCode()))
                            add(key(MEMBER, reference.name.hashCode()))
                        }
                        else -> {}
                    }
                }
            }
            keys = keys.copyOf(count)
            keys.sort()
            var unique = 0
            for (i in keys.indices) if (i == 0 || keys[i] != keys[i - 1]) keys[unique++] = keys[i]
            return keys.copyOf(unique)
        }
    }
}

/**
 * What each class of a patching session mentions, read once, so a patch looking for one call or
 * string doesn't decode every instruction of the app again. About fifty patches used to, and each
 * pass over Telegram's dex is four million instructions.
 *
 * The index is taken from the classes as they stand the first time it's asked for, and it stays
 * right as patches edit the app because it only speaks for classes that can't change: a class
 * read straight from a dex, or an immutable copy of one, held by identity. A patch that edits a
 * class swaps it for a mutable one, a merged extension class is a new object, and anything the
 * index never read is new to it, so all of those are candidates for every search and get the
 * search's full check. A search sees the classes the context holds when it runs, in the context's
 * order, exactly as a walk over every class would.
 */
internal class CodeIndex private constructor(private val keys: IdentityHashMap<ClassDef, IntArray>) {
    fun candidates(context: BytecodePatchContext, query: Mention): List<ClassDef> {
        val found = ArrayList<ClassDef>()
        context.classDefForEach { classDef ->
            val known = keys[classDef]
            if (known == null || query.within(known)) found += classDef
        }
        return found
    }

    internal companion object {
        private val sessions = WeakHashMap<BytecodePatchContext, CodeIndex>()

        /** The index of [context], built the first time any patch of that session asks. */
        fun of(context: BytecodePatchContext): CodeIndex = synchronized(sessions) {
            sessions.getOrPut(context) { build(context) }
        }

        private fun readable(classDef: ClassDef) =
            classDef.javaClass == DexBackedClassDef::class.java || classDef.javaClass == ImmutableClassDef::class.java

        private fun build(context: BytecodePatchContext): CodeIndex {
            val classes = ArrayList<ClassDef>()
            context.classDefForEach { if (readable(it)) classes += it }
            val read = arrayOfNulls<IntArray>(classes.size)
            IntStream.range(0, classes.size).parallel().forEach { at ->
                // A class that can't be read here is left out of the index, which makes it a
                // candidate for every search: the search then meets it exactly as it did before.
                read[at] = try {
                    Mention.keysOf(classes[at])
                } catch (_: RuntimeException) {
                    null
                }
            }
            val keys = IdentityHashMap<ClassDef, IntArray>(classes.size)
            for (at in classes.indices) read[at]?.let { keys[classes[at]] = it }
            return CodeIndex(keys)
        }
    }
}

/**
 * The classes [classDefForEach] would visit whose code might mention [query], in the same order:
 * every class that does, and possibly some that don't. Whatever a search checks on each class
 * still has to be checked on these.
 */
internal fun BytecodePatchContext.classDefsMentioning(query: Mention): List<ClassDef> = CodeIndex.of(this).candidates(this, query)

/** [classDefForEach] over just the classes [classDefsMentioning] gives for [query]. */
internal inline fun BytecodePatchContext.forEachClassMentioning(query: Mention, action: (ClassDef) -> Unit) {
    for (classDef in classDefsMentioning(query)) action(classDef)
}
