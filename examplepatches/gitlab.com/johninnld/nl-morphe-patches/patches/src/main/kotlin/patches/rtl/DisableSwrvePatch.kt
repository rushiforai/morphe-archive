package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private const val EMPTY_SWRVE = "Lcom/swrve/sdk/SwrveBaseEmpty;"
private val disabledPushComponents = listOf(
    "service" to "nl.rtl.rtlnl.follow.RtlNlFirebaseMessagingService",
    "service" to "com.swrve.sdk.SwrveFirebaseMessagingService",
    "activity" to "com.swrve.sdk.SwrveInAppMessageActivity",
    "activity" to "com.swrve.sdk.SwrvePermissionRequesterActivity",
    "receiver" to "com.swrve.sdk.SwrveNotificationEngageReceiver",
    "receiver" to "com.swrve.sdk.SwrveNotificationDeleteReceiver",
    "activity" to "com.swrve.sdk.SwrveNotificationEngageActivity",
    "receiver" to "com.google.firebase.iid.FirebaseInstanceIdReceiver",
    "service" to "com.google.firebase.messaging.FirebaseMessagingService",
)

private val disableSwrveResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val all = doc.getElementsByTagName("*")
            val nodes = (0 until all.length).map { all.item(it) as Element }
            val namespace = "http://schemas.android.com/apk/res/android"
            for ((tag, name) in disabledPushComponents) {
                val node = nodes.single { it.tagName == tag && it.getAttribute("android:name") == name }
                check(!node.hasAttribute("android:enabled")) { "RTL original push component changed: $name" }
                node.setAttributeNS(namespace, "android:enabled", "false")
            }
            check(nodes.none { it.tagName == "meta-data" && it.getAttribute("android:name") == "firebase_messaging_auto_init_enabled" })
            val metadata = doc.createElement("meta-data")
            metadata.setAttributeNS(namespace, "android:name", "firebase_messaging_auto_init_enabled")
            metadata.setAttributeNS(namespace, "android:value", "false")
            nodes.single { it.tagName == "application" }.appendChild(metadata)
        }
    }
}

private data class ExpertGate(val owner: String, val signature: String, val flags: Int,
    val registers: Int, val count: Int, val first: Opcode, val prefix: String)

@Suppress("unused")
val disableSwrve = bytecodePatch(
    name = "Disable Swrve (expert)",
    description = "Reduces data sharing by stopping the remaining Swrve user and device updates and background push activity. Includes the standard ad, tracking and consent controls. Push notifications and Swrve channel synchronization stop working; shared Firebase authentication and configuration remain available.",
    default = false,
) {
    dependsOn(originalInput, skipConsentScreens, disableSwrveResources)
    compatibleWith(rtl)
    execute {
        val factory = exact("Lcom/swrve/sdk/SwrveSDK;", "createInstance(Landroid/app/Application;ILjava/lang/String;Lcom/swrve/sdk/config/SwrveConfig;)Lcom/swrve/sdk/ISwrve;").method
        check(factory.accessFlags == 0x20009 && factory.implementation!!.registerCount == 6 && factory.instructions.size == 38)
        check(factory.getInstruction(23).opcode == Opcode.IF_NEZ &&
            factory.getInstruction<ReferenceInstruction>(25).reference.toString() == "Lcom/swrve/sdk/SwrveEmpty;-><init>(Landroid/content/Context;Ljava/lang/String;)V" &&
            factory.getInstruction<ReferenceInstruction>(26).reference.toString() == "Lcom/swrve/sdk/SwrveSDKBase;->instance:Lcom/swrve/sdk/ISwrveBase;")
        val empty = exact(EMPTY_SWRVE, "getConfig()Lcom/swrve/sdk/config/SwrveConfigBase;")
        check(empty.classDef.methods.none { it.name == "morpheDisabledConfig" })
        empty.classDef.methods.add(queueHelper(EMPTY_SWRVE, "morpheDisabledConfig",
            listOf(EMPTY_SWRVE, "Lcom/swrve/sdk/config/SwrveConfigBase;"), "V", 0, """
                iput-object p1, p0, $EMPTY_SWRVE->config:Lcom/swrve/sdk/config/SwrveConfigBase;
                return-void
            """))
        // Preserve native validation, explicit monitor and global publication.
        // Always choose the SDK's existing disabled object, with real app config.
        factory.replaceInstruction(23, "nop")
        factory.addInstructions(26, "invoke-static {v1, p3}, $EMPTY_SWRVE->morpheDisabledConfig($EMPTY_SWRVE" + "Lcom/swrve/sdk/config/SwrveConfigBase;)V")
        val gates = listOf(
        ExpertGate("Lcom/swrve/sdk/SwrveBackgroundEventSenderWorker;", "doWork()Lp57;", 1, 6, 24, Opcode.INVOKE_STATIC, "new-instance v0, Lm57;\ninvoke-direct {v0}, Lm57;-><init>()V\nreturn-object v0"),
        ExpertGate("Lcom/swrve/sdk/SwrveCampaignDeliveryWorker;", "doWork()Lp57;", 1, 5, 22, Opcode.NEW_INSTANCE, "new-instance v0, Lm57;\ninvoke-direct {v0}, Lm57;-><init>()V\nreturn-object v0"),
        ExpertGate("Lcom/swrve/sdk/SwrvePushManagerBaseWorker;", "doWork()Lp57;", 1, 5, 25, Opcode.INVOKE_STATIC, "new-instance v0, Lm57;\ninvoke-direct {v0}, Lm57;-><init>()V\nreturn-object v0"),
        ExpertGate("Lcom/swrve/sdk/SwrvePushServiceDefault;", "handle(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;J)Z", 9, 6, 15, Opcode.IF_NEZ, "const/4 v0, 0x0\nreturn v0"),
        ExpertGate("Lcom/google/firebase/messaging/FirebaseMessaging\$AutoInit;", "isEnabled()Z", 131073, 2, 18, Opcode.MONITOR_ENTER, "const/4 v0, 0x0\nreturn v0"),
        )
        val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
        for (gate in gates) {
            val method = exact(gate.owner, gate.signature).method
            check(method.accessFlags == gate.flags && method.implementation!!.registerCount == gate.registers &&
                method.instructions.count { it.opcode !in payloads } == gate.count && method.getInstruction(0).opcode == gate.first) {
                "RTL original expert contract changed: ${gate.owner}->${gate.signature}"
            }
            method.addInstructions(0, gate.prefix)
        }
    }
}
