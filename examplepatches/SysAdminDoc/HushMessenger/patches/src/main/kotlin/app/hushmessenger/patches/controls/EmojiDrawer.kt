/*
 * The redesigned emoji drawer anchor is adapted from ReVanced merge request !6833 (Messenger, "Restore old emoji
 * drawer"). GPL-3.0. See NOTICE.
 */
package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EMOJI_DRAWER = "emoji_drawer"

/** Meta's server flag for the redesigned emoji drawer, renumbered by each release: 580's, 581's, then 582's. */
internal val EMOJI_DRAWER_FLAGS = setOf(36320734536089357L, 36320704471318256L, 36320652931710646L)

/** The drawer renderer throws this when the redesign can't draw. It's what ties the flag to the emoji drawer. */
internal const val EMOJI_DRAWER_ANCHOR = "Cannot render redesigned drawer with search icon "

internal const val EMOJI_DRAWER_HELPER = "$SETTINGS->redesignedEmojiDrawer(Z)Z"

private val FLAG_CHECKS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL)

internal fun Instruction.isEmojiDrawerFlag() =
    opcode == Opcode.CONST_WIDE && (this as? WideLiteralInstruction)?.wideLiteral in EMOJI_DRAWER_FLAGS

/**
 * Every method that reads the redesign flag, but only when the one renderer that throws [EMOJI_DRAWER_ANCHOR] reads it
 * too: itself (581) or through a static no-argument boolean that does (580's MobileConfigUnsafeContext helper, which
 * every drawer component calls). Without that link nothing is found, so the switch can't patch an unrelated flag.
 */
internal fun connectEmojiDrawer(readers: List<Method>, anchors: List<Method>): List<Method> {
    val anchor = anchors.singleOrNull() ?: return emptyList()
    val ids = readers.map { it.hookId() }.toSet()
    val helpers = readers.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }.map { it.hookId() }.toSet()
    val connected = anchor.hookId() in ids || anchor.implementation?.instructions?.any {
        it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() in helpers
    } == true
    return if (connected) readers.distinctBy { it.hookId() } else emptyList()
}

/** One flag read: the constant's index, the move-result that takes the answer and the register it fills. */
internal class EmojiDrawerSite(val flag: Int, val result: Int, val register: Int)

/**
 * Each read loads the flag into a register pair, may cast the config object held in another register, passes the pair
 * as the last argument of a boolean (J)Z check and moves the answer into a register. Nothing may jump into that
 * sequence, so the answer always comes from the flag. Any other use of the constant refuses the whole switch.
 */
internal fun Method.emojiDrawerSites(): List<EmojiDrawerSite> {
    fun refuse(): Nothing = throw PatchException("Messenger controls: the emoji drawer flag read in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    val targets = jumpTargets()
    val sites = code.indices.filter { code[it].isEmojiDrawerFlag() }.map { at ->
        val pair = (code[at] as OneRegisterInstruction).registerA
        var call = at + 1
        val cast = code.getOrNull(call)
        if (cast?.opcode == Opcode.CHECK_CAST) {
            val held = (cast as OneRegisterInstruction).registerA
            if (held == pair || held == pair + 1) refuse()
            call++
        }
        val invoke = code.getOrNull(call) as? FiveRegisterInstruction ?: refuse()
        val check = (invoke as? ReferenceInstruction)?.reference as? MethodReference ?: refuse()
        val arguments = listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG)
            .take(invoke.registerCount)
        val result = code.getOrNull(call + 1)
        if (invoke.opcode !in FLAG_CHECKS || check.returnType != "Z" || check.parameterTypes.lastOrNull()?.toString() != "J" ||
            arguments.size < 2 || arguments.takeLast(2) != listOf(pair, pair + 1) ||
            result?.opcode != Opcode.MOVE_RESULT || (at + 1..call + 1).any { it in targets }) refuse()
        EmojiDrawerSite(at, call + 1, (result as OneRegisterInstruction).registerA)
    }
    if (sites.isEmpty()) refuse()
    return sites
}

internal fun MutableMethod.validateEmojiDrawer() {
    emojiDrawerSites()
}

/** Each answer passes through the extension, which can only turn a yes into a no. Later reads go first. */
internal fun MutableMethod.injectEmojiDrawer() {
    for (site in emojiDrawerSites().asReversed()) addInstructions(site.result + 1, """
        invoke-static/range {v${site.register} .. v${site.register}}, $EMOJI_DRAWER_HELPER
        move-result v${site.register}
    """.trimIndent())
}
