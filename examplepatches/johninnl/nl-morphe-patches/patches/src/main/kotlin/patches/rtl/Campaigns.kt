package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode

private data class CampaignGate(val owner: String, val signature: String, val flags: Int,
    val registers: Int, val count: Int, val entry: Opcode, val prefix: String)

// Campaign-only boundaries; functional push, account/configuration services and
// manual Settings launchers remain intact. No "shown"/handled/seen state is set.
private val campaignGates = listOf(
    CampaignGate("Lym7;", "a(Lym7;Ljava/lang/String;)Ljava/lang/Boolean;", 0x19, 4, 35, Opcode.IGET_OBJECT, "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0"),
    CampaignGate("Ln55;", "f(Lym7;Lb4e;Lu72;I)V", 0x19, 37, 272, Opcode.MOVE_OBJECT_FROM16, "return-void"),
    CampaignGate("Lcom/swrve/sdk/SwrveBase;", "_getBaseMessageForEvent(Ljava/lang/String;Ljava/util/Map;Lcom/swrve/sdk/messaging/SwrveOrientation;Ljava/util/Date;)Lcom/swrve/sdk/messaging/SwrveBaseMessage;", 0x1, 28, 235, Opcode.MOVE_OBJECT_FROM16, "const/4 v0, 0x0\nreturn-object v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveBase;", "_getMessageCenterCampaigns(Lcom/swrve/sdk/messaging/SwrveOrientation;Ljava/util/Map;I)Ljava/util/List;", 0x2, 11, 95, Opcode.NEW_INSTANCE, "new-instance v0, Ljava/util/ArrayList;\ninvoke-direct {v0}, Ljava/util/ArrayList;-><init>()V\nreturn-object v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveBase;", "_getEmbeddedMessageCenterCampaigns(Ljava/util/Map;)Ljava/util/List;", 0x2, 8, 54, Opcode.NEW_INSTANCE, "new-instance v0, Ljava/util/ArrayList;\ninvoke-direct {v0}, Ljava/util/ArrayList;-><init>()V\nreturn-object v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveBase;", "_getEmbeddedMessageForId(I)Lcom/swrve/sdk/messaging/SwrveEmbeddedMessage;", 0x1, 6, 40, Opcode.IGET_OBJECT, "const/4 v0, 0x0\nreturn-object v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveBase;", "_getMessageForId(I)Lcom/swrve/sdk/messaging/SwrveMessage;", 0x1, 6, 36, Opcode.IGET_OBJECT, "const/4 v0, 0x0\nreturn-object v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveBase;", "showMessageCenterCampaign(Lcom/swrve/sdk/messaging/SwrveBaseCampaign;Ljava/util/Map;)Z", 0x1, 7, 55, Opcode.INVOKE_VIRTUAL, "const/4 v0, 0x0\nreturn v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveImp;", "canDisplaySwrveMessage(Lcom/swrve/sdk/messaging/SwrveMessage;Ljava/util/Map;)Z", 0x1, 5, 47, Opcode.IGET_OBJECT, "const/4 v0, 0x0\nreturn v0"),
    CampaignGate("Lcom/swrve/sdk/SwrveImp;", "displaySwrveMessage(Lcom/swrve/sdk/messaging/SwrveMessage;Ljava/util/Map;)V", 0x1, 6, 23, Opcode.NEW_INSTANCE, "return-void"),
    CampaignGate("Lcom/swrve/sdk/SwrveDeeplinkManager;", "showCampaign(Lcom/swrve/sdk/messaging/SwrveBaseCampaign;Landroid/content/Context;Lcom/swrve/sdk/config/SwrveConfig;)V", 0x1, 6, 57, Opcode.INVOKE_VIRTUAL, "return-void"),
    CampaignGate("Lcom/swrve/sdk/SwrvePermissionRequesterActivity;", "requestPermission(Landroid/content/Context;Ljava/lang/String;)V", 0x9, 4, 9, Opcode.NEW_INSTANCE, "return-void"),
)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun disableCampaigns() {
    val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    for (gate in campaignGates) {
        val method = exact(gate.owner, gate.signature).method
        check(method.accessFlags == gate.flags && method.implementation!!.registerCount == gate.registers &&
            method.instructions.count { it.opcode !in payloads } == gate.count &&
            method.getInstruction(0).opcode == gate.entry) {
            "RTL original campaign contract changed: ${gate.owner}->${gate.signature}"
        }
        method.addInstructions(0, gate.prefix)
    }
}
