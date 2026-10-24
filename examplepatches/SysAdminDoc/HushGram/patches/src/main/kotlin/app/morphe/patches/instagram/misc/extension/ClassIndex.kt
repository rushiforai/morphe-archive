/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * Instagram 449 has about 200,000 classes, and a walk over every one of them, reading each
 * method's instructions, takes a second or two on a desktop and many times that on a phone. The
 * patches used to make dozens of those walks, which is most of why patching in Manager was slow
 * (#60). The patcher indexes every class's string constants and literals once; these narrow a
 * search to the classes the index names, and the caller still checks each method itself, so what
 * a patch finds doesn't change.
 */

/**
 * The classes outside the extension whose code loads every one of [strings] as a string
 * constant, in the app's order. A method that holds all of them is in one of these classes.
 */
internal fun BytecodePatchContext.classesHolding(vararg strings: String): List<ClassDef> {
    require(strings.isNotEmpty()) { "no string to look for" }
    val sets = strings.map { string -> classDefByStrings(string) }
    val smallest = sets.minBy { it.size }
    val others = sets.filter { it !== smallest }.map { set -> set.mapTo(HashSet()) { it.type } }
    return smallest.filter { classDef -> !classDef.type.startsWith(EXTENSION_ROOT) && others.all { classDef.type in it } }
}

/**
 * The classes outside the extension whose code loads [value]: the ones [classesHolding] it, then
 * the ones asking a static pool of shared strings for it by number, as 450's Redex has it. Which
 * strings Redex pools differs from build to build of one version (#77), so a class holding a
 * string in one build can ask a pool for it in another, while the pool holds it in both.
 */
internal fun BytecodePatchContext.classesLoadingString(value: String): List<ClassDef> {
    val holders = classesHolding(value)
    val askers = holders.flatMap { holder ->
        holder.methods.mapNotNull { pool -> pool.numbersFor(value).takeIf { it.isNotEmpty() }?.let { pool to it } }
    }.flatMap { (pool, numbers) ->
        classesMightAsk(pool, numbers).filter { caller -> caller.methods.any { it.asksPool(pool, numbers) } }
    }
    return (holders + askers).distinctBy { it.type }
}

/**
 * The classes [asksPool] reads for [pool] and [numbers], in the app's order: every class calling
 * the pool, narrowed by the patcher's literal index to the ones that also load the number when
 * there's only one. A pool is called from thousands of classes, and reading each of them for every
 * pooled string was a measured share of patching (#173). A class asking for the number loads it
 * right before the call, so it always passes both filters, and [asksPool] still decides.
 */
private fun BytecodePatchContext.classesMightAsk(pool: Method, numbers: Set<Int>): List<ClassDef> {
    val number = numbers.singleOrNull() ?: return classesCalling(pool.definingClass, pool.name)
    return classesMatching(
        Fingerprint(filters = listOf(literal(number.toLong()), methodCall(definingClass = pool.definingClass, name = pool.name))),
    )
}

/**
 * The numbers this static `(I)String` pool answers [value] for, read off its switches the way
 * `pooledString` reads them: the first switch whose case for a number loads a string decides it.
 * Empty for any other method.
 */
private fun Method.numbersFor(value: String): Set<Int> {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != STRING || parameterTypes.map(Any::toString) != listOf("I")) {
        return emptySet()
    }
    val code = implementation?.instructions?.toList() ?: return emptySet()
    val address = IntArray(code.size + 1)
    code.forEachIndexed { index, instruction -> address[index + 1] = address[index] + instruction.codeUnits }
    val answered = HashSet<Int>()
    val numbers = HashSet<Int>()
    for (switch in code.indices) {
        if (code[switch].opcode != Opcode.PACKED_SWITCH && code[switch].opcode != Opcode.SPARSE_SWITCH) continue
        val payload = code.getOrNull(address.indexOf(address[switch] + (code[switch] as OffsetInstruction).codeOffset)) as? SwitchPayload
            ?: continue
        for (case in payload.switchElements) {
            val load = code.getOrNull(address.indexOf(address[switch] + case.offset)) ?: continue
            if (load.opcode != Opcode.CONST_STRING && load.opcode != Opcode.CONST_STRING_JUMBO || !answered.add(case.key)) continue
            if (((load as ReferenceInstruction).reference as StringReference).string == value) numbers += case.key
        }
    }
    return numbers
}

/** Whether this method asks [pool] for one of [numbers], a constant loaded into the call's register right before it. */
private fun Method.asksPool(pool: Method, numbers: Set<Int>): Boolean {
    val code = implementation?.instructions?.toList() ?: return false
    return code.indices.any { at ->
        val call = code[at]
        val called = (call as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
        val number = code.getOrNull(at - 1) as? NarrowLiteralInstruction ?: return@any false
        call.opcode == Opcode.INVOKE_STATIC && called.definingClass == pool.definingClass && called.name == pool.name &&
            called.parameterTypes.map(Any::toString) == listOf("I") && called.returnType == STRING &&
            (number as OneRegisterInstruction).registerA == (call as FiveRegisterInstruction).registerC &&
            number.narrowLiteral in numbers
    }
}

private const val STRING = "Ljava/lang/String;"

/**
 * The classes outside the extension whose code loads [literal] (a `const` or `const-wide` value),
 * in the app's order. The patcher's literal index picks the classes to read; a class a patch has
 * changed since it indexed the app is always read.
 */
internal fun BytecodePatchContext.classesLoading(literal: Long): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(literal(literal))))

/**
 * The classes outside the extension whose code calls [name] on [definingClass], in the app's
 * order. The patcher's index of the types each class refers to picks the classes to read; a class
 * a patch has changed since it indexed the app is always read. The index also keeps each call's
 * [parameters] and [returnType], so giving them narrows a search whose owner most classes name.
 */
internal fun BytecodePatchContext.classesCalling(
    definingClass: String,
    name: String,
    parameters: List<String>? = null,
    returnType: String? = null,
): List<ClassDef> = classesMatching(Fingerprint(filters = listOf(
    methodCall(definingClass = definingClass, name = name, parameters = parameters, returnType = returnType),
)))

/**
 * Every method calling [name] on [definingClass], the extension's included, in the app's order. The
 * same index picks the classes to read, and a walk over every class would decode each one's type.
 */
internal fun BytecodePatchContext.methodsCalling(definingClass: String, name: String): List<Method> =
    Fingerprint(filters = listOf(methodCall(definingClass = definingClass, name = name))).matchAllOrNull().orEmpty()
        .map { it.originalMethod }

/**
 * The classes outside the extension whose code calls any method of [definingClass], in the app's
 * order, by the same index of the types each class refers to.
 */
internal fun BytecodePatchContext.classesCallingInto(definingClass: String): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(methodCall(definingClass = definingClass))))

/**
 * The classes outside the extension whose code makes a new instance of [type] (new-instance), in
 * the app's order. The index of the types each class refers to picks the classes to read.
 */
internal fun BytecodePatchContext.classesCreating(type: String): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(newInstance(type))))

/**
 * The classes outside the extension whose code uses the field [name] of [definingClass] with
 * [opcode] (an iget or iput kind), in the app's order. The same index of the types each class
 * refers to picks the classes to read.
 */
internal fun BytecodePatchContext.classesAccessing(definingClass: String, name: String, opcode: Opcode): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(fieldAccess(definingClass = definingClass, name = name, opcode = opcode))))

/**
 * The classes outside the extension whose code reads or writes the field [name] of [definingClass],
 * with any opcode, in the app's order, by the same index.
 */
internal fun BytecodePatchContext.classesTouching(definingClass: String, name: String): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(fieldAccess(definingClass = definingClass, name = name, opcodes = null))))

/**
 * The types of the classes outside the extension holding a purge marker (see [markers]) named one
 * of [names]. A marker named X is an android_purge_ string ending in `_X`, so a class this leaves
 * out holds none. Filter a class walk by it to keep the app's order.
 */
internal fun BytecodePatchContext.typesMarked(vararg names: String): Set<String> {
    require(names.isNotEmpty()) { "no marker to look for" }
    val index = purgeIndex()
    return names.flatMapTo(HashSet()) { name -> index.typesEnding("_$name") }
        .filterNotTo(HashSet()) { it.startsWith(EXTENSION_ROOT) }
}

/**
 * Every android_purge_ string the app's code loads, by the part after its last underscore, with the
 * types of the classes loading it. A string ends in `_X` only when that part is X's own, so a name
 * reads one short list. Asking the patcher's string index for an ending tests each of the app's
 * 400,000 strings, once per name, and the Reels patches ask for dozens (#173). It holds strings,
 * plus the few classes it read last so the next ask knows where to start.
 */
private class PurgeIndex {
    private val byLastPart = HashMap<String, MutableList<Pair<String, String>>>()

    /**
     * The patcher's classes with strings this has read last, by identity: the end of the list when
     * it was built, then every class read after that.
     */
    val read: MutableSet<ClassDef> = java.util.Collections.newSetFromMap(java.util.IdentityHashMap())

    fun add(classDef: ClassDef) {
        for (method in classDef.methods) {
            for (instruction in method.implementation?.instructions ?: continue) {
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) continue
                val string = ((instruction as ReferenceInstruction).reference as StringReference).string
                if (string.startsWith("android_purge_")) {
                    byLastPart.getOrPut(string.substringAfterLast('_')) { ArrayList(1) } += string to classDef.type
                }
            }
        }
    }

    fun typesEnding(ending: String): List<String> =
        byLastPart[ending.substringAfterLast('_')].orEmpty().filter { it.first.endsWith(ending) }.map { it.second }
}

private val purgeIndexes = java.util.WeakHashMap<BytecodePatchContext, PurgeIndex>()

/**
 * This context's [PurgeIndex]. The first ask reads the classes the patcher's string index names
 * for an android_purge_ string. The patcher indexes a class merged in later, an extension's, by
 * adding it to the end of its classes with strings, so each ask reads back from the end to the
 * last class it has read. Patcher 2.0 also drops a class a merge replaces from that list, which
 * keeps its length the same, so counting what was added would miss the replacement. A class made
 * mutable can come back as another object, which is why more than the list's last class is kept.
 */
private fun BytecodePatchContext.purgeIndex(): PurgeIndex = synchronized(purgeIndexes) {
    val withStrings = getAllClassesWithStrings()
    val index = purgeIndexes[this] ?: PurgeIndex().also { index ->
        classDefByStrings("android_purge_", StringComparisonType.STARTS_WITH).forEach(index::add)
        index.read += withStrings.takeLast(KEPT_FROM_THE_END)
        purgeIndexes[this] = index
    }
    var from = withStrings.size
    while (from > 0 && withStrings[from - 1] !in index.read) from--
    for (classDef in withStrings.subList(from, withStrings.size)) {
        index.add(classDef)
        index.read += classDef
    }
    index
}

private const val KEPT_FROM_THE_END = 32

/** The classes outside the extension holding a method [fingerprint] matches, in the app's order. */
private fun BytecodePatchContext.classesMatching(fingerprint: Fingerprint): List<ClassDef> =
    fingerprint.matchAllOrNull().orEmpty().map { it.originalMethod.definingClass }.distinct()
        .filterNot { it.startsWith(EXTENSION_ROOT) }
        .map { classDefBy(it) }
