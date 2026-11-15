package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The inbox search bar's "Ask Meta AI or search" hint. */
internal const val AI_SEARCH_HINT = "ai_search_hint"

/** The test tag the inbox search bar gives its field. */
internal const val SEARCH_BAR_TAG = "search_bar"

internal const val AI_SEARCH_HINT_HELPER = "$SETTINGS->metaAiSearchHint(Z)Z"
private const val GET_STRING = "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;"

private fun hintChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the inbox search hint moved ($detail)")

/**
 * Index of the move-result that holds the Meta AI search check. The search bar builder picks its hint like this:
 *
 *     invoke-interface {vC, vSession}, <check>(FbUserSession)Z   (invoke-virtual on 583)
 *     move-result vH                                   <- true: "Ask Meta AI or search"
 *     invoke-virtual {vX}, <context>()Resources
 *     move-result-object vRes
 *     const vR, <plain hint>
 *     if-eqz vH, :pick
 *     const vR, <Meta AI hint>
 *     :pick
 *     invoke-virtual {vRes, vR}, Resources->getString(I)
 *
 * Null when the method has no such site.
 */
internal fun Method.searchHintSite(): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    for (pick in code.indices) {
        val get = code[pick] as? FiveRegisterInstruction ?: continue
        if (get.opcode != Opcode.INVOKE_VIRTUAL || (get as ReferenceInstruction).reference.toString() != GET_STRING || pick < 7) continue
        val result = pick - 6
        val check = (code[pick - 7] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        val held = (code[result] as? OneRegisterInstruction)?.registerA ?: continue
        val resources = (code[pick - 5] as? ReferenceInstruction)?.reference as? MethodReference
        val plain = code[pick - 3]
        val branch = code[pick - 2]
        val aiHint = code[pick - 1]
        if ((code[pick - 7].opcode != Opcode.INVOKE_VIRTUAL && code[pick - 7].opcode != Opcode.INVOKE_INTERFACE) || check.returnType != "Z" ||
            check.parameterTypes.map { it.toString() } != listOf(FB_USER_SESSION) || code[result].opcode != Opcode.MOVE_RESULT ||
            resources?.returnType != "Landroid/content/res/Resources;" || code[pick - 4].opcode != Opcode.MOVE_RESULT_OBJECT ||
            (code[pick - 4] as OneRegisterInstruction).registerA != get.registerC ||
            plain.opcode != Opcode.CONST || aiHint.opcode != Opcode.CONST ||
            (plain as OneRegisterInstruction).registerA != get.registerD || (aiHint as OneRegisterInstruction).registerA != get.registerD ||
            branch.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != held || code.branchTarget(pick - 2) != pick) continue
        return result
    }
    return null
}

internal fun Method.isSearchBarBuilder(): Boolean =
    implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SEARCH_BAR_TAG } == true &&
        searchHintSite() != null

/** The one search bar builder, or none when more than one method looks like it. */
internal fun findAiSearchHint(classes: Iterable<ClassDef>): List<Method> =
    searchBarBuilders.methods(classes).let { if (it.size == 1) it else emptyList() }

internal val searchBarBuilders = MethodCheck {
    val tag = StringMatch(SEARCH_BAR_TAG)
    val test: MethodTest = { _, method -> tag.inCode(method) && method.searchHintSite() != null }
    test
}

internal fun MutableMethod.validateAiSearchHint(): Int {
    if (!isSearchBarBuilder()) hintChanged("unexpected search bar ${hookId()}")
    val result = searchHintSite()!!
    // Only the read itself may reach the check's answer, or a path could skip the extension.
    if ((result + 1) in jumpTargets()) hintChanged("a jump past the Meta AI check")
    return result
}

/**
 * Passes the Meta AI check through the extension right after the builder reads it. With the switch on it answers false,
 * the answer accounts without Meta AI in search get, so the bar shows Messenger's plain hint.
 */
internal fun MutableMethod.injectAiSearchHint() = injectHintHelper(validateAiSearchHint())

private fun MutableMethod.injectHintHelper(result: Int) {
    val held = (implementation!!.instructions.elementAt(result) as OneRegisterInstruction).registerA
    addInstructions(result + 1, """
        invoke-static/range {v$held .. v$held}, $AI_SEARCH_HINT_HELPER
        move-result v$held
    """.trimIndent())
}

/** The search screen's own "Ask Meta AI or search" box, the one the inbox bar opens. */
internal const val AI_SEARCH_SCREEN_HINT = "ai_search_screen_hint"

/** The Meta AI check and the two hint ids the inbox bar picks between. */
internal data class SearchHints(val check: String, val plain: Int, val metaAi: Int)

internal fun Method.searchHints(): SearchHints? {
    val result = searchHintSite() ?: return null
    val code = implementation!!.instructions.toList()
    return SearchHints((code[result - 1] as ReferenceInstruction).reference.toString(),
        (code[result + 3] as NarrowLiteralInstruction).narrowLiteral, (code[result + 5] as NarrowLiteralInstruction).narrowLiteral)
}

private fun screenHintChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the search screen's hint moved ($detail)")

private fun Instruction.hintWrites(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

/** Resources.getString(id), or a static helper taking (Resources, id) that returns the string, with the id in [hint]. */
private fun Instruction.readsHint(hint: Int): Boolean {
    val call = this as? FiveRegisterInstruction ?: return false
    val target = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    if (call.registerCount != 2 || call.registerD != hint) return false
    return (opcode == Opcode.INVOKE_VIRTUAL && target.toString() == GET_STRING) || (opcode == Opcode.INVOKE_STATIC &&
        target.returnType == "Ljava/lang/String;" && target.parameterTypes.map { it.toString() } == listOf("Landroid/content/res/Resources;", "I"))
}

/**
 * Index of the move-result that holds the Meta AI check on the search screen. Its header picks the box's hint like this:
 *
 *     invoke-interface {vC, vSession}, <check>(FbUserSession)Z
 *     move-result vH                                   <- true: "Ask Meta AI or search"
 *     ...                                              (up to six lines that leave vH alone)
 *     const vR, <Meta AI hint>
 *     if-nez vH, :read
 *     const vR, <plain hint>
 *     :read
 *     invoke-static {vRes, vR}, <getString>(Resources, I)String
 *
 * With [hints], the check and both ids must be the inbox bar's. Null when the method has no such site.
 */
internal fun Method.searchScreenHintSite(hints: SearchHints? = null): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    for (result in 1 until code.size) {
        if (code[result].opcode != Opcode.MOVE_RESULT) continue
        val call = code[result - 1]
        val check = (call as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if ((call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_INTERFACE) ||
            check.returnType != "Z" || check.parameterTypes.map { it.toString() } != listOf(FB_USER_SESSION) ||
            (hints != null && check.toString() != hints.check)) continue
        val held = (code[result] as OneRegisterInstruction).registerA
        for (aiHint in result + 1..minOf(result + 7, code.size - 4)) {
            if (aiHint > result + 1 && code[aiHint - 1].hintWrites(held)) break
            val ai = code[aiHint]
            val branch = code[aiHint + 1]
            val plain = code[aiHint + 2]
            if (ai.opcode != Opcode.CONST || branch.opcode != Opcode.IF_NEZ || plain.opcode != Opcode.CONST) continue
            val hint = (ai as OneRegisterInstruction).registerA
            // A hint loaded into the check's own register would overwrite the result before the branch reads it.
            if (hint == held || (plain as OneRegisterInstruction).registerA != hint || (branch as OneRegisterInstruction).registerA != held ||
                code.branchTarget(aiHint + 1) != aiHint + 3 || !code[aiHint + 3].readsHint(hint)) continue
            if (hints != null && ((ai as NarrowLiteralInstruction).narrowLiteral != hints.metaAi ||
                    (plain as NarrowLiteralInstruction).narrowLiteral != hints.plain)) continue
            return result
        }
    }
    return null
}

/**
 * The methods with a site of that shape for any check and hints. A site for the bar's own check and hints is one of
 * them, since the hints only add reasons to pass a spot over.
 */
internal val searchScreenHintShapes = methodCheck { _, method -> method.searchScreenHintSite() != null }

/** The one method that picks between the inbox bar's two hints on the bar's Meta AI check, or none when it's unclear. */
internal fun findAiSearchScreenHint(classes: Iterable<ClassDef>, bars: List<Method> = findAiSearchHint(classes)): List<Method> {
    val hints = bars.singleOrNull()?.searchHints() ?: return emptyList()
    return searchScreenHintShapes.methods(classes).filter { it.searchScreenHintSite(hints) != null }.let { if (it.size == 1) it else emptyList() }
}

internal fun MutableMethod.validateAiSearchScreenHint(): Int {
    val result = searchScreenHintSite() ?: screenHintChanged("unexpected search screen ${hookId()}")
    // Same as the bar: nothing may jump in between the check and the extension.
    if ((result + 1) in jumpTargets()) screenHintChanged("a jump past the Meta AI check")
    return result
}

/** Answers the search screen's Meta AI check through the same extension call as the inbox bar, so both boxes agree. */
internal fun MutableMethod.injectAiSearchScreenHint() = injectHintHelper(validateAiSearchScreenHint())
