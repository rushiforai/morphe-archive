/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.isStringTableCall
import app.morphe.patches.facebook.feed.tableIndexAt
import app.morphe.patches.facebook.feed.tableIndices
import app.morphe.patches.facebook.feed.tableStringAt
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.reels.FB_USER_SESSION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * Where the Reels and Watch side of the GenAI rule hooks, found by kept names only (read from 577
 * and 580, 2026-09-26). The obfuscated names in these comments are for reviewers; the code never
 * writes one down.
 *
 * - The Reels viewer builds its AI label only when the reel's attribution list holds a model whose
 *   getTypeName() answers XFBFBShortsGenAITransparencyAttribution. It finds that model with a
 *   static helper taking the reel's model and the type name (580 LX/Atc;->A02, 577 LX/Aw8;->A02),
 *   called with the literal from the viewer's info row builder, the one holding
 *   "FbShortsAdsSponsoredInfoRowAnimationKey", and from one Litho component's builder. Every other
 *   method holding the literal only compares it with String.equals. So the finder is the one
 *   static method the literal is handed to, and its first parameter is the reel model's type.
 *   On 582 (read 2026-10-10) the finder is arm64 LX/8NX;->A02 and armeabi-v7a LX/8QP;->A02. The
 *   v7a build's callers (LX/CwR;->A18, LX/ATI;->A00) never load the literal: they ask the string
 *   table LX/SoX;->A00 for it with 8, so the methods asking a table that holds the literal count as
 *   holders too.
 * - That attribution carries was_detected_as_ai_generated (0x723ea5fe) as a boolean of its own,
 *   beside was_self_disclosed_as_ai_generated (0xbc6e7b43) and gen_ai_detected_transparency_type.
 *   The viewer's decision whether to draw the label (580 LX/Axm;->A01, 577 LX/B0Q;->A01) is
 *   static, takes the session, the attribution and the model, answers a boolean, and reads the
 *   flag with TreeJNI.getBooleanValue, the kept reader the extension calls too. The patch holds the
 *   build to that decision, so it stops if the flag's home moves.
 *   585 (read 2026-10-29) has no such static decision any more: the static (session, attribution,
 *   model) methods left (arm64 LX/0B83;->A08, LX/0dVj;->A04) only switch on getTypeName(). The
 *   flag is read in the instance method building the AI info sheet's tree (arm64
 *   LX/08nc;->A07(LX/0eTv;), armeabi-v7a LX/08nh;->A07(LX/0eTc;)): it takes the model, walks its
 *   attribution list, picks the one whose getTypeName() equals the table's type name, casts it to
 *   the attribution interface and then to TreeJNI, and reads 0x723ea5fe with getBooleanValue.
 * - The label's text comes from gen_ai_transparency_label_info { zero_click_transparency_label }
 *   on the attribution. The rule doesn't read it: a self-labelled reel has a label too.
 * - Some items hold the model in a field of that type (580 LX/5qk and LX/TKN); a Watch video built
 *   from a post can hold a GraphQLStory instead, and the extension reads the feed's flag on it.
 * - The Reels tab's own items hold neither (read from 577 and 580, 2026-09-27, after the S22
 *   counted "no model" for all 20). The class VideoHomeMutableDataHelper builds them with (580
 *   LX/857, 577 LX/71s) keeps three raw trees of its own (580 LX/3SN, 577 LX/1vG) and one holder
 *   (580 LX/7bV, 577 LX/7Z9) declaring a field of the model's type and one of GraphQLStory's,
 *   which the Reels viewer takes the model out of. Facebook's Reels menu decides its "AI info" row
 *   (the method logging "GenAI info NFX action was sent for reel", 580 LX/TVi;->A00, 577
 *   LX/Tka;->A00, handed the model and that holder) by the attribution first, then by the model's
 *   own ai_generated_detected_info (0xb4f9e684) and its was_detected_as_ai_generated, read as
 *   trees. So for such an item the extension reads that field by its key through
 *   TreeJNI.getTree(int), on the holder's model and story and on the item's own trees. Items
 *   holding no tree at all stay.
 */

/** Kept literal. The GraphQL type of the attribution the Reels viewer's AI label is built from. */
internal const val TRANSPARENCY_ATTRIBUTION = "XFBFBShortsGenAITransparencyAttribution"

/** The kept readers on TreeJNI the extension reads the attribution's flag through. */
internal const val TREE_BOOLEAN_READER = "getBooleanValue"
internal const val TREE_FIELD_CHECK = "hasFieldValue"

/** The kept reader of a nested tree by its field's key, which the Reels tab's items are read through. */
internal const val TREE_READER = "getTree"

private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"

private val Instruction.methodReference
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference

private val Instruction.string
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

/** Every register an invoke passes, in argument order. */
private fun argumentRegisters(instruction: Instruction): List<Int> = when (instruction) {
    is RegisterRangeInstruction -> (0 until instruction.registerCount).map { instruction.startRegister + it }
    is FiveRegisterInstruction -> listOf(
        instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG,
    ).take(instruction.registerCount)
    else -> emptyList()
}

/** Whether [instruction] leaves something new in [register]. */
private fun writes(instruction: Instruction, register: Int): Boolean {
    if (!instruction.opcode.setsRegister()) return false
    val target = (instruction as? OneRegisterInstruction)?.registerA ?: return false
    return target == register || (instruction.opcode.setsWideRegister() && target + 1 == register)
}

/**
 * The static calls in [method] that are handed [literal] as a String argument: from each load of
 * the literal, every static invoke answering something and passing its register in a String
 * parameter's place, until something writes that register again. A load is a const-string of the
 * literal, or, with [resolve], the result of asking a string table [resolve] reads for it (582's
 * armeabi-v7a build hands the finder the literal that way). A void call answers nothing, so it
 * can't be the finder: 582's own loop helper (arm64 LX/5LI;->A04) takes the literal that way.
 */
internal fun finderCalls(
    method: Method,
    literal: String = TRANSPARENCY_ATTRIBUTION,
    resolve: ((MethodReference) -> Method?)? = null,
): List<MethodReference> {
    val body = method.body()
    val calls = mutableListOf<MethodReference>()
    for ((index, load) in body.withIndex()) {
        val loaded = load.string == literal || resolve != null && load.opcode == Opcode.MOVE_RESULT_OBJECT &&
            tableStringAt(body, index - 1, resolve) == literal
        if (!loaded) continue
        val register = (load as OneRegisterInstruction).registerA
        for (next in body.subList(index + 1, body.size)) {
            val registers = argumentRegisters(next)
            val call = next.methodReference
            if (call != null && next.opcode.name.startsWith("invoke-static") && call.returnType != "V" && register in registers) {
                val at = registers.indexOf(register)
                if (call.parameterTypes.getOrNull(at)?.toString() == STRING) calls += call
            }
            if (writes(next, register)) break
        }
    }
    return calls
}

/** What the holders of the literal say the finder is: the one static method they hand it to, or why there is none. */
internal class Finder(val call: MethodReference?, val problem: String?)

private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** The prefix every extension class shares, Hushfacebook's own and the shared library's. */
internal const val EXTENSION_CLASSES = "Lapp/morphe/extension/"

/**
 * The attribution finder among [holders], the methods loading [literal] ([TRANSPARENCY_ATTRIBUTION]
 * unless another is given): every static call the literal is handed to has to be the same method,
 * taking a model and the name and answering a model. Two different ones would mean the rule no
 * longer knows which finds the attribution. The AI character rule finds an attachment's style
 * finder the same way.
 *
 * A holder in the extension doesn't count. The patcher searches the APK with the extension merged
 * in, and the reel filter hands the same literal to its own stub, which both fixture builds counted
 * as a second finder until this left it out (2026-09-26).
 *
 * [resolve], when given, reads the string tables [holders] ask for the literal ([asksTableFor]),
 * so a holder handing over a table's answer counts the way a load of the literal does.
 */
internal fun attributionFinder(
    holders: List<Method>,
    literal: String = TRANSPARENCY_ATTRIBUTION,
    resolve: ((MethodReference) -> Method?)? = null,
): Finder {
    val calls = holders.filterNot { it.definingClass.startsWith(EXTENSION_CLASSES) }.flatMap { finderCalls(it, literal, resolve) }
    if (calls.isEmpty()) {
        return Finder(null, "no method holding \"$literal\" hands it to a static call as a String")
    }
    val distinct = calls.distinctBy { it.signature() }
    if (distinct.size != 1) {
        return Finder(null, "the literal is handed to ${distinct.size} static methods, expected one: " +
            distinct.joinToString { it.signature() })
    }
    val call = distinct.single()
    val shape = call.parameterTypes.size == 2 && call.parameterTypes[0].toString().startsWith("L") &&
        call.parameterTypes[1].toString() == STRING && call.returnType.startsWith("L") && call.returnType != STRING
    if (!shape) {
        return Finder(null, "${call.signature()} isn't a (model, String) finder answering a model")
    }
    return Finder(call, null)
}

/** Whether [method] is a string table: a static `(I)Ljava/lang/String;` with a body. */
internal fun isStringTable(method: Method): Boolean =
    AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null && method.returnType == STRING &&
        method.parameterTypes.map { it.toString() } == listOf("I")

/**
 * The entries of [tables] (string tables, [isStringTable]) that answer [literal]: each table's
 * `class->name` with the indexes it answers the literal for. Each table is read once.
 */
internal fun tableEntries(tables: List<Method>, literal: String): Map<String, Set<Int>> =
    tables.associate { "${it.definingClass}->${it.name}" to tableIndices(it, literal) }.filterValues { it.isNotEmpty() }

/**
 * Whether [method] asks a string table for one of [entries] ([tableEntries]): an int constant
 * loaded straight before the table's call, into the register it takes. Redex outlines a literal
 * many methods share into such a table, and 582's armeabi-v7a build (LX/SoX;->A00 with 8) hands
 * the attribution's type name to the finder from there.
 */
internal fun asksTableFor(method: Method, entries: Map<String, Set<Int>>): Boolean {
    val instructions = method.implementation?.instructions ?: return false
    if (instructions.none(::isStringTableCall)) return false
    val body = instructions.toList()
    return body.indices.any { index ->
        val key = tableIndexAt(body, index) ?: return@any false
        val call = body[index].methodReference ?: return@any false
        key in entries["${call.definingClass}->${call.name}"].orEmpty()
    }
}

/**
 * Whether [method] has the finder's shape: static, the reel model and a String in, a model out,
 * and a body that asks each candidate's `getTypeName()` and compares it with `String.equals`.
 */
internal fun isAttributionFinder(method: Method): Boolean {
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation == null) return false
    val parameters = method.parameterTypes.map { it.toString() }
    if (parameters.size != 2 || !parameters[0].startsWith("L") || parameters[1] != STRING) return false
    if (!method.returnType.startsWith("L") || method.returnType == STRING) return false
    val calls = method.body().mapNotNull { it.methodReference }
    return calls.any { it.name == "getTypeName" && it.parameterTypes.isEmpty() && it.returnType == STRING } &&
        calls.any { it.definingClass == STRING && it.name == "equals" }
}

/**
 * Whether [method] reads [DETECTED_FLAG] on the reel's attribution, in either of the shapes
 * Facebook has used: the label decision ([isLabelDecision], up to 584) or the model's attribution
 * walk ([picksAttributionForFlag], 585).
 */
internal fun readsReelDetectedFlag(method: Method, attributionType: String, modelType: String): Boolean =
    isLabelDecision(method, attributionType, modelType) || picksAttributionForFlag(method, attributionType, modelType)

/**
 * Whether [method] is Facebook's reel label decision: static, a boolean answer, the session, the
 * attribution and the model in that order, and a read of [DETECTED_FLAG] through
 * `TreeJNI.getBooleanValue`.
 */
private fun isLabelDecision(method: Method, attributionType: String, modelType: String): Boolean {
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "Z") return false
    if (method.parameterTypes.map { it.toString() } != listOf(FB_USER_SESSION, attributionType, modelType)) return false
    val body = method.body()
    return body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == treeFieldKey(DETECTED_FLAG) } &&
        body.any(::isFlagReader)
}

/**
 * Whether [method] takes the reel model alone, picks an attribution off it by `getTypeName()` and
 * reads [DETECTED_FLAG] with `TreeJNI.getBooleanValue` on a register it cast to [attributionType].
 * 585 moved the flag read out of the static decision into such a method (see the notes above), so
 * the read still has to sit on the attribution, traced back through the casts, not anywhere in it.
 */
private fun picksAttributionForFlag(method: Method, attributionType: String, modelType: String): Boolean {
    // The model alone: 585's big reel footer render (arm64 LX/09dh;->A01, 38 parameters) reads the
    // flag too, and the one decision has to stay one.
    if (method.parameterTypes.map { it.toString() } != listOf(modelType)) return false
    val body = method.body()
    // The pick: getTypeName() asked of the attribution type itself.
    if (body.none { call -> call.methodReference?.let { it.definingClass == attributionType && it.name == "getTypeName" } == true }) {
        return false
    }
    return body.indices.any { index ->
        val read = body[index]
        if (!isFlagReader(read)) return@any false
        val (receiver, key) = invokeRegisters(read).takeIf { it.size == 2 } ?: return@any false
        loadsLiteralBefore(body, index, key, treeFieldKey(DETECTED_FLAG)) && castFrom(body, index, receiver, attributionType)
    }
}

/** Whether [instruction] calls `TreeJNI.getBooleanValue(int)`. */
private fun isFlagReader(instruction: Instruction): Boolean {
    val call = instruction.methodReference ?: return false
    return call.definingClass == TREE_JNI && call.name == TREE_BOOLEAN_READER && call.returnType == "Z" &&
        call.parameterTypes.map { type -> type.toString() } == listOf("I")
}

/** The registers an invoke hands its method, in order, for both the plain and the range form. */
private fun invokeRegisters(instruction: Instruction): List<Int> = when (instruction) {
    is FiveRegisterInstruction -> listOf(
        instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG,
    ).take(instruction.registerCount)
    is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
    else -> emptyList()
}

/** Whether the last write of [register] before [index] in [body] loads [literal]. */
private fun loadsLiteralBefore(body: List<Instruction>, index: Int, register: Int, literal: Int): Boolean {
    for (at in index - 1 downTo 0) {
        val instruction = body[at]
        if (!instruction.opcode.setsRegister() || (instruction as? OneRegisterInstruction)?.registerA != register) continue
        return (instruction as? NarrowLiteralInstruction)?.narrowLiteral == literal
    }
    return false
}

/**
 * Whether [register], read at [index] in [body], was cast to [type] on its way there: walking back,
 * through other casts and `move-object` copies, to a `check-cast` to [type]. Any other write first
 * means the value came from somewhere else.
 */
private fun castFrom(body: List<Instruction>, index: Int, register: Int, type: String): Boolean {
    var wanted = register
    for (at in index - 1 downTo 0) {
        val instruction = body[at]
        if (!instruction.opcode.setsRegister() || (instruction as? OneRegisterInstruction)?.registerA != wanted) continue
        when (instruction.opcode) {
            Opcode.CHECK_CAST -> if ((instruction as ReferenceInstruction).reference.toString() == type) return true
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                wanted = (instruction as TwoRegisterInstruction).registerB
            else -> return false
        }
    }
    return false
}

/** Whether [tree] has the public instance `boolean [name](int)` the extension reads a flag with. */
internal fun hasPublicIntReader(tree: ClassDef, name: String): Boolean = tree.methods.any {
    it.name == name && it.returnType == "Z" && it.parameterTypes.map { p -> p.toString() } == listOf("I") &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
}

/**
 * Whether [tree] has the public instance `[name](int)` answering an object, the way `getTree(int)`
 * answers Facebook's Tree interface, that the extension reads a nested tree with.
 */
internal fun hasPublicTreeReader(tree: ClassDef, name: String): Boolean = tree.methods.any {
    it.name == name && it.returnType.startsWith("L") && it.parameterTypes.map { p -> p.toString() } == listOf("I") &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
}

/**
 * Stops the patch unless TreeJNI keeps the public readers the attribution's flag is read through,
 * and the one the Reels tab's items are read through.
 */
internal fun BytecodePatchContext.requireTreeReaders() {
    val tree = classDefBy(TREE_JNI)
    if (!hasPublicIntReader(tree, TREE_BOOLEAN_READER)) {
        throw PatchException("TreeJNI has no public $TREE_BOOLEAN_READER(int)")
    }
    if (!hasPublicIntReader(tree, TREE_FIELD_CHECK)) {
        throw PatchException("TreeJNI has no public $TREE_FIELD_CHECK(int)")
    }
    if (!hasPublicTreeReader(tree, TREE_READER)) {
        throw PatchException("TreeJNI has no public $TREE_READER(int)")
    }
}

/**
 * Fills in the extension's `public static Object [stubName](Object, String)` on [stubClass] with a
 * call to [finder], Facebook's own attribution finder, handing it the model cast to the finder's own
 * parameter type and the type name the extension passes.
 *
 * Only the two parameter registers are used, as [app.morphe.patches.facebook.feed.fillStoryModelStub]
 * uses only its one. The compiled stub keeps no local register: its marker goes in the register of
 * the parameter it never reads, and a fill that loaded the name into a local of its own stopped the
 * patch on both fixture builds (2026-09-26). The call names the two as a range, which no 4-bit
 * operand limits, and the model is always right below the name.
 */
internal fun BytecodePatchContext.fillFinderStub(stubClass: String, stubName: String, finder: MethodReference) {
    val stub = mutableClassDefBy(stubClass).methods.singleOrNull {
        it.name == stubName && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.returnType == OBJECT && it.parameterTypes.map { type -> type.toString() } == listOf(OBJECT, STRING)
    } ?: throw PatchException("$stubClass has no static Object $stubName(Object, String)")

    stub.addInstructions(
        0,
        """
            check-cast p0, ${finder.parameterTypes[0]}
            invoke-static/range { p0 .. p1 }, ${finder.signature()}
            move-result-object p0
            return-object p0
        """,
    )
}
