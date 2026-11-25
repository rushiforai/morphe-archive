package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Separately guarded15.0 operations derived from the publisher artifact. */
internal fun proNotices15Plans() = listOf(
    MethodPlan("Lt9d;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", 4, 33, listOf(
        Guard(20, Opcode.MOVE_RESULT_OBJECT, listOf(3)),
        Guard(21, Opcode.CHECK_CAST, listOf(3), "Laqe;"),
        Guard(22, Opcode.INVOKE_INTERFACE, listOf(3, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(23, Opcode.MOVE_RESULT, listOf(3)),
        Guard(24, Opcode.IF_EQZ, listOf(3), null, 26),
        Guard(25, Opcode.GOTO, listOf(), null, 29)
    ), listOf(
        Edit(24, "replace", "nop")
    ), mapOf("Laqe;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lu9d;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 4, 34, listOf(
        Guard(21, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
        Guard(22, Opcode.CHECK_CAST, listOf(2), "Laqe;"),
        Guard(23, Opcode.INVOKE_INTERFACE, listOf(2, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(24, Opcode.MOVE_RESULT, listOf(2)),
        Guard(25, Opcode.IF_EQZ, listOf(2), null, 27),
        Guard(26, Opcode.GOTO, listOf(), null, 30)
    ), listOf(
        Edit(25, "replace", "nop")
    ), mapOf("Laqe;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lpp5;->b(Landroidx/compose/ui/Modifier;Ly8i;Lnl/flitsmeister/fmx/activities/main/k;Lu39;Lu39;Lu39;Lu39;Lqp5;Landroidx/compose/runtime/Composer;I)V", 55, 1021, listOf(
        Guard(856, Opcode.MOVE_RESULT_OBJECT, listOf(3)),
        Guard(857, Opcode.CHECK_CAST, listOf(3), "Landroid/content/Context;"),
        Guard(858, Opcode.INVOKE_INTERFACE, listOf(1, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(859, Opcode.MOVE_RESULT, listOf(1)),
        Guard(860, Opcode.IF_NEZ, listOf(1), null, 937),
        Guard(861, Opcode.CONST, listOf(1))
    ), listOf(
        Edit(860, "goto", "", 937)
    ), mapOf("Landroid/content/Context;" to 2, "Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lnl/flitsmeister/controllers/fragments/achievements/AchievementFragment;->onResume()V", 6, 87, listOf(
        Guard(63, Opcode.INVOKE_INTERFACE, listOf(1, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(64, Opcode.MOVE_RESULT, listOf(0)),
        Guard(65, Opcode.IF_EQZ, listOf(0), null, 77),
        Guard(66, Opcode.INVOKE_VIRTUAL, listOf(5), "Lkb1;->getBinding()Landroidx/viewbinding/ViewBinding;")
    ), listOf(
        Edit(65, "goto", "", 77)
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lkb1;->getBinding()Landroidx/viewbinding/ViewBinding;" to 5)),
    MethodPlan("Lsvb;->a(Lbi7;Landroidx/compose/runtime/Composer;I)V", 13, 140, listOf(
        Guard(84, Opcode.INVOKE_INTERFACE, listOf(0, 11), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(85, Opcode.MOVE_RESULT, listOf(0)),
        Guard(86, Opcode.IF_EQZ, listOf(0), null, 95),
        Guard(87, Opcode.CONST, listOf(0))
    ), listOf(
        Edit(86, "insert", "const/16 v0, 0x0")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lmke;->a(Landroidx/compose/ui/Modifier;FLs39;Ljava/lang/String;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/runtime/Composer;II)V", 67, 575, listOf(
        Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(1, 59)),
        Guard(1, Opcode.MOVE_OBJECT_FROM16, listOf(3, 61))
    ), listOf(
        Edit(0, "body", "return-void")
    ), mapOf()),
    MethodPlan("Lmke;->b(ILs39;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;Ljava/lang/String;)V", 39, 282, listOf(
        Guard(0, Opcode.MOVE_FROM16, listOf(0, 34)),
        Guard(1, Opcode.MOVE_OBJECT_FROM16, listOf(1, 35))
    ), listOf(
        Edit(0, "body", "return-void")
    ), mapOf()),
    MethodPlan("Lole;->b(Landroidx/compose/ui/Modifier;Lple\$a\$a;JLandroidx/compose/runtime/Composer;II)V", 21, 102, listOf(
        Guard(0, Opcode.MOVE_FROM16, listOf(5, 19)),
        Guard(1, Opcode.INVOKE_VIRTUAL, listOf(15), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")
    ), listOf(
        Edit(0, "body", "return-void")
    ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 1)),
    MethodPlan("Lole;->d(Landroidx/compose/ui/Modifier;Lple\$a\$a;JLandroidx/compose/runtime/Composer;II)V", 21, 131, listOf(
        Guard(0, Opcode.MOVE_FROM16, listOf(5, 19)),
        Guard(1, Opcode.INVOKE_VIRTUAL, listOf(15), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")
    ), listOf(
        Edit(0, "body", "return-void")
    ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 1)),
    MethodPlan("Ll0h;->a(Landroidx/compose/ui/Modifier;Ls39;Lu39;Lzt0;Landroidx/compose/foundation/ScrollState;Landroidx/compose/runtime/Composer;I)V", 15, 121, listOf(
        Guard(94, Opcode.CONST_16, listOf(2)),
        Guard(95, Opcode.INVOKE_STATIC, listOf(1, 0, 13, 2), "Lzpe;->a(Landroidx/compose/ui/Modifier;Li49;Landroidx/compose/runtime/Composer;I)V"),
        Guard(96, Opcode.INVOKE_INTERFACE, listOf(13), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V")
    ), listOf(
        Edit(95, "replace", "nop")
    ), mapOf("Lzpe;->a(Landroidx/compose/ui/Modifier;Li49;Landroidx/compose/runtime/Composer;I)V" to 1, "Landroidx/compose/runtime/Composer;->endReplaceGroup()V" to 2)),
    MethodPlan("Lp0a;->f(Landroid/content/Context;ZLjava/util/Date;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V", 15, 70, listOf(
        Guard(66, Opcode.INVOKE_STATIC, listOf(), "Lnl/flitsmeister/fmcore/models/eventbuses/ShowProOnboardingBusKt;->getBusShowProOnboarding()Las7;"),
        Guard(67, Opcode.MOVE_RESULT_OBJECT, listOf(5)),
        Guard(68, Opcode.INVOKE_VIRTUAL, listOf(5, 2), "Las7;->a(Ljava/lang/Object;)V"),
        Guard(69, Opcode.RETURN_VOID, listOf())
    ), listOf(
        Edit(68, "replace", "nop")
    ), mapOf("Lnl/flitsmeister/fmcore/models/eventbuses/ShowProOnboardingBusKt;->getBusShowProOnboarding()Las7;" to 1, "Las7;->a(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lwwb;->b(ZLjava/lang/String;Landroid/graphics/Bitmap;Landroidx/compose/ui/graphics/painter/Painter;Ls39;Ljava/lang/String;Ls39;Ljava/lang/String;ZLandroidx/compose/runtime/Composer;I)V", 51, 751, listOf(
        Guard(478, Opcode.CHECK_CAST, listOf(9), "Lfoi;"),
        Guard(479, Opcode.INVOKE_STATIC, listOf(9, 11), "Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;"),
        Guard(480, Opcode.MOVE_RESULT_OBJECT, listOf(9)),
        Guard(485, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endNode()V")
    ), listOf(
        Edit(479, "labelled", "instance-of v13, v9, Lfoi\$b;\nif-nez v13, :morphe_join\ninstance-of v13, v9, Lfoi\$c;\nif-nez v13, :morphe_join", 485)
    ), mapOf("Lfoi;" to 1, "Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;" to 1, "Landroidx/compose/runtime/Composer;->endNode()V" to 2)),
    MethodPlan("Lfb0;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 65, 662, listOf(
        Guard(56, Opcode.SGET_OBJECT, listOf(2), "Lfoi\$d;->a:Lfoi\$d;"),
        Guard(57, Opcode.INVOKE_STATIC, listOf(2, 8), "Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;"),
        Guard(58, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
        Guard(59, Opcode.INVOKE_INTERFACE, listOf(8), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V")
    ), listOf(
        Edit(57, "labelled_at_join", "instance-of v3, v2, Lfoi\$b;\nif-nez v3, :morphe_badge_none\ninstance-of v3, v2, Lfoi\$c;\nif-nez v3, :morphe_badge_none\ngoto :morphe_badge_real\n:morphe_badge_none\nconst/4 v2, 0x0\ngoto :morphe_join\n:morphe_badge_real\ninvoke-static {v2, v8}, Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;", 59)
    ), mapOf("Lfoi\$d;->a:Lfoi\$d;" to 1, "Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;" to 1, "Landroidx/compose/runtime/Composer;->endReplaceGroup()V" to 4)),
    MethodPlan("Lca2;->onDraw(Landroid/graphics/Canvas;)V", 36, 1546, listOf(
        Guard(106, Opcode.INVOKE_VIRTUAL, listOf(0, 2), "Landroid/graphics/Canvas;->drawColor(I)V"),
        Guard(107, Opcode.IGET_OBJECT, listOf(2, 9), "Laa2;->d:Lkeb;"),
        Guard(108, Opcode.SGET_OBJECT, listOf(3), "Lkeb;->a:Lkeb;"),
        Guard(109, Opcode.IF_NE, listOf(2, 3), null, 111)
    ), listOf(
        Edit(108, "labelled", "sget-object v3, Lkeb;->c:Lkeb;\nif-eq v2, v3, :morphe_join", 1545)
    ), mapOf("Landroid/graphics/Canvas;->drawColor(I)V" to 1, "Laa2;->d:Lkeb;" to 5, "Lkeb;->a:Lkeb;" to 1))
)
