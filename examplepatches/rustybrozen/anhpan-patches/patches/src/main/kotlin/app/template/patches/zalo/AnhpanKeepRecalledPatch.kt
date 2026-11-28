package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val RECALL_HELPER = "Lapp/template/extension/zalo/settings/AnhpanRecallHelper;"

@Suppress("unused")
val anhpanKeepRecalledPatch = bytecodePatch(
    name = "Save recalled messages",
    description = "Keep messages after they are unsent and mark them as recalled.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Zalo",
            packageName = "com.zing.zalo",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0x0068FF,
            targets = listOf(AppTarget(version = "26.11.01")),
        ),
    )

    dependsOn(anhpanSettingsPatch)

    execute {
        // 1. Incoming UNDO handler: SpecialMessageProcessor.e(Lvv3;)V
        IncomingUndo261101.matchAll(0..1).singleOrNull()?.method?.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p1, Lvv3;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;
                invoke-static {v0}, $RECALL_HELPER->shouldRetain(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :normal_undo
                return-void
                :normal_undo
                nop
            """.trimIndent(),
        )

        // 2. Recall database & tab handlers (when not local user's own delete)
        RecallDatabase261101.matchAll(0..1).singleOrNull()?.method?.let { db ->
            if (db.implementation?.registerCount == 14) {
                db.addInstructionsWithLabels(
                    0,
                    """
                        if-nez p2, :normal_db
                        iget-object v0, p1, Lvv3;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;
                        invoke-static {v0}, $RECALL_HELPER->shouldRetain(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :normal_db
                        return-void
                        :normal_db
                        nop
                    """.trimIndent(),
                )
            }
        }

        RecallTab261101.matchAll(0..1).singleOrNull()?.method?.let { tab ->
            if (tab.implementation?.registerCount == 12) {
                tab.addInstructionsWithLabels(
                    0,
                    """
                        if-nez p2, :normal_tab
                        invoke-static {p1}, $RECALL_HELPER->shouldRetain(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :normal_tab
                        return-void
                        :normal_tab
                        nop
                    """.trimIndent(),
                )
            }
        }

        // 3. ChatRow timestamp label decoration
        RecallTimeLabel261101.matchAll(0..1).singleOrNull()?.method?.let { timeMethod ->
            val returns = timeMethod.implementation?.instructions?.toList()?.withIndex()?.filter {
                it.value.opcode == Opcode.RETURN_OBJECT
            }.orEmpty()
            if (returns.size == 2 && returns.all { (it.value as? OneRegisterInstruction)?.registerA == 2 }) {
                for (exit in returns.asReversed()) {
                    timeMethod.addInstructionsWithLabels(
                        exit.index,
                        """
                            invoke-static {p0, v2}, $RECALL_HELPER->formatTimeLabel(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v2
                        """.trimIndent(),
                    )
                }
            }
        }
    }
}

private object IncomingUndo261101 : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lvv3;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "UNDO"),
        string("SpecialMessageProcessor"),
    ),
)

private object RecallDatabase261101 : Fingerprint(
    definingClass = "Lp60/e;",
    name = "g0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lvv3;", "Z", "Lj20/t0;"),
    returnType = "V",
    filters = listOf(literal(0x21), literal(0x24)),
)

private object RecallTab261101 : Fingerprint(
    definingClass = "Las1/y0;",
    name = "E",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/zing/zalo/data/entity/chat/message/MessageId;", "Z", "Lj20/t0;", "Z"),
    returnType = "V",
    filters = listOf(literal(0x21), literal(0x24)),
)

private object RecallTimeLabel261101 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
    name = "getCurrentTimeText",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;",
            name = "i",
            type = "Lvv3;",
        ),
    ),
)
