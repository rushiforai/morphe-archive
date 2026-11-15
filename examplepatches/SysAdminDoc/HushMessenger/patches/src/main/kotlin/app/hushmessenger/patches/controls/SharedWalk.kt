package app.hushmessenger.patches.controls

import com.android.tools.smali.dexlib2.Format
import com.android.tools.smali.dexlib2.ReferenceType
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.dexbacked.instruction.DexBackedInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.Arrays
import java.util.IdentityHashMap

/*
 * findControls' finders each walked every method of the app and decoded its code again, dozens of walks over half a
 * million methods, and decoding was most of what they cost. A finder's per-method test now lives in a MethodCheck or a
 * ClassCheck, findControls runs every check sharedChecks() lists in one walk, and there a method's code is decoded once
 * however many tests read it. A finder asks its check for what passed and gets what its own walk would have found, in
 * the same order. Asked anywhere else, as the tests do, a check walks the classes itself.
 *
 * A check is built from a function that makes its test, so a StringMatch or MemberMatch the test uses lives for one walk
 * and never in the check (CodeMatch.kt says why). A test reads the method it's given and keeps nothing: the walk hands
 * it a stand-in that shares the decoded code, and what a finder gets back is always Messenger's own method.
 */

internal typealias MethodTest = (ClassDef, Method) -> Boolean

internal sealed class WalkCheck(val newTest: () -> MethodTest)

/** The methods that pass a test, with their classes, in class order and then method order. */
internal class MethodCheck(newTest: () -> MethodTest) : WalkCheck(newTest) {
    fun sites(classes: Iterable<ClassDef>): List<Pair<ClassDef, Method>> {
        sharedWalk?.sites(this, classes)?.let { return it }
        val test = newTest()
        return classes.flatMap { cls -> cls.methods.filter { test(cls, it) }.map { cls to it } }
    }

    fun methods(classes: Iterable<ClassDef>): List<Method> = sites(classes).map { it.second }
}

/** The classes that have a method passing a test, as `classes.filter { cls -> cls.methods.any { ... } }` finds them. */
internal class ClassCheck(newTest: () -> MethodTest) : WalkCheck(newTest) {
    fun classes(classes: Iterable<ClassDef>): List<ClassDef> {
        sharedWalk?.classes(this, classes)?.let { return it }
        val test = newTest()
        return classes.filter { cls -> cls.methods.any { test(cls, it) } }
    }
}

/**
 * The methods of [classes] whose code may reference one of [methods] (ids as hookId writes them) or [types], with their
 * classes, in class order and then method order. Every method a walk looking for such a reference would find is in it,
 * so a finder that looks for callers of something only known once other finders ran still runs its own check on each,
 * just on far fewer methods. Outside findControls, or when the walk couldn't index the app, it's every method.
 */
internal fun codeReferrers(classes: Iterable<ClassDef>, methods: Collection<String> = emptyList(), types: Collection<String> = emptyList()): List<Pair<ClassDef, Method>> =
    sharedWalk?.referrers(classes, methods, types) ?: classes.flatMap { cls -> cls.methods.map { cls to it } }

/** A test for the methods whose code loads [value], with its matcher made for one walk. */
internal fun loadsString(value: String): () -> MethodTest = {
    val match = StringMatch(value)
    val test: MethodTest = { _, method -> match.inCode(method) }
    test
}

/** A check whose test needs nothing made for the walk. */
internal fun methodCheck(test: MethodTest) = MethodCheck { test }

internal fun classCheck(test: MethodTest) = ClassCheck { test }

/** Runs [block] with every check in [checks] answered from one walk over [classes]. */
internal fun <T> withSharedWalk(classes: Iterable<ClassDef>, checks: List<WalkCheck>, block: () -> T): T {
    val before = walkSlot.get()
    walkSlot.set(SharedWalk(classes, checks))
    try {
        return block()
    } finally {
        if (before == null) walkSlot.remove() else walkSlot.set(before)
    }
}

/**
 * The walk findControls' finders are answered from while it runs, on the thread running it; null otherwise, so it never
 * keeps an APK alive. Two patch runs at once each see only their own, and work on another thread walks on its own.
 */
private val walkSlot = ThreadLocal<SharedWalk?>()

private val sharedWalk: SharedWalk? get() = walkSlot.get()

private class SharedWalk(private val classes: Iterable<ClassDef>, checks: List<WalkCheck>) {
    private val slots = IdentityHashMap<WalkCheck, Int>()
    private val found: Array<MutableList<Any>>

    /**
     * Checks whose test threw, or couldn't be made. The walk asks every test about every method, where a finder's own
     * walk may stop or never start, so a throw here (an Exception, or an Error like a missing method) isn't the finder's.
     * Such a check is left to the finder's own walk, which throws where it always did, or never gets there.
     */
    private val broken: BooleanArray

    /** What each method references, in walk order; null when a method's code couldn't be read that way. */
    private var index: RefIndex? = RefIndex()

    init {
        val all = mutableListOf<WalkCheck>()
        for (check in checks) if (slots.putIfAbsent(check, all.size) == null) all.add(check)
        // A test that can't be made is broken from the start, and its finder makes it again where it always did.
        val tests = Array(all.size) { i ->
            try {
                all[i].newTest()
            } catch (_: Exception) {
                null
            } catch (_: LinkageError) {
                null
            }
        }
        val perClass = BooleanArray(all.size) { all[it] is ClassCheck }
        found = Array(all.size) { mutableListOf() }
        broken = BooleanArray(all.size) { tests[it] == null }
        fun breaks(i: Int): Boolean {
            broken[i] = true
            found[i].clear()
            return false
        }
        val done = BooleanArray(all.size)
        val scratch = KeyScratch()
        for (cls in classes) {
            done.fill(false)
            for (method in cls.methods) {
                val shared = SharedCode(method, scratch)
                for (i in tests.indices) {
                    if (done[i] || broken[i]) continue
                    val passed = try {
                        tests[i]!!(cls, shared)
                    } catch (_: Exception) {
                        breaks(i)
                    } catch (_: LinkageError) {
                        breaks(i)
                    }
                    if (!passed) continue
                    if (perClass[i]) {
                        // Like any(), a class is in once its first method passes, and its later methods aren't asked.
                        done[i] = true
                        found[i].add(cls)
                    } else found[i].add(cls to method)
                }
                try {
                    index?.add(shared)
                } catch (_: Exception) {
                    index = null
                } catch (_: LinkageError) {
                    // A dexlib2 without the instruction fields the index reads: the finders walk on their own.
                    index = null
                }
            }
        }
    }

    fun referrers(of: Iterable<ClassDef>, methods: Collection<String>, types: Collection<String>): List<Pair<ClassDef, Method>>? {
        val index = index?.takeIf { of === classes } ?: return null
        val targets = IdentityHashMap<DexBackedDexFile, IntArray>()
        val found = mutableListOf<Pair<ClassDef, Method>>()
        var at = 0
        for (cls in classes) for (method in cls.methods) {
            if (at == index.size) return null
            if (index.mayReference(at++, targets, methods, types)) found.add(cls to method)
        }
        return found.takeIf { at == index.size }
    }

    private fun slot(check: WalkCheck, of: Iterable<ClassDef>): Int? =
        if (of !== classes) null else slots[check]?.takeUnless { broken[it] }

    @Suppress("UNCHECKED_CAST")
    fun sites(check: MethodCheck, of: Iterable<ClassDef>): List<Pair<ClassDef, Method>>? =
        slot(check, of)?.let { found[it] as List<Pair<ClassDef, Method>> }

    @Suppress("UNCHECKED_CAST")
    fun classes(check: ClassCheck, of: Iterable<ClassDef>): List<ClassDef>? = slot(check, of)?.let { found[it] as List<ClassDef> }
}

/**
 * What a method's code references, from the instructions' own table indexes, sorted and without repeats: [members] holds
 * method indexes and type indexes above [TYPE_KEY], [strings] string indexes. [dex] is null when the code references none.
 */
internal class CodeKeys(val dex: DexBackedDexFile?, val members: IntArray, val strings: IntArray)

/** The keys of a method the walk handed a test, or null outside the walk and for code it can't read that way. */
internal fun Method.codeKeys(): CodeKeys? = (this as? SharedCode)?.keys

/** A method whose code is decoded the first time a test reads it, and kept for the walk's other tests. */
private class SharedCode(private val method: Method, private val scratch: KeyScratch) : Method by method {
    private val code: MethodImplementation? by lazy(LazyThreadSafetyMode.NONE) { method.implementation?.let(::DecodedCode) }

    val keys: CodeKeys? by lazy(LazyThreadSafetyMode.NONE) {
        code?.let { implementation ->
            try {
                scratch.keysOf(implementation.instructions)
            } catch (_: Exception) {
                null
            } catch (_: LinkageError) {
                // A dexlib2 without the instruction fields this reads: the tests and finders read the code themselves.
                null
            }
        }
    }

    override fun getImplementation(): MethodImplementation? = code

    override fun equals(other: Any?): Boolean = method == other

    override fun hashCode(): Int = method.hashCode()

    override fun toString(): String = method.toString()
}

private class DecodedCode(private val source: MethodImplementation) : MethodImplementation by source {
    private val code: List<Instruction> by lazy(LazyThreadSafetyMode.NONE) { source.instructions.toList() }

    override fun getInstructions(): Iterable<Instruction> = code
}

/** A type's key sits above every method's, since a dex file holds at most 65536 of each. */
private const val TYPE_KEY = 0x10000

/** The formats whose reference index is the 16 bits after the opcode: every one a method or type reference comes in. */
private val INDEXED_FORMATS = setOf(Format.Format21c, Format.Format22c, Format.Format35c, Format.Format3rc, Format.Format45cc, Format.Format4rcc)

/** The walk's buffers for [CodeKeys], reused method after method since the walk reads one method at a time. */
private class KeyScratch {
    private var members = IntArray(256)
    private var strings = IntArray(64)

    /** Null unless every instruction is one dex file's own: a class a patch already rebuilt holds plain instructions. */
    fun keysOf(code: Iterable<Instruction>): CodeKeys? {
        var dex: DexBackedDexFile? = null
        var memberCount = 0
        var stringCount = 0
        for (insn in code) {
            if (insn !is DexBackedInstruction || (dex != null && insn.dexFile !== dex)) return null
            dex = insn.dexFile
            val opcode = insn.opcode
            when (opcode.referenceType) {
                ReferenceType.METHOD, ReferenceType.TYPE -> {
                    if (opcode.format !in INDEXED_FORMATS) return null
                    val kind = if (opcode.referenceType == ReferenceType.TYPE) TYPE_KEY else 0
                    if (memberCount == members.size) members = members.copyOf(memberCount * 2)
                    members[memberCount++] = kind or insn.dexFile.dataBuffer.readUshort(insn.instructionStart + 2)
                }
                ReferenceType.STRING -> {
                    val index = when (opcode.format) {
                        Format.Format21c -> insn.dexFile.dataBuffer.readUshort(insn.instructionStart + 2)
                        Format.Format31c -> insn.dexFile.dataBuffer.readSmallUint(insn.instructionStart + 2)
                        else -> return null
                    }
                    if (stringCount == strings.size) strings = strings.copyOf(stringCount * 2)
                    strings[stringCount++] = index
                }
            }
        }
        if (memberCount == 0 && stringCount == 0) return CodeKeys(null, NO_KEYS, NO_KEYS)
        return CodeKeys(dex, members.distinctSorted(memberCount), strings.distinctSorted(stringCount))
    }

    private fun IntArray.distinctSorted(count: Int): IntArray {
        if (count == 0) return NO_KEYS
        sort(0, count)
        var distinct = 1
        for (i in 1 until count) if (this[i] != this[distinct - 1]) this[distinct++] = this[i]
        return copyOf(distinct)
    }
}

/** A method that references nothing, and one whose code isn't Messenger's own dex, which may reference anything. */
private val NO_KEYS = IntArray(0)
private val UNINDEXED = IntArray(0)

/** Each method's [CodeKeys.members] with the dex file they index, in walk order. It holds only numbers and dex files. */
private class RefIndex {
    private val keys = ArrayList<IntArray>()
    private val dexes = ArrayList<DexBackedDexFile?>()

    val size get() = keys.size

    fun add(method: SharedCode) {
        if (method.implementation == null) return record(NO_KEYS, null)
        val found = method.keys ?: return record(UNINDEXED, null)
        record(found.members, found.dex)
    }

    private fun record(found: IntArray, dex: DexBackedDexFile?) {
        keys.add(found)
        dexes.add(dex)
    }

    fun mayReference(at: Int, targets: IdentityHashMap<DexBackedDexFile, IntArray>, methods: Collection<String>, types: Collection<String>): Boolean {
        val found = keys[at]
        if (found === UNINDEXED) return true
        val dex = dexes[at] ?: return false
        return targets.getOrPut(dex) { dex.keysOf(methods, types) }.any { Arrays.binarySearch(found, it) >= 0 }
    }
}

/**
 * The keys this dex file gives [methods] and [types]. Its method table is sorted by class, then name, then prototype, and
 * its classes and names by their strings in UTF-16 order, so a method is found by class and name before its id is read.
 */
private fun DexBackedDexFile.keysOf(methods: Collection<String>, types: Collection<String>): IntArray {
    val found = mutableListOf<Int>()
    for (type in types) typeSection.binarySearch(type).takeIf { it >= 0 }?.let { found.add(TYPE_KEY or it) }
    val table = methodSection
    for (id in methods) {
        val owner = id.substringBefore("->")
        val name = id.substringAfter("->").substringBefore('(')
        fun order(m: MethodReference) = m.definingClass.compareTo(owner).takeIf { it != 0 } ?: m.name.compareTo(name)
        val hit = table.binarySearch { order(it) }
        if (hit < 0) continue
        var first = hit
        while (first > 0 && order(table[first - 1]) == 0) first--
        var i = first
        while (i < table.size && order(table[i]) == 0) {
            if (table[i].toString() == id) found.add(i)
            i++
        }
    }
    return found.toIntArray()
}
