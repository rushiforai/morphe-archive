package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

/** 15.0 guest rendering/routing contracts; resource ID is allocated separately. */
context(context: BytecodePatchContext)
internal fun guestModePlans15(guestLabelId: Int): List<MethodPlan> {
    // 15.0 added a second Modifier argument to this native button. Bind its
    // actual descriptor and default-mask slots before emitting the extra call.
    val button = exact("Lv98;", "b", "V", "Landroidx/compose/ui/Modifier;",
        "Landroidx/compose/ui/Modifier;", "Ljava/lang/String;", "Lny1;", "Loy1;",
        "Landroidx/compose/foundation/shape/CornerSize;", "Z", "Z", "Ls39;",
        "Landroidx/compose/runtime/Composer;", "I", "I").method
    check(button.implementation!!.registerCount == 31 && button.instructions.size == 276) {
        "Changed 15.0 native guest button layout"
    }
    mapOf(13 to 0x1, 32 to 0x2, 90 to 0x40, 106 to 0x80).forEach { (index, mask) ->
        val instruction = button.getInstruction<NarrowLiteralInstruction>(index)
        check(instruction.opcode in setOf(Opcode.AND_INT_LIT8, Opcode.AND_INT_LIT16) &&
            instruction.narrowLiteral == mask) { "Changed 15.0 native guest button defaults" }
    }
    return listOf(
            MethodPlan(
                "Lovb;->b(Ls39;Landroidx/compose/runtime/Composer;I)V", 11, 62,
                listOf(
                    Guard(0, Opcode.INVOKE_VIRTUAL, listOf(8), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(30, Opcode.CONST_STRING, listOf(2), "nl.flitsmeister.menu.presentation.MenuNoAccountMessage (MenuBanner.kt:105)"),
                    Guard(47, Opcode.INVOKE_STATIC_RANGE, (1..7).toList(), "Lovb;->a(Ljava/lang/String;Ljava/lang/String;Lczb;Ljava/lang/String;Ls39;Landroidx/compose/runtime/Composer;I)V"),
                ),
                // This leaf renders only the large account sign-up card. The
                // menu's Login control, reports, rows and other banners remain.
                listOf(Edit(0, "body", "return-void")),
                mapOf("Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;" to 3),
            ),
            MethodPlan(
                "Lkad;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                32, 219,
                listOf(
                    Guard(202, Opcode.IGET_OBJECT, listOf(7, 0), "Lkad;->b:Ls39;"),
                    Guard(204, Opcode.INVOKE_STATIC_RANGE, (2..12).toList(), "Lv98;->a(Landroidx/compose/ui/Modifier;Lny1;Loy1;Landroidx/compose/foundation/shape/CornerSize;ZLs39;Ls39;Lk49;Landroidx/compose/runtime/Composer;II)V"),
                    Guard(205, Opcode.IGET_OBJECT, listOf(0, 0), "Lkad;->c:Le68;"),
                    Guard(208, Opcode.INVOKE_INTERFACE, listOf(10, 0), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                    Guard(209, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
                    Guard(210, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endNode()V"),
                ),
                listOf(Edit(209, "insert", """
                    move-object/from16 v0, p0
                    const v2, 0x${guestLabelId.toString(16)}
                    const/4 v3, 0x0
                    invoke-static {v2, v10, v3}, Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;
                    move-result-object v3
                    const/4 v1, 0x0
                    const/4 v2, 0x0
                    move-object v5, v4
                    sget-object v4, Lny1${'$'}f;->a:Lny1${'$'}f;
                    const/4 v6, 0x0
                    const/4 v7, 0x0
                    const/4 v8, 0x0
                    iget-object v9, v0, Lkad;->d:Ls39;
                    const/4 v11, 0x0
                    const/16 v12, 0xe3
                    invoke-static/range {v1 .. v12}, Lv98;->b(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Modifier;Ljava/lang/String;Lny1;Loy1;Landroidx/compose/foundation/shape/CornerSize;ZZLs39;Landroidx/compose/runtime/Composer;II)V
                    move-object/from16 v10, v16
                """.trimIndent())),
                mapOf("Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V" to 1),
            ),
            MethodPlan(
                "Lbji;->a(Lun4;)Ljava/lang/Object;", 7, 73,
                listOf(
                    Guard(46, Opcode.IGET_OBJECT, listOf(6, 6), "Lfje;->U:Ljie;"),
                    Guard(54, Opcode.INVOKE_VIRTUAL, listOf(6), "Ljava/lang/Boolean;->booleanValue()Z"),
                    Guard(55, Opcode.MOVE_RESULT, listOf(6)),
                    Guard(56, Opcode.IF_EQZ, listOf(6), target = 58),
                    Guard(58, Opcode.IPUT, listOf(2, 0), "Lcji;->c:I"),
                ),
                // Keep first-run onboarding and Dash setup. Only a historical
                // login must no longer force the guest to authenticate again.
                listOf(Edit(56, "goto", target = 58)),
                mapOf("Lfje;->U:Ljie;" to 1),
            ),
        )
}
