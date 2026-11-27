package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * #198: only + stays beside the message box, and the camera, gallery and mic buttons become rows in the menu + opens. The
 * extension finds the bar and the menu from the chat's own views, so the switch rides the handover the jump menu already
 * takes instead of fingerprinting the composer.
 */
internal const val CHAT_BAR_PLUS = "chat_bar_plus"
internal const val CHAT_BAR_PLUS_CALL =
    "Lapp/hushmessenger/extension/ChatBarPlus;->chatShown(Ljava/lang/Object;Landroid/view/View;)V"

/** Hands the chat fragment and its new view to the extension, first thing in the handover. */
internal fun MutableMethod.injectChatBarPlus() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $CHAT_BAR_PLUS_CALL")
}

/**
 * #241: 588 draws the chat bar in Litho, so the views [CHAT_BAR_PLUS] looks for never turn up there. Messenger has the
 * move built in behind a server test instead. With the test's flag on, a chat's bar hands the camera to the menu + opens,
 * and with the gallery's and the mic's own flags on too, those two go with it. The menu's builder then adds a Camera, a
 * Gallery and a Voice row for them. The switch turns those three flags on wherever Messenger reads them: the check every
 * chat asks, the menu's builder, the bar's answer for each button and the mic's composer setup. The test's flag is the
 * same on every 588 build.
 */
internal const val CHAT_BAR_PLUS_MENU = "chat_bar_plus_menu"
internal const val CHAT_BAR_MENU_FLAG = 0x10104dc000740e7L
internal const val CHAT_BAR_GALLERY_FLAG = 0x10104dc000f40e8L
internal const val CHAT_BAR_VOICE_FLAG = 0x10104dc001440ebL
internal const val CHAT_BAR_PLUS_MENU_CALL = "Lapp/hushmessenger/extension/ChatBarPlus;->menuFlag(I)Z"

private val CHAT_BAR_MENU_FLAGS = setOf(CHAT_BAR_MENU_FLAG, CHAT_BAR_GALLERY_FLAG, CHAT_BAR_VOICE_FLAG)

/** The upload notices of the menu's camera and voice rows. Only the + menu's builder loads them. */
private val CHAT_BAR_MENU_NOTICES = setOf("upload_video_interstitial", "upload_audio_interstitial")

/** One flag read: which flag, the move-result that takes the answer and the register it fills. */
internal class ChatBarMenuSite(val flag: Long, val result: Int, val register: Int)

private fun Method.readsChatBarMenuFlag() = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral in CHAT_BAR_MENU_FLAGS
} == true

internal val chatBarMenuReaders = methodCheck { _, method -> method.readsChatBarMenuFlag() }

/**
 * Each read loads its flag into a register pair, casts the config to the check's interface, passes the pair as the last
 * two arguments of that interface's boolean (…J) check on the cast register and moves the answer into a register.
 * Nothing may jump into that sequence or onto the instruction after it, so the answer the switch sees is the flag's and
 * every path past the read takes the switch's. Any other shape, or a method with no read, refuses the switch.
 */
internal fun Method.chatBarMenuSites(): List<ChatBarMenuSite> {
    fun refuse(): Nothing = throw PatchException("Messenger controls: the chat bar's + menu check in ${hookId()} no longer matches the tested build")
    val code = implementation?.instructions?.toList() ?: refuse()
    val targets = jumpTargets()
    val sites = code.indices.filter { at ->
        code[at].opcode == Opcode.CONST_WIDE && (code[at] as WideLiteralInstruction).wideLiteral in CHAT_BAR_MENU_FLAGS
    }.map { at ->
        val pair = (code[at] as OneRegisterInstruction).registerA
        val cast = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.CHECK_CAST } ?: refuse()
        val invoke = code.getOrNull(at + 2) as? FiveRegisterInstruction ?: refuse()
        val check = (invoke as ReferenceInstruction).reference as? MethodReference ?: refuse()
        val arguments = listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG).take(invoke.registerCount)
        val result = code.getOrNull(at + 3)
        if (invoke.opcode != Opcode.INVOKE_INTERFACE || arguments.size < 3 || arguments.first() != (cast as OneRegisterInstruction).registerA ||
            (cast as ReferenceInstruction).reference.toString() != check.definingClass || check.returnType != "Z" ||
            check.parameterTypes.lastOrNull()?.toString() != "J" || arguments.takeLast(2) != listOf(pair, pair + 1) ||
            result?.opcode != Opcode.MOVE_RESULT || code.getOrNull(at + 4) == null || (at + 1..at + 4).any { it in targets }) refuse()
        ChatBarMenuSite((code[at] as WideLiteralInstruction).wideLiteral, at + 3, (result as OneRegisterInstruction).registerA)
    }
    if (sites.isEmpty()) refuse()
    return sites
}

private fun Method.loadsEveryNotice() = implementation?.instructions?.mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}?.toSet()?.containsAll(CHAT_BAR_MENU_NOTICES) == true

/**
 * Every method that reads one of the three flags, taken only as one set: every read has the tested shape, the one reader
 * that loads both upload notices (the + menu's builder) reads the gallery and mic flags once each and never the test's,
 * and the test's flag is read once, alone, in a check the builder calls.
 */
internal fun findChatBarPlusMenu(classes: Iterable<ClassDef>): List<Method> {
    val readers = chatBarMenuReaders.methods(classes).distinctBy { it.hookId() }
    val flags = readers.map { reader -> runCatching { reader.chatBarMenuSites() }.getOrNull()?.map { it.flag } ?: return emptyList() }
    val builder = readers.indices.singleOrNull { readers[it].loadsEveryNotice() } ?: return emptyList()
    if (flags[builder].count { it == CHAT_BAR_GALLERY_FLAG } != 1 || flags[builder].count { it == CHAT_BAR_VOICE_FLAG } != 1 ||
        CHAT_BAR_MENU_FLAG in flags[builder]) return emptyList()
    val test = flags.indices.singleOrNull { CHAT_BAR_MENU_FLAG in flags[it] } ?: return emptyList()
    if (flags[test] != listOf(CHAT_BAR_MENU_FLAG)) return emptyList()
    val testId = readers[test].hookId()
    if (readers[builder].implementation!!.instructions.none { (it as? ReferenceInstruction)?.reference?.toString() == testId }) return emptyList()
    return readers
}

internal fun MutableMethod.validateChatBarPlusMenu() {
    chatBarMenuSites()
}

/**
 * Each answer passes through the extension, which can only turn a no into a yes. Everything after it runs as Messenger
 * wrote it, so a chat the test leaves out (Marketplace, for one) keeps its bar. Later reads go first.
 */
internal fun MutableMethod.injectChatBarPlusMenu() {
    for (site in chatBarMenuSites().asReversed()) addInstructions(site.result + 1, """
        invoke-static/range {v${site.register} .. v${site.register}}, $CHAT_BAR_PLUS_MENU_CALL
        move-result v${site.register}
    """.trimIndent())
}
