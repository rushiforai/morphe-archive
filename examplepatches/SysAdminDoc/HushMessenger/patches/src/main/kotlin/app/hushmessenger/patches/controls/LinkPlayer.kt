package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

internal const val LINK_PLAYER = "link_player"

private const val LINK_CONTEXT = "Landroid/content/Context;"
private const val LINK_URI = "Landroid/net/Uri;"

/** Takes the tapped link and the screen it was tapped on, and says whether Hush has it playing. */
internal const val LINK_PLAYER_HELPER = "$SETTINGS->playVideoLink(${LINK_CONTEXT}${LINK_URI})Z"

/**
 * The opener every link inside Messenger funnels into: the tap on a link in a message goes through the message
 * handler, the taps everywhere else through the one-line wrapper, and both land here with the link as the second
 * argument. Sitting here rather than on the in-app browser's own entry means a link headed for the system browser
 * (which `Open web links externally` sends it to) passes the switch first, so the two controls can't fight.
 */
private val CHAT_LINK_PARAMS = listOf(LINK_CONTEXT, LINK_URI, LINK_URI, FB_USER_SESSION, MESSAGE, THREAD_KEY_TYPE)

internal fun Method.isChatLinkOpen(): Boolean {
    if (returnType != "V") return false
    val params = parameterTypes.map { it.toString() }
    return params.size == 7 && params.take(6) == CHAT_LINK_PARAMS && params[6].startsWith("L")
}

/**
 * The browser launcher's own void entries, for the screens that ask it to open a link without going through the message
 * handler at all. There are two on every tested build: the instance one the message handler's neighbours call, and a
 * static one that takes a launcher of its own and answers about 22 screens' taps. Both take the screen, the link and
 * the session in that order, so one gate serves them.
 */
internal fun Method.isBrowserLaunch(): Boolean {
    if (definingClass != MESSENGER_BROWSER_LAUNCHER || returnType != "V") return false
    val params = parameterTypes.map { it.toString() }
    return params.size == 5 && params.take(3) == listOf(LINK_CONTEXT, LINK_URI, FB_USER_SESSION) &&
        params.drop(3).all { it.startsWith("L") }
}

/** Where the screen sits: a static opener carries it in p0, an instance one behind the receiver in p1. */
private fun Method.screenRegister(): Int = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1

internal fun findLinkPlayer(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isChatLinkOpen() || it.isBrowserLaunch() }

private fun linkChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the link opener no longer matches the tested build ($detail)")

/**
 * Every opener hands the screen over as its first argument and the link as its second, in that order and one register
 * each, which is what the gate reads. A method the build reshaped is refused rather than opened blind.
 */
internal fun MutableMethod.validateLinkPlayer() {
    if (!isChatLinkOpen() && !isBrowserLaunch()) linkChanged("opener ${hookId()}")
    validateScratch()
    // Writing the answer into a local register ahead of a target the method jumps back to would change that register's
    // type where the two paths meet. No tested build jumps to its own first instruction, and one that did is refused.
    if (0 in jumpTargets()) linkChanged("the opener starts on a jump target (${hookId()})")
}

/**
 * The link goes past the extension on its way to Messenger's opener. It comes back yes only when the switch is on, the
 * link is one of the four platforms' video pages and the player is on screen, and then the opener returns without
 * having run: no in-app browser, no handoff to another app, nothing logged about the tap. Every other answer, the
 * switch being off and safe mode included, leaves the opener to run exactly as Messenger wrote it.
 */
internal fun MutableMethod.injectLinkPlayer() {
    validateLinkPlayer()
    val screen = screenRegister()
    // A range call, since the openers carry their arguments high enough that a plain invoke-static can't reach them.
    addInstructionsWithLabels(0, """
        invoke-static/range {p$screen .. p${screen + 1}}, $LINK_PLAYER_HELPER
        move-result v0
        if-eqz v0, :stock_open
        return-void
    """.trimIndent(), ExternalLabel("stock_open", getInstruction(0)))
}
