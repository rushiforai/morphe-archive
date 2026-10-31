/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.unifiedpush

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCallable
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.call
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

internal const val UNIFIED_PUSH = "$EXTENSION_PACKAGE/misc/UnifiedPush;"
internal const val UNIFIED_PUSH_RECEIVER = "app.hushtelegram.extension.telegram.misc.UnifiedPushReceiver"
internal const val UNIFIED_PUSH_RAISE = "app.hushtelegram.extension.telegram.misc.UnifiedPushRaise"
internal const val DISTRIBUTOR_REGISTER = "org.unifiedpush.android.distributor.REGISTER"
internal const val RAISE_TO_FOREGROUND = "org.unifiedpush.android.connector.RAISE_TO_FOREGROUND"
internal val CONNECTOR_ACTIONS = listOf(
    "org.unifiedpush.android.connector.NEW_ENDPOINT",
    "org.unifiedpush.android.connector.MESSAGE",
    "org.unifiedpush.android.connector.UNREGISTERED",
    "org.unifiedpush.android.connector.REGISTRATION_FAILED",
    "org.unifiedpush.android.connector.TEMP_UNAVAILABLE",
)

private const val STRING = "Ljava/lang/String;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
internal const val PUSH_CONTROLLER = "Lorg/telegram/messenger/PushListenerController;"
internal const val SEND_REGISTRATION = "$PUSH_CONTROLLER->sendRegistrationToServer(I$STRING)V"
private const val DISPATCH_QUEUE = "Lorg/telegram/messenger/DispatchQueue;"
internal const val STAGE_QUEUE = "Lorg/telegram/messenger/Utilities;->stageQueue:$DISPATCH_QUEUE"
internal const val POST_RUNNABLE = "$DISPATCH_QUEUE->postRunnable($RUNNABLE)Z"
private const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
internal const val PUSH_STRING = "$SHARED_CONFIG->pushString:$STRING"
internal const val PUSH_TYPE = "$SHARED_CONFIG->pushType:I"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val REGISTER_FOR_PUSH = "$MESSAGES_CONTROLLER->registerForPush(I$STRING)V"
internal const val TOKEN_TYPE = "Lorg/telegram/tgnet/tl/TL_account\$registerDevice;->token_type:I"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val CONNECTIONS = "Lorg/telegram/tgnet/ConnectionsManager;"
internal const val USER_CONFIG_INSTANCE = "$USER_CONFIG->getInstance(I)$USER_CONFIG"
internal const val CLIENT_ACTIVATED = "$USER_CONFIG->isClientActivated()Z"
internal const val INTERNAL_PUSH = "$CONNECTIONS->onInternalPushReceived(I)V"
internal const val CONNECTIONS_INSTANCE = "$CONNECTIONS->getInstance(I)$CONNECTIONS"
internal const val RESUME_NETWORK = "$CONNECTIONS->resumeNetworkMaybe()V"
internal const val POST_INIT = "Lorg/telegram/messenger/ApplicationLoader;->postInitApplication()V"
private const val PUSH_PROVIDER = "Lorg/telegram/messenger/PushListenerController\$IPushListenerServiceProvider;"
internal const val GET_PUSH_PROVIDER = "Lorg/telegram/messenger/ApplicationLoader;->getPushProvider()$PUSH_PROVIDER"
internal const val HAS_SERVICES = "$PUSH_PROVIDER->hasServices()Z"
internal const val REQUEST_PUSH_TOKEN = "$PUSH_PROVIDER->onRequestPushToken()V"

/**
 * Declares the UnifiedPush receiver and RAISE_TO_FOREGROUND service, both exported since the
 * UnifiedPush app is another package, and asks Android 11 and up to show this app the installed
 * UnifiedPush apps. Both answer only with the sign-up's own token, so another app gets nothing.
 */
internal val unifiedPushManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no application element")
            for (tag in listOf("receiver", "service")) {
                val declared = document.getElementsByTagName(tag)
                if ((0 until declared.length).any {
                        (declared.item(it) as Element).getAttribute("android:name") in setOf(UNIFIED_PUSH_RECEIVER, UNIFIED_PUSH_RAISE)
                    }) {
                    throw PatchException("AndroidManifest.xml already declares HushTelegram's UnifiedPush $tag")
                }
            }
            val existing = document.getElementsByTagName("queries")
            if (existing.length > 1 || (existing.length == 1 && existing.item(0).parentNode != root)) {
                throw PatchException("AndroidManifest.xml has ambiguous package-visibility declarations")
            }
            val queries = existing.item(0) as? Element ?: document.createElement("queries").also(root::appendChild)
            fun action(name: String) = document.createElement("action").apply { setAttribute("android:name", name) }
            queries.appendChild(document.createElement("intent").apply { appendChild(action(DISTRIBUTOR_REGISTER)) })
            application.appendChild(document.createElement("receiver").apply {
                setAttribute("android:name", UNIFIED_PUSH_RECEIVER)
                setAttribute("android:exported", "true")
                appendChild(document.createElement("intent-filter").apply { CONNECTOR_ACTIONS.forEach { appendChild(action(it)) } })
            })
            application.appendChild(document.createElement("service").apply {
                setAttribute("android:name", UNIFIED_PUSH_RAISE)
                setAttribute("android:exported", "true")
                appendChild(document.createElement("intent-filter").apply { appendChild(action(RAISE_TO_FOREGROUND)) })
            })
        }
    }
}

@Suppress("unused")
val unifiedPushPatch = bytecodePatch(
    name = "UnifiedPush notifications",
    description = "Lets Telegram get its notifications through a UnifiedPush app like ntfy, for phones where Firebase " +
        "notifications don't arrive. Telegram's servers wake it through the app, and the messages still come from " +
        "Telegram. It also turns on Telegram's own Keep-Alive Service and Background Connection, unless you've set " +
        "either one yourself, so messages keep coming while Telegram is closed. Starts off. Turn it on in " +
        "HushTelegram settings > Notifications.",
    default = true,
) {
    category("Notifications")
    dependsOn(settingsPatch, telegramExtensionPatch, unifiedPushManifestPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveUnifiedPush()
        val (reactions, reactionsMissing) = resolveReactionAlerts()
        val (sound, soundMissing) = resolveReactionSound()
        val (lookup, lookupMissing) = if (reactions != null) resolveEmojiLookup() else Pair(null, null)
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertUnifiedPushGate(MutableMethod(ImmutableMethod.of(plan.signUp)))
        reactions?.applyTo(MutableMethod(ImmutableMethod.of(reactions.updates)))
        sound?.applyTo(MutableMethod(ImmutableMethod.of(sound.check)))
        insertUnifiedPushGate(plan.signUp)
        writeUnifiedPushStubs(plan.accounts)
        if (reactions != null) {
            reactions.applyTo(reactions.updates)
            enableCapability("reactionAlerts")
            if (lookup != null) {
                writeEmojiLookup(lookup)
            } else {
                patchLog.warning("UnifiedPush notifications: $lookupMissing. Reaction notifications without push go on without custom emoji.")
            }
        } else {
            patchLog.warning("UnifiedPush notifications: $reactionsMissing. The patch goes on without reaction notifications without push.")
        }
        if (sound != null) {
            sound.applyTo(sound.check)
            enableCapability("reactionSound")
        } else {
            patchLog.warning("UnifiedPush notifications: $soundMissing. The patch goes on without the sound for reaction notifications.")
        }
        enableStatus("unifiedPush")
    }
}

/** Telegram's push sign-up, and how many accounts its wake-up goes through. */
internal class UnifiedPushPlan(val signUp: MutableMethod, val accounts: Int)

/**
 * Ahead of anything in sendRegistrationToServer, the extension gets the token and then the type,
 * and both parameters take its answers. With the switch off they come back as they went in.
 */
internal fun insertUnifiedPushGate(method: MutableMethod) {
    method.addInstructions(0, """
        invoke-static {p0, p1}, $UNIFIED_PUSH->token(I$STRING)$STRING
        move-result-object p1
        invoke-static {p0}, $UNIFIED_PUSH->type(I)I
        move-result p0
    """)
}

private fun BytecodePatchContext.writeUnifiedPushStubs(accounts: Int) {
    writeStub(UNIFIED_PUSH, "sendToTelegram", 2, """
        invoke-static {p0, p1}, $SEND_REGISTRATION
        return-void
    """)
    writeStub(UNIFIED_PUSH, "telegramToken", 1, """
        sget-object v0, $PUSH_STRING
        return-object v0
    """)
    writeStub(UNIFIED_PUSH, "startTelegram", 1, """
        invoke-static {}, $POST_INIT
        return-void
    """)
    writeStub(UNIFIED_PUSH, "onStageQueue", 2, """
        sget-object v0, $STAGE_QUEUE
        invoke-virtual {v0, p0}, $POST_RUNNABLE
        return-void
    """)
    // onDecryptError's loop, without the count-down on processRemoteMessage's latch.
    writeStub(UNIFIED_PUSH, "wakeAccounts", 2, """
        const/4 v0, 0x0
        :hush_next_account
        const/16 v1, $accounts
        if-ge v0, v1, :hush_done
        invoke-static {v0}, $USER_CONFIG_INSTANCE
        move-result-object v1
        invoke-virtual {v1}, $CLIENT_ACTIVATED
        move-result v1
        if-eqz v1, :hush_skip
        invoke-static {v0}, $INTERNAL_PUSH
        invoke-static {v0}, $CONNECTIONS_INSTANCE
        move-result-object v1
        invoke-virtual {v1}, $RESUME_NETWORK
        :hush_skip
        add-int/lit8 v0, v0, 0x1
        goto :hush_next_account
        :hush_done
        return-void
    """)
    // What Telegram's initPushServices does at a start: ask the provider only when it has its services.
    writeStub(UNIFIED_PUSH, "requestPushToken", 2, """
        invoke-static {}, $GET_PUSH_PROVIDER
        move-result-object v0
        invoke-interface {v0}, $HAS_SERVICES
        move-result v1
        if-eqz v1, :hush_no_services
        invoke-interface {v0}, $REQUEST_PUSH_TOKEN
        :hush_no_services
        return-void
    """)
}

/**
 * Telegram signs up for pushes in PushListenerController.sendRegistrationToServer(type, token):
 * on its stage queue it saves both in SharedConfig and has each account send account.registerDevice
 * with the type as token_type. Its onDecryptError has each signed-in account reconnect when a push
 * can't be read, which is all a UnifiedPush wake-up needs. The stubs call these from the
 * extension's package, so each one has to be public.
 */
internal fun BytecodePatchContext.resolveUnifiedPush(): UnifiedPushPlan {
    requireStatusMethod("unifiedPush")
    controlHook(UNIFIED_PUSH, "token", listOf("I", STRING), STRING)
    controlHook(UNIFIED_PUSH, "type", listOf("I"), "I")
    controlHook(UNIFIED_PUSH, "sendToTelegram", listOf("I", STRING), "V")
    controlHook(UNIFIED_PUSH, "telegramToken", emptyList(), STRING)
    controlHook(UNIFIED_PUSH, "startTelegram", emptyList(), "V")
    controlHook(UNIFIED_PUSH, "onStageQueue", listOf(RUNNABLE), "V")
    controlHook(UNIFIED_PUSH, "wakeAccounts", emptyList(), "V")
    controlHook(UNIFIED_PUSH, "requestPushToken", emptyList(), "V")
    controlHook(REACTION_ALERTS, "changed", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
    requireStatusMethod("reactionAlerts")
    controlHook(REACTION_ALERTS, "quiet", listOf("I"), "Z")
    requireStatusMethod("reactionSound")
    controlHook(REACTION_ALERTS, "emojiDocument", listOf("I", "J"), "Ljava/lang/Object;")

    val controller = mutableClassDefByOrNull(PUSH_CONTROLLER)
    controlShape(controller != null && AccessFlags.PUBLIC.isSet(controller.accessFlags), "PushListenerController is missing")
    val signUp = controller!!.methods.filter { it.toString() == SEND_REGISTRATION }.controlSingle("Telegram's push sign-up")
    controlShape(signUp.controlCallable(true), "Telegram's push sign-up isn't public")
    val signUpRefs = signUp.controlBody().mapNotNull { it.controlRef() }
    controlShape(STAGE_QUEUE in signUpRefs && POST_RUNNABLE in signUpRefs, "Telegram's push sign-up no longer runs on its stage queue")
    controlShape(controller.methods.any { method ->
        val body = method.controlBody()
        body.any { it.opcode == Opcode.SPUT_OBJECT && it.controlRef() == PUSH_STRING } &&
            body.any { it.opcode == Opcode.SPUT && it.controlRef() == PUSH_TYPE }
    }, "Telegram no longer saves the push token with its type")

    // The type reaches the server as token_type, straight from registerForPush's first parameter.
    val messages = mutableClassDefByOrNull(MESSAGES_CONTROLLER)
    val registerForPush = messages?.methods?.singleOrNull { it.toString() == REGISTER_FOR_PUSH }
    controlShape(registerForPush != null && registerForPush.controlBody().any {
        it.opcode == Opcode.IPUT && it.controlRef() == TOKEN_TYPE &&
            (it as TwoRegisterInstruction).registerA == registerForPush.parameterRegisterNumber(0)
    }, "Telegram's device sign-up no longer sends the push type as its token type")

    val wake = controller.methods.filter { it.name == "onDecryptError" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        .controlSingle("Telegram's wake-up for every account")
    val body = wake.controlBody()
    val refs = body.mapNotNull { it.controlRef() }
    controlShape(listOf(USER_CONFIG_INSTANCE, CLIENT_ACTIVATED, INTERNAL_PUSH, CONNECTIONS_INSTANCE, RESUME_NETWORK).all { it in refs },
        "Telegram's wake-up no longer reconnects each signed-in account")
    val loop = body.indices.filter { body[it].opcode == Opcode.IF_GE }.controlSingle("Telegram's account loop")
    val bound = body.getOrNull(loop - 1)
    val accounts = (bound as? NarrowLiteralInstruction)?.narrowLiteral
    controlShape(bound != null && bound.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16) && accounts != null && accounts in 1..32 &&
        (bound as OneRegisterInstruction).registerA == (body[loop] as TwoRegisterInstruction).registerB,
        "Telegram's account count changed")

    for ((reference, static) in listOf(SEND_REGISTRATION to true, POST_INIT to true, POST_RUNNABLE to false,
        USER_CONFIG_INSTANCE to true, CLIENT_ACTIVATED to false, INTERNAL_PUSH to true, CONNECTIONS_INSTANCE to true,
        RESUME_NETWORK to false, STAGE_QUEUE to true, PUSH_STRING to true, GET_PUSH_PROVIDER to true,
        HAS_SERVICES to false, REQUEST_PUSH_TOKEN to false)) {
        requireReachable(reference, static)
    }
    return UnifiedPushPlan(signUp, accounts!!)
}
