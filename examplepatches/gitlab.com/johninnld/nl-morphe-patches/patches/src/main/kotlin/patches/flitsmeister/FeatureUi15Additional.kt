package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Operations whose15.0 data flow changed beyond a symbol rebinding. */
internal fun featureUi15AdditionalPlans() = listOf(
    // The explicit/default warning-border scalar converges in v17, as in14.17;
    // unrelated Compose registers and lambda allocations changed after the join.
    MethodPlan("Ldoh;->a(Landroidx/compose/ui/Modifier;Li49;Lk49;Lu39;Ls39;Lu39;Lu39;ZLlqk\$a;Landroidx/compose/runtime/Composer;II)V", 35, 318, listOf(
        Guard(140, Opcode.MOVE_FROM16, listOf(17, 11)),
        Guard(155, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(156, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(157, Opcode.MOVE_RESULT, listOf(11)),
    ), listOf(Edit(156, "insert", "const/16 v17, 0x1")),
        mapOf("Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),

    // Warning-settings drawer now reorders callback parameters. Its genuine
    // State still supplies all other content; override only the local Boolean.
    MethodPlan("Ljph;->a(ILwu;Ls39;Li49;Llqk;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)V", 26, 185, listOf(
        Guard(116, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;"),
        Guard(118, Opcode.CHECK_CAST, listOf(16), "Ljava/lang/Boolean;"),
        Guard(119, Opcode.INVOKE_VIRTUAL_RANGE, listOf(16), "Ljava/lang/Boolean;->booleanValue()Z"),
        Guard(120, Opcode.MOVE_RESULT, listOf(16)),
        Guard(121, Opcode.CONST, listOf(14)),
    ), listOf(Edit(121, "insert", "const/16 v16, 0x1")),
        mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1)),

    // R8 split the settings-resume arm out of the old merged dg8 lambda.
    // Vehicle refresh and real notification-permission checks remain intact.
    MethodPlan("Lk1h;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 7, 39, listOf(
        Guard(19, Opcode.IGET_OBJECT, listOf(4, 0), "Lzmh;->I:Liji;"),
        Guard(20, Opcode.IGET_OBJECT, listOf(5, 0), "Lzmh;->b:Laqe;"),
        Guard(21, Opcode.INVOKE_INTERFACE, listOf(5, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(22, Opcode.MOVE_RESULT, listOf(5)),
        Guard(23, Opcode.INVOKE_STATIC, listOf(5), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
    ), listOf(Edit(23, "insert", "const/16 v5, 0x1")),
        mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1,
            "Lhae;->b(Landroid/content/Context;Ljava/lang/String;)Z" to 1)),

    // Speed-camera repository now awaits the traffic-camera preference from its
    // actual StateFlow. Keep that read, geohash query and saved sound preference.
    MethodPlan("Lefi;->q(Ljava/util/List;Lsn4;)Ljava/lang/Object;", 15, 123, listOf(
        Guard(42, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(43, Opcode.MOVE_RESULT, listOf(14)),
        Guard(44, Opcode.IF_EQZ, listOf(14), null, 53),
        Guard(45, Opcode.SGET_OBJECT, listOf(14), "Lsuh;->x:Ltuh;"),
        Guard(47, Opcode.INVOKE_VIRTUAL, listOf(14, 0), "Ltuh;->a(Landroid/content/Context;)Z"),
    ), listOf(Edit(44, "insert", "const/16 v14, 0x1")),
        mapOf("Llp0;->k()Z" to 1, "Lsuh;->x:Ltuh;" to 1)),

    // Average-speed calculation moved from AvgSpeedCheckTask to this selected-
    // report worker. Preserve the selected report, geometry, calculator and
    // nullable result; permit only its local eligibility continuation.
    MethodPlan("Lwd6\$b\$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 8, 96, listOf(
        Guard(42, Opcode.CHECK_CAST, listOf(1), "Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;"),
        Guard(45, Opcode.IF_EQZ, listOf(1), null, 83),
        Guard(46, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(47, Opcode.MOVE_RESULT, listOf(4)),
        Guard(48, Opcode.IF_NEZ, listOf(4), null, 50),
        Guard(49, Opcode.GOTO, listOf(), null, 83),
        Guard(53, Opcode.INVOKE_VIRTUAL, listOf(4, 1, 0, 5), "Lgz0;->a(Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;Landroid/location/Location;F)Ljava/lang/Integer;"),
    ), listOf(Edit(48, "insert", "const/16 v4, 0x1")),
        mapOf("Llp0;->k()Z" to 1,
            "Lgz0;->a(Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;Landroid/location/Location;F)Ljava/lang/Integer;" to 1)),
)
