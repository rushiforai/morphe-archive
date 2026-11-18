package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Changed15.0 rendering/completion leaves, preserving genuine account data. */
internal fun proNotices15AdditionalPlans() = listOf(
    MethodPlan("Loih;->a(Landroidx/compose/ui/Modifier;Lpih;Ls39;Lu39;ZZZLandroidx/compose/foundation/ScrollState;Ljava/lang/String;Lk49;Landroidx/compose/runtime/Composer;II)V", 48, 577, listOf(
        Guard(544, Opcode.MOVE_OBJECT_FROM16, listOf(14, 35)),
        Guard(547, Opcode.MOVE_OBJECT_FROM16, listOf(19, 13)),
        Guard(548, Opcode.MOVE, listOf(13, 1)),
        Guard(549, Opcode.INVOKE_STATIC_RANGE, (13..21).toList(), "Landroidx/compose/animation/AnimatedVisibilityKt;->AnimatedVisibility(ZLandroidx/compose/ui/Modifier;Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;Ljava/lang/String;Lk49;Landroidx/compose/runtime/Composer;II)V"),
        Guard(550, Opcode.MOVE_OBJECT_FROM16, listOf(17, 19)),
    ), listOf(Edit(549, "insert", "const/16 v13, 0x0")), mapOf(
        "Landroidx/compose/animation/AnimatedVisibilityKt;->AnimatedVisibility(ZLandroidx/compose/ui/Modifier;Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;Ljava/lang/String;Lk49;Landroidx/compose/runtime/Composer;II)V" to 1)),

    // This coroutine renders only the automatic expired-Pro notice. Complete its
    // actual15.0 F3 UI state, retaining coroutine validation and typed Unit result.
    MethodPlan("Lx6b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 8, 66, listOf(
        Guard(0, Opcode.IGET_OBJECT, listOf(0, 6), "Lx6b;->a:Ljava/lang/Object;"),
        Guard(1, Opcode.CHECK_CAST, listOf(0), "Ljava/lang/Boolean;"),
        Guard(57, Opcode.INVOKE_VIRTUAL, listOf(2), "Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;"),
        Guard(59, Opcode.IGET_OBJECT, listOf(6, 6), "Lnl/flitsmeister/fmx/activities/main/k;->F3:Liji;"),
        Guard(63, Opcode.INVOKE_VIRTUAL, listOf(6, 0, 7), "Liji;->l(Ljava/lang/Object;Ljava/lang/Object;)Z"),
    ), listOf(Edit(0, "body", """
        invoke-static {p1}, Lhof;->b(Ljava/lang/Object;)V
        iget-object v0, p0, Lx6b;->b:Lnl/flitsmeister/fmx/activities/main/MainActivity;
        invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
        move-result-object v0
        iget-object v0, v0, Lnl/flitsmeister/fmx/activities/main/k;->F3:Liji;
        sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
        const/4 v2, 0x0
        invoke-virtual {v0, v2, v1}, Liji;->l(Ljava/lang/Object;Ljava/lang/Object;)Z
        sget-object v0, Ll1k;->a:Ll1k;
        return-object v0
    """.trimIndent())), mapOf(
        "Lx6b;->a:Ljava/lang/Object;" to 1,
        "Lnl/flitsmeister/fmx/activities/main/k;->F3:Liji;" to 1)),
)
