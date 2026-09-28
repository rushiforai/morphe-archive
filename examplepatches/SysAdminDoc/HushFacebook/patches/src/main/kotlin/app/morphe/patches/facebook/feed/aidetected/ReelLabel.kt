/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.reels.FB_USER_SESSION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
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
 * - That attribution carries was_detected_as_ai_generated (0x723ea5fe) as a boolean of its own,
 *   beside was_self_disclosed_as_ai_generated (0xbc6e7b43) and gen_ai_detected_transparency_type.
 *   The viewer's decision whether to draw the label (580 LX/Axm;->A01, 577 LX/B0Q;->A01) is
 *   static, takes the session, the attribution and the model, answers a boolean, and reads the
 *   flag with TreeJNI.getBooleanValue, the kept reader the extension calls too. The patch holds the
 *   build to that decision, so it stops if the flag's home moves.
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
 * The static calls in [method] that are handed [TRANSPARENCY_ATTRIBUTION] as a String argument:
 * from each load of the literal, every static invoke passing its register in a String parameter's
 * place, until something writes that register again.
 */
internal fun finderCalls(method: Method): List<MethodReference> {
    val body = method.body()
    val calls = mutableListOf<MethodReference>()
    for ((index, load) in body.withIndex()) {
        if (load.string != TRANSPARENCY_ATTRIBUTION) continue
        val literal = (load as OneRegisterInstruction).registerA
        for (next in body.subList(index + 1, body.size)) {
            val registers = argumentRegisters(next)
            val call = next.methodReference
            if (call != null && next.opcode.name.startsWith("invoke-static") && literal in registers) {
                val at = registers.indexOf(literal)
                if (call.parameterTypes.getOrNull(at)?.toString() == STRING) calls += call
            }
            if (writes(next, literal)) break
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
 * The attribution finder among [holders], the methods loading [TRANSPARENCY_ATTRIBUTION]: every
 * static call the literal is handed to has to be the same method, taking the reel model and the
 * name and answering a model. Two different ones would mean the rule no longer knows which finds
 * the attribution.
 *
 * A holder in the extension doesn't count. The patcher searches the APK with the extension merged
 * in, and the reel filter hands the same literal to its own stub, which both fixture builds counted
 * as a second finder until this left it out (2026-09-26).
 */
internal fun attributionFinder(holders: List<Method>): Finder {
    val calls = holders.filterNot { it.definingClass.startsWith(EXTENSION_CLASSES) }.flatMap(::finderCalls)
    if (calls.isEmpty()) {
        return Finder(null, "no method holding \"$TRANSPARENCY_ATTRIBUTION\" hands it to a static call as a String")
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
 * Whether [method] is Facebook's reel label decision: static, a boolean answer, the session, the
 * attribution and the model in that order, and a read of [DETECTED_FLAG] through
 * `TreeJNI.getBooleanValue`.
 */
internal fun readsReelDetectedFlag(method: Method, attributionType: String, modelType: String): Boolean {
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "Z") return false
    if (method.parameterTypes.map { it.toString() } != listOf(FB_USER_SESSION, attributionType, modelType)) return false
    val body = method.body()
    return body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == treeFieldKey(DETECTED_FLAG) } &&
        body.any {
            val call = it.methodReference
            call?.definingClass == TREE_JNI && call.name == TREE_BOOLEAN_READER && call.returnType == "Z" &&
                call.parameterTypes.map { type -> type.toString() } == listOf("I")
        }
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
