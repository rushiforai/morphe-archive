package id.ikuradachi.patches.bstation.content

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal fun BytecodePatchContext.applyUserInteractions() {
    listOf(
        CommentTabInstallFingerprint, CommentPanelOpenFingerprint,
        DanmakuVisibleRpcFingerprint, DanmakuVisibilityInterfaceFingerprint,
        DanmakuSendFingerprint, DanmakuSendWidgetFingerprint,
    ).forEach { it.matchAll(1..1) }

    val tabs = CommentTabInstallFingerprint.method
    val tabInstructions = tabs.implementation!!.instructions.toList()
    val unitField = tabInstructions.single { it.opcode == Opcode.SGET_OBJECT }
        .let { (it as ReferenceInstruction).reference as FieldReference }
    require(unitField.type == unitField.definingClass) { "Unexpected coroutine Unit singleton" }
    tabs.addInstructionsWithLabels(
        0,
        """
            sget-object v0, Lcom/biliintl/playdetail/page/tabs/TabSlot;->Comment:Lcom/biliintl/playdetail/page/tabs/TabSlot;
            if-ne p1, v0, :install_other_tab
            sget-object v0, $unitField
            return-object v0
        """.trimIndent(),
        ExternalLabel("install_other_tab", tabs.implementation!!.instructions.first()),
    )
    CommentPanelOpenFingerprint.method.addInstructions(0, "return-void")

    // Only visibility dispatch is changed; the subtitle-bearing configuration RPC stays intact.
    DanmakuVisibleRpcFingerprint.method.addInstructions(0, "const/4 p1, 0x0")

    val modelConstructor = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
        name = "<init>",
        returnType = "V",
        parameters = emptyList(),
        interfaces = listOf(DanmakuVisibilityInterfaceFingerprint.originalClassDef.type),
        filters = listOf(opcode(Opcode.IPUT_BOOLEAN), newInstance("Ljava/util/LinkedList;")),
    )
    modelConstructor.matchAll(1..1)
    val modelType = modelConstructor.originalClassDef.type
    val constructor = modelConstructor.method
    val enabledPutIndex = modelConstructor.instructionMatches.first().index
    val enabledPut = constructor.implementation!!.instructions.elementAt(enabledPutIndex)
    val enabledField = (enabledPut as ReferenceInstruction).reference as FieldReference
    require(enabledField.type == "Z" && enabledField.definingClass == modelType)
    val enabledRegister = (enabledPut as TwoRegisterInstruction).registerA
    constructor.addInstructions(enabledPutIndex, "const/4 v$enabledRegister, 0x0")

    val enableSetter = Fingerprint(
        definingClass = modelType,
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = "V",
        parameters = listOf("Z"),
        filters = listOf(opcode(Opcode.IPUT_BOOLEAN), opcode(Opcode.IF_NEZ), opcode(Opcode.IGET_BOOLEAN)),
        custom = { method, _ ->
            (method.implementation!!.instructions.firstOrNull() as? ReferenceInstruction)?.reference == enabledField
        },
    )
    enableSetter.matchAll(1..1)
    enableSetter.method.addInstructions(0, "const/4 p1, 0x0")

    val visibilitySetter = Fingerprint(
        definingClass = modelType,
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = "V",
        parameters = listOf("Z", "Z"),
        filters = listOf(opcode(Opcode.IPUT_BOOLEAN), opcode(Opcode.IF_EQZ)),
    )
    visibilitySetter.matchAll(1..1)
    visibilitySetter.method.addInstructions(0, "const/4 p1, 0x0")

    DanmakuSendFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    DanmakuSendWidgetFingerprint.method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
            const/16 v0, 0x8
            invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V
            return-void
        """.trimIndent(),
    )
}
