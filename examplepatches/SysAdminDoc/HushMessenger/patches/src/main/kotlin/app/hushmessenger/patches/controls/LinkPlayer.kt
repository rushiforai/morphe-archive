package app.hushmessenger.patches.controls

import app.hushmessenger.patches.coexist.INSTAGRAM_LINK_TAG
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

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

private const val LINK_INTENT = "Landroid/content/Intent;"
private const val INSTAGRAM_APP = "com.instagram.android"

/** The Bloks action a shared link's preview card runs when it's tapped, by the name it checks its link under. */
internal const val BLOKS_OPEN_URL = "com.facebook.bloks.messenger.implementations.plugins.core.openurl.BloksOpenURLImplementation"
private const val NEW_INTENT_FOR_LINK = "$LINK_INTENT-><init>(Ljava/lang/String;$LINK_URI)V"
private const val INTENT_ADD_CATEGORY = "$LINK_INTENT->addCategory(Ljava/lang/String;)$LINK_INTENT"

/** How far the card's launch block may run, gotos followed, before it reaches the launcher. Both families take 17. */
private const val BLOKS_LAUNCH_WALK = 40

private fun Method.linkStrings(): Set<String> = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()

private fun Instruction.linkCall(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * Instagram's own hand-off, which a card for an instagram.com link (and the message handler's Instagram branch) calls
 * with the screen and the unwrapped link: it hands the link to the Instagram app as a VIEW for its package, and to the
 * browser when no Instagram app is installed. It is the whole method on every tested build, named by the tag it reports
 * a failed launch under, so the gate sits at its entry like the openers'.
 */
internal fun Method.isInstagramLinkLaunch(): Boolean =
    returnType == "V" && !AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.map { it.toString() } == listOf(LINK_CONTEXT, LINK_URI) &&
        linkStrings().let { INSTAGRAM_LINK_TAG in it && INSTAGRAM_APP in it }

/** The Bloks open-URL action's run method: an instance method taking the screen, the Bloks context and a number. */
internal fun Method.isBloksLinkOpen(): Boolean {
    if (returnType != "V" || AccessFlags.STATIC.isSet(accessFlags)) return false
    val params = parameterTypes.map { it.toString() }
    return params.size == 3 && params[0] == LINK_CONTEXT && params[1].startsWith("L") && params[2] == "Ljava/lang/Integer;" &&
        BLOKS_OPEN_URL in linkStrings()
}

/**
 * The block of the Bloks action that sends any other http or https link out of Messenger, TikTok's among them: it starts
 * where the scheme checks jump to, builds a VIEW intent from the link, adds the default and browsable categories and
 * goes to the action's one launch call. [screen] is the launch call's Context register, [link] the register the intent
 * is built from and [scratch] the one the intent lands in, all three read off the stock instructions.
 */
internal class BloksLaunchSite(val start: Int, val screen: Int, val link: Int, val scratch: Int)

/**
 * The intent built from the link at [start], as the link's register and the register the intent lands in: a new Intent
 * given the action and the link (347617503's family), or a static helper taking the link and the action (347617497's).
 */
private fun List<Instruction>.intentFromLink(start: Int): Pair<Int, Int>? {
    val first = getOrNull(start) ?: return null
    if (first.opcode == Opcode.NEW_INSTANCE) {
        if (((first as ReferenceInstruction).reference as? TypeReference)?.type != LINK_INTENT) return null
        val intent = (first as OneRegisterInstruction).registerA
        val built = getOrNull(start + 1) as? FiveRegisterInstruction ?: return null
        if (built.opcode != Opcode.INVOKE_DIRECT || built.linkCall()?.toString() != NEW_INTENT_FOR_LINK ||
            built.registerCount != 3 || built.registerC != intent) return null
        return built.registerE to intent
    }
    val call = first.linkCall() ?: return null
    if (first.opcode != Opcode.INVOKE_STATIC || call.returnType != LINK_INTENT ||
        call.parameterTypes.map { it.toString() } != listOf(LINK_URI, "Ljava/lang/String;")) return null
    val result = getOrNull(start + 1) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val intent = (result as OneRegisterInstruction).registerA
    first as FiveRegisterInstruction
    // The gate writes its answer into the intent's register before this call reads its two arguments.
    if (intent == first.registerC || intent == first.registerD) return null
    return first.registerC to intent
}

/** The launch block starting at [start], walked to the launch call with its gotos followed, or null when it isn't one. */
private fun List<Instruction>.bloksLaunchFrom(start: Int): BloksLaunchSite? {
    val (link, scratch) = intentFromLink(start) ?: return null
    val written = mutableSetOf<Int>()
    var categories = 0
    var at = start
    repeat(BLOKS_LAUNCH_WALK) {
        val instruction = getOrNull(at) ?: return null
        val call = instruction.linkCall()
        if (instruction.opcode == Opcode.INVOKE_VIRTUAL && call != null && call.returnType == "Z" &&
            call.parameterTypes.map { it.toString() } == listOf(LINK_CONTEXT, LINK_INTENT)) {
            val screen = (instruction as FiveRegisterInstruction).registerD
            // The gate reads the screen at the block's start, so the block must leave it as it found it.
            if (categories != 2 || screen in written || screen > 15 || link > 15) return null
            return BloksLaunchSite(start, screen, link, scratch)
        }
        when (instruction.opcode) {
            Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> {
                at = branchTarget(at)
                if (at < 0) return null
                return@repeat
            }
            Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW -> return null
            else -> if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) return null
        }
        if (call?.toString() == INTENT_ADD_CATEGORY) categories++
        if (instruction.opcode.setsRegister() && instruction is OneRegisterInstruction) {
            written += instruction.registerA
            if (instruction.opcode.setsWideRegister()) written += instruction.registerA + 1
        }
        at++
    }
    return null
}

/** The Bloks action's one external launch block, or null when the method isn't the action or holds none or several. */
internal fun Method.bloksLaunchSite(): BloksLaunchSite? {
    if (!isBloksLinkOpen()) return null
    val code = implementation!!.instructions.toList()
    return jumpTargets().sorted().mapNotNull { code.bloksLaunchFrom(it) }.singleOrNull()
}

/** A method that already asks the extension, which a second pass leaves alone. */
private fun Method.linkPlayerHooked(): Boolean =
    implementation?.instructions?.any { it.linkCall()?.toString() == LINK_PLAYER_HELPER } == true

internal fun findLinkPlayer(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter {
        it.isChatLinkOpen() || it.isBrowserLaunch() || it.isInstagramLinkLaunch() || it.bloksLaunchSite() != null
    }

private fun linkChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the link opener no longer matches the tested build ($detail)")

/**
 * Every opener hands the screen over as its first argument and the link as its second, in that order and one register
 * each, which is what the gate reads. A method the build reshaped is refused rather than opened blind. The Bloks action
 * is checked by its launch block instead, since its link is a field and its gate sits inside it.
 */
internal fun MutableMethod.validateLinkPlayer() {
    if (isBloksLinkOpen()) {
        validateScratch()
        if (!linkPlayerHooked()) bloksLaunchSite() ?: linkChanged("the card's external launch in ${hookId()}")
        return
    }
    if (!isChatLinkOpen() && !isBrowserLaunch() && !isInstagramLinkLaunch()) linkChanged("opener ${hookId()}")
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
    if (linkPlayerHooked()) return
    if (isBloksLinkOpen()) return injectBloksLinkPlayer()
    val screen = screenRegister()
    // A range call, since the openers carry their arguments high enough that a plain invoke-static can't reach them.
    addInstructionsWithLabels(0, """
        invoke-static/range {p$screen .. p${screen + 1}}, $LINK_PLAYER_HELPER
        move-result v0
        if-eqz v0, :stock_open
        return-void
    """.trimIndent(), ExternalLabel("stock_open", getInstruction(0)))
}

/**
 * The card's link goes past the extension where the action is about to build the intent that leaves Messenger, so the
 * scheme checks, Messenger's own deep links and the Instagram, Threads and Meta AI hand-offs ahead of it run as before.
 * The branches that jump to the block land on the gate, and a no lets the block run exactly as Messenger wrote it.
 */
private fun MutableMethod.injectBloksLinkPlayer() {
    val site = bloksLaunchSite() ?: linkChanged("the card's external launch in ${hookId()}")
    addInstructionsAtControlFlowLabel(site.start, """
        invoke-static {v${site.screen}, v${site.link}}, $LINK_PLAYER_HELPER
        move-result v${site.scratch}
        if-eqz v${site.scratch}, :stock_launch
        return-void
    """.trimIndent(), ExternalLabel("stock_launch", getInstruction(site.start)))
}
