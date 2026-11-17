/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.proxymenu

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val DO_NOT_DISTURB = "$EXTENSION_PACKAGE/misc/DoNotDisturb;"
internal const val DND_MENU_HOOK = "$DO_NOT_DISTURB->menu(Ljava/lang/Object;)V"
internal const val DND_QUIET = "$DO_NOT_DISTURB->quiet()Z"
internal const val DND_CHAT_SOUND = "$DO_NOT_DISTURB->chatSound(I)Z"
internal const val NOTIFICATIONS_CONTROLLER = "Lorg/telegram/messenger/NotificationsController;"
internal const val IN_CHAT_SOUND = "$NOTIFICATIONS_CONTROLLER->inChatSoundEnabled:Z"
internal const val PUSH_MESSAGES = "$NOTIFICATIONS_CONTROLLER->pushMessages:Ljava/util/ArrayList;"
internal const val DISMISS_NOTIFICATION = "$NOTIFICATIONS_CONTROLLER->dismissNotification()V"
internal const val RESUME_NETWORK = "Lorg/telegram/tgnet/ConnectionsManager;->resumeNetworkMaybe()V"
private const val DND_OBJECT = "Ljava/lang/Object;"
private const val DND_TEXT = "Ljava/lang/CharSequence;"
private const val DND_RUNNABLE = "Ljava/lang/Runnable;"
private const val DND_POST_LABEL = "hush_dnd_post"
private val DND_ADD_SHAPE = listOf("I", DND_TEXT, DND_RUNNABLE, "Z").sorted()
private val DND_VIRTUAL = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

/**
 * Do Not Disturb in the chat list's menu (#79), three hooks that go in together or not at all:
 *
 * - [menu] at [show], the call that shows the chat list's menu, where the Proxy row's path and
 *   every skip of it arrive, so the item comes last on the menu;
 * - [notify] at [post], in NotificationsController.showOrUpdateNotification right after it has
 *   checked there is something to show (otherwise it dismisses) and resumed the network to post or
 *   update the message notification, which a yes from the extension returns ahead of;
 * - [sound] at [soundIf], the one branch on NotificationsController.inChatSoundEnabled outside its
 *   constructor, the sound a new message makes in the chat you have open.
 */
internal class DoNotDisturbSites(
    val menu: MutableMethod,
    val show: Int,
    val options: Int,
    val add: MethodReference,
    val notify: MutableMethod,
    val post: Int,
    val free: Int,
    val sound: MutableMethod,
    val soundIf: Int,
    val soundRegister: Int,
) {
    /** Puts the three hooks in. The menu's goes in first: the Proxy hook sits above it in the same method. */
    fun apply() {
        menu.addInstructionsAtControlFlowLabel(show, "invoke-static/range {v$options .. v$options}, $DND_MENU_HOOK")
        notify.addInstructionsWithLabels(
            post,
            """
                invoke-static {}, $DND_QUIET
                move-result v$free
                if-eqz v$free, :$DND_POST_LABEL
                return-void
            """,
            ExternalLabel(DND_POST_LABEL, notify.getInstruction(post)),
        )
        sound.addInstructionsAtControlFlowLabel(soundIf, """
            invoke-static/range {v$soundRegister .. v$soundRegister}, $DND_CHAT_SOUND
            move-result v$soundRegister
        """)
    }
}

/** Finds all three Do Not Disturb sites, or throws naming the first that's gone, before anything changes. */
internal fun BytecodePatchContext.resolveDoNotDisturb(site: ProxyMenuSite): DoNotDisturbSites {
    requireStatusMethod("doNotDisturb")
    controlHook(DO_NOT_DISTURB, "menu", listOf(DND_OBJECT), "V")
    controlHook(DO_NOT_DISTURB, "quiet", emptyList(), "Z")
    controlHook(DO_NOT_DISTURB, "chatSound", listOf("I"), "Z")
    controlHook(DO_NOT_DISTURB, "addItem", listOf(DND_OBJECT, "I", DND_TEXT, DND_RUNNABLE), "V")

    val body = site.method.controlBody()
    val show = body[site.show]
    val shown = show.call()
    controlShape(show.opcode in DND_VIRTUAL && shown != null && shown.parameterTypes.isEmpty() && shown.returnType == "V" &&
        show.namedRegisters().size == 1, "the chat list menu no longer shows itself where its Proxy checks skip to")
    val options = show.namedRegisters().single()
    val owner = shown!!.definingClass
    val adds = body.indices.filter { at ->
        body[at].opcode in DND_VIRTUAL && body[at].call()?.let {
            it.definingClass == owner && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString).sorted() == DND_ADD_SHAPE
        } == true
    }
    val add = adds.map { body[it].call()!! }.distinctBy { "${it.name}${it.parameterTypes.joinToString("")}" }
        .controlSingle("the chat list menu's add-an-item call")
    val flag = add.parameterTypes.map(CharSequence::toString).indexOf("Z")
    // Telegram's own items pass a plain false for that word, the stub's red-text flag.
    controlShape(adds.any { at ->
        val register = body[at].namedRegisters().getOrNull(flag + 1)
        val before = body.getOrNull(at - 1)
        before != null && before.opcode == Opcode.CONST_4 && before.namedRegisters() == listOf(register) &&
            (before as NarrowLiteralInstruction).narrowLiteral == 0
    }, "the chat list menu no longer adds its items with false for the red text")
    requireReachable("$owner->${add.name}(${add.parameterTypes.joinToString("")})V", false)

    val notifications = tgMutableClassDefByOrNull(NOTIFICATIONS_CONTROLLER)
    controlShape(notifications != null, "NotificationsController is missing")
    val notify = notifications!!.methods.filter { it.origName == "showOrUpdateNotification" && it.origDescriptor == "(Z)V" }
        .controlSingle("NotificationsController.showOrUpdateNotification")
    val shows = notify.controlBody()
    val resume = shows.indices.filter { shows[it].controlRef() == RESUME_NETWORK }
        .controlSingle("showOrUpdateNotification's network resume")
    val post = resume + 1
    val flow = ControlFlow.of(notify)
    controlShape(post < shows.size && shows.take(resume).any { it.controlRef() == PUSH_MESSAGES } &&
        shows.any { it.controlRef() == DISMISS_NOTIFICATION },
        "showOrUpdateNotification no longer checks its messages, and dismisses without them, before it posts")
    // Every post or update goes on from the resume, so code put in after it is on each of them.
    controlShape(flow.normal[resume] == listOf(post) && shows.indices.none { at -> at != resume && post in flow.normal[at] },
        "showOrUpdateNotification's posting has another way in")
    val free = notify.freeLocalsAt("Do Not Disturb", post, 1, highest = 255).single()

    val reads = notifications.methods.filter { it.name != "<init>" }.flatMap { method ->
        val code = method.controlBody()
        code.indices.filter { at ->
            code[at].opcode == Opcode.IGET_BOOLEAN && code[at].controlRef() == IN_CHAT_SOUND
        }.map { method to it }
    }
    val (sound, read) = reads.controlSingle("NotificationsController's in-chat sound read")
    // Each hook's index is read before any goes in, which holds only while they sit in different methods.
    controlShape(sound !== notify, "the in-chat sound moved into showOrUpdateNotification")
    val code = sound.controlBody()
    val held = code[read].namedRegisters().first()
    val soundIf = read + 1
    controlShape(code.getOrNull(soundIf)?.opcode == Opcode.IF_EQZ && code[soundIf].namedRegisters() == listOf(held),
        "the in-chat sound read is no longer a branch at once")
    return DoNotDisturbSites(site.method, site.show, options, add, notify, post, free, sound, soundIf, held)
}

/** Gives the stub the menu's own add, passing false for its red text. */
internal fun BytecodePatchContext.writeDoNotDisturbStub(sites: DoNotDisturbSites) {
    val owner = sites.add.definingClass
    val arguments = sites.add.parameterTypes.joinToString(", ") {
        when (it.toString()) {
            "I" -> "p1"
            DND_TEXT -> "p2"
            DND_RUNNABLE -> "p3"
            else -> "v0"
        }
    }
    writeStub(DO_NOT_DISTURB, "addItem", 5, """
        check-cast p0, $owner
        const/4 v0, 0x0
        invoke-virtual {p0, $arguments}, $owner->${sites.add.name}(${sites.add.parameterTypes.joinToString("")})V
        return-void
    """)
}
