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

/** Meta's server flag for the redesigned emoji drawer as 586 numbers it (585 read 36320528377659062). Meta renumbers it with each release. */
internal const val EMOJI_DRAWER_FLAG = 36320416708509435L

/** The drawer renderer throws this when the redesign can't draw. It's what ties the flag to the emoji drawer. */
internal const val EMOJI_DRAWER_ANCHOR = "Cannot render redesigned drawer with search icon "

internal const val EMOJI_DRAWER_HELPER = "$SETTINGS->redesignedEmojiDrawer(Z)Z"

private val FLAG_CHECKS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL)

internal fun Instruction.isEmojiDrawerFlag() =
    opcode == Opcode.CONST_WIDE && (this as? WideLiteralInstruction)?.wideLiteral == EMOJI_DRAWER_FLAG

/**
 * Every method that reads the redesign flag, but only when the one renderer that throws [EMOJI_DRAWER_ANCHOR] reads it
 * too, itself or through a call to a [isEmojiDrawerGetter] reader. Without that link nothing is found, so the switch
 * can't patch an unrelated flag. A static getter is called by its own id. Family B's getter is an instance method the
 * renderer reaches through an interface of its class, which [interfaces] lists by the reader's class.
 */
internal fun connectEmojiDrawer(readers: List<Method>, anchors: List<Method>, interfaces: Map<String, List<String>> = emptyMap()): List<Method> {
    val anchor = anchors.singleOrNull() ?: return emptyList()
    val (static, instance) = readers.filter { it.isEmojiDrawerGetter() }.partition { AccessFlags.STATIC.isSet(it.accessFlags) }
    val getters = static.map { it.hookId() }.toSet()
    val shared = instance.flatMap { getter -> interfaces[getter.definingClass].orEmpty().map { "$it->${getter.name}()Z" } }.toSet()
    val linked = readers.any { it.hookId() == anchor.hookId() } || anchor.implementation?.instructions?.any {
        (it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() in getters) ||
            (it.opcode == Opcode.INVOKE_INTERFACE && (it as ReferenceInstruction).reference.toString() in shared)
    } == true
    return if (linked) readers.distinctBy { it.hookId() } else emptyList()
}

/**
 * 586's renderer asks a ()Z getter instead of reading the flag. The getter has to be the read alone: the config object,
 * the one flag read, and its answer returned as is. The config comes from a no-argument static call, or in family B
 * from a static (I)Object call on a constant, cast.
 */
internal fun Method.isEmojiDrawerGetter(): Boolean {
    if (returnType != "Z" || parameterTypes.isNotEmpty()) return false
    val code = implementation?.instructions?.toList() ?: return false
    val site = try { emojiDrawerSites().singleOrNull() } catch (_: PatchException) { null } ?: return false
    val back = code.getOrNull(site.result + 1)
    return site.flag == (code.configFetch() ?: return false) && code.size == site.result + 2 &&
        back?.opcode == Opcode.RETURN && (back as OneRegisterInstruction).registerA == site.register
}

/** How many instructions fetch the config object at the start, or null when it isn't fetched one of the two ways. */
private fun List<Instruction>.configFetch(): Int? {
    val first = getOrNull(0)
    if (first is FiveRegisterInstruction && first.opcode == Opcode.INVOKE_STATIC && first.registerCount == 0 &&
        getOrNull(1)?.opcode == Opcode.MOVE_RESULT_OBJECT) return 2
    val call = getOrNull(1) as? FiveRegisterInstruction ?: return null
    val target = (call as ReferenceInstruction).reference as? MethodReference ?: return null
    val taken = getOrNull(2) as? OneRegisterInstruction ?: return null
    val cast = getOrNull(3) as? OneRegisterInstruction ?: return null
    return 4.takeIf {
        first?.opcode == Opcode.CONST && call.opcode == Opcode.INVOKE_STATIC && call.registerCount == 1 &&
            call.registerC == (first as OneRegisterInstruction).registerA && target.parameterTypes.map { it.toString() } == listOf("I") &&
            target.returnType == "Ljava/lang/Object;" && taken.opcode == Opcode.MOVE_RESULT_OBJECT &&
            cast.opcode == Opcode.CHECK_CAST && cast.registerA == taken.registerA
    }
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
