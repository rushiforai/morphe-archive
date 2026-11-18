package patches.reolink

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

internal const val FCM_LISTENER = "Lcom/android/bc/pushmanager/FcmListenerService;"
internal const val CALL_BRIDGE = "Lnl/johninnl/reolink/calls/DoorbellCalls;"
internal const val SDK_MESSAGING_SERVICE = "Lcom/google/firebase/messaging/FirebaseMessagingService;"
internal const val PUSH_ADAPTER = "Lcom/android/bc/pushmanager/MyPushAdapterImpl;"

internal fun withAppHandledPushInitialization(original: Method): MutableMethod {
    check(original.definingClass == PUSH_ADAPTER && original.name == "initPushSdk" && original.returnType == "V" &&
        original.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;"))
    val code = checkNotNull(original.implementation).instructions.toList()
    check(code.last().opcode == Opcode.RETURN_VOID && code.count { it.opcode == Opcode.RETURN_VOID } == 1)
    val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    check(refs.none { it.startsWith(CALL_BRIDGE) })
    check("Lcom/google/firebase/FirebaseApp;->initializeApp(Landroid/content/Context;)Lcom/google/firebase/FirebaseApp;" in refs)
    return original.toMutable().apply {
        addInstruction(code.lastIndex, "invoke-static/range {p1 .. p1}, $CALL_BRIDGE->initialize(Landroid/content/Context;)V")
    }
}

/** Hook after Firebase's receipt/dedup path, before its background auto-notification can consume a ring. */
internal fun withSdkDoorbellCallHook(original: Method): MutableMethod {
    check(original.definingClass == SDK_MESSAGING_SERVICE && original.name == "dispatchMessage" &&
        original.returnType == "V" && original.parameterTypes.map(CharSequence::toString) ==
        listOf("Landroid/content/Intent;")) { "Reolink Firebase presentation ABI changed" }
    val code = checkNotNull(original.implementation).instructions.toList()
    val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    check(original.implementation!!.registerCount > 2 && original.implementation!!.registerCount < 256)
    check(refs.none { it.startsWith(CALL_BRIDGE) }) { "Firebase doorbell hook already applied" }
    check("Lcom/google/firebase/messaging/NotificationParams;->isNotification(Landroid/os/Bundle;)Z" in refs)
    check("$SDK_MESSAGING_SERVICE->onMessageReceived(Lcom/google/firebase/messaging/RemoteMessage;)V" in refs)
    return original.toMutable().apply {
        addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p1}, $CALL_BRIDGE->onSdkMessage(Landroid/content/Context;Landroid/content/Intent;)Z
            move-result v0
            if-eqz v0, :native_notification
            return-void
        """, ExternalLabel("native_notification", getInstruction(0)))
    }
}

internal fun withDoorbellCallHook(original: Method): MutableMethod {
    check(original.definingClass == FCM_LISTENER && original.name == "onMessage" &&
        original.returnType == "V" && original.parameterTypes.map(CharSequence::toString) ==
        listOf("Lcom/google/firebase/messaging/RemoteMessage;")) { "Reolink doorbell push ABI changed" }
    val code = checkNotNull(original.implementation).instructions.toList()
    val references = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    check(original.implementation!!.registerCount > 2 && original.implementation!!.registerCount < 256)
    check(references.none { it.startsWith(CALL_BRIDGE) }) { "Reolink doorbell call hook already applied" }
    for (reference in listOf(
        "Lcom/reolink/push/PushMessage;->getDoorPhone()Z",
        "Lcom/reolink/push/PushMessage;->isCloudAccountPush()Z",
        "Lcom/android/bc/account/AccountManager;->isLogin()Z",
        "Lcom/android/bc/pushmanager/FcmListenerService;->sendNotificationByAppBackground(Lcom/google/firebase/messaging/RemoteMessage;Z)V",
    )) check(reference in references) { "Reolink doorbell native policy changed: $reference" }
    // v0 is a local, not either input parameter. The untouched native entry initializes its own locals.
    return original.toMutable().apply {
        addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p1}, $CALL_BRIDGE->onMessage(Landroid/content/Context;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native_push
            return-void
        """, ExternalLabel("native_push", getInstruction(0)))
    }
}

private val callManifest = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val permissions = manifest.getElementsByTagName("uses-permission").let { nodes ->
                (0 until nodes.length).map { (nodes.item(it) as Element).getAttribute("android:name") }.toSet()
            }
            for (permission in listOf("FOREGROUND_SERVICE", "FOREGROUND_SERVICE_PHONE_CALL", "MANAGE_OWN_CALLS",
                "RECORD_AUDIO", "BLUETOOTH_CONNECT", "MODIFY_AUDIO_SETTINGS")) {
                val name = "android.permission.$permission"
                if (name !in permissions) root.appendChild(manifest.createElement("uses-permission").apply {
                    setAttribute("android:name", name)
                })
            }
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val delegationName = "firebase_messaging_notification_delegation_enabled"
            val metadata = application.getElementsByTagName("meta-data").let { nodes ->
                (0 until nodes.length).map { nodes.item(it) as Element }
                    .filter { it.getAttribute("android:name") == delegationName }
            }
            check(metadata.size <= 1)
            val delegation = metadata.singleOrNull() ?: manifest.createElement("meta-data").also {
                it.setAttribute("android:name", delegationName)
                application.appendChild(it)
            }
            delegation.setAttribute("android:value", "false")
            fun addComponent(tag: String, name: String, exported: Boolean, action: String? = null): Element {
                check((0 until application.getElementsByTagName(tag).length).none {
                    (application.getElementsByTagName(tag).item(it) as Element).getAttribute("android:name") == name
                }) { "Reolink call component already declared" }
                val element = manifest.createElement(tag).apply {
                    setAttribute("android:name", name)
                    setAttribute("android:exported", exported.toString())
                    if (action != null) appendChild(manifest.createElement("intent-filter").apply {
                        appendChild(manifest.createElement("action").apply { setAttribute("android:name", action) })
                    })
                }
                application.appendChild(element)
                return element
            }
            addComponent("service", "nl.johninnl.reolink.calls.ReolinkCallService", false)
                .setAttribute("android:foregroundServiceType", "phoneCall")
            // Mirror Core-Telecom 1.0.0's manifest: the legacy ConnectionService path and mute broadcasts.
            addComponent("service", "androidx.core.telecom.internal.JetpackConnectionService", true,
                "android.telecom.ConnectionService").setAttribute("android:permission",
                "android.permission.BIND_TELECOM_CONNECTION_SERVICE")
            addComponent("receiver", "androidx.core.telecom.internal.MuteStateReceiver", true,
                "android.media.action.MICROPHONE_MUTE_CHANGED")
        }
    }
}

@Suppress("unused")
val reolinkDoorbellCallsPatch = bytecodePatch(
    name = "Doorbell calls through Android Auto",
    description = "Experimental. Presents doorbell rings as native Telecom audio calls for Android Auto's " +
        "Answer, Reject, Hang up and mute controls. Keeps the visitor connection inside Reolink without opening " +
        "a video screen. Needs microphone permission; real car audio acceptance is pending.",
    default = false,
) {
    compatibleWith(reolink)
    dependsOn(originalInput, reolinkPushNotificationsPatch, callManifest)
    extendWith("extensions/reolink-calls.mpe")
    execute {
        // Resolve native call/audio operations before changing the accepted notification path.
        fun requireMethod(type: String, name: String, parameters: List<String>) {
            var owner: String? = type
            while (owner != null) {
                val cls = classDefBy(owner)
                if (cls.methods.any { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters }) return
                owner = cls.superclass?.takeIf { it.startsWith("Lcom/android/bc/") }
            }
            error("Reolink call/audio ABI missing: $type->$name")
        }
        val channel = "Lcom/android/bc/devicemanager/Channel;"
        for ((name, parameters) in listOf(
            "talkOpen" to emptyList(), "talkClose" to emptyList(), "talkSend" to listOf("[B", "I"),
            "getTalkStateFromSDK" to emptyList(), "getChannelBean" to emptyList(), "isSD20" to emptyList(),
            "addObserver" to listOf("Lcom/android/bc/devicemanager/ChannelTalkStateObserver;"),
            "deleteObserver" to listOf("Lcom/android/bc/devicemanager/ChannelTalkStateObserver;"),
        )) requireMethod(channel, name, parameters)
        val device = "Lcom/android/bc/devicemanager/Device;"
        requireMethod(device, "post", listOf("Ljava/lang/Runnable;"))
        requireMethod(device, "openDeviceAsync", emptyList())
        requireMethod(device, "getChannelListSorted", emptyList())
        requireMethod("Lcom/google/firebase/messaging/RemoteMessage;", "<init>", listOf("Landroid/os/Bundle;"))
        requireMethod("Lcom/google/firebase/messaging/FirebaseMessaging;", "setNotificationDelegationEnabled", listOf("Z"))
        requireMethod("Lcom/android/bc/component/BCAudioRecord;", "<init>", listOf("Z"))
        requireMethod("Lcom/android/bc/component/BCAudioRecord;", "startRecord", listOf("Z", "Z", "I", "I", "I",
            "Lcom/android/bc/component/BCAudioRecord\$IRecordDelegate;"))
        for (name in listOf("getMedia", "getLength", "getChannels", "getSampleRate"))
            requireMethod("Lcom/android/bc/devicemanager/BCAudioData;", name, emptyList())
        val owner = mutableClassDefBy(FCM_LISTENER)
        val original = owner.methods.single { it.name == "onMessage" }
        val replacement = withDoorbellCallHook(original)
        check(owner.methods.remove(original))
        owner.methods.add(replacement)
        val sdk = mutableClassDefBy(SDK_MESSAGING_SERVICE)
        val dispatch = sdk.methods.single { it.name == "dispatchMessage" }
        val sdkReplacement = withSdkDoorbellCallHook(dispatch)
        check(sdk.methods.remove(dispatch))
        sdk.methods.add(sdkReplacement)
        val adapter = mutableClassDefBy(PUSH_ADAPTER)
        val init = adapter.methods.single { it.name == "initPushSdk" }
        val appHandled = withAppHandledPushInitialization(init)
        check(adapter.methods.remove(init))
        adapter.methods.add(appHandled)
    }
}
