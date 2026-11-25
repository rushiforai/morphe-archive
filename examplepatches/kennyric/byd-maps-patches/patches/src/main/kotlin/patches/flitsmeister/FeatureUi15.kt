package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Separately guarded15.0 operations derived from the publisher artifact. */
internal fun featureUi15Plans() = listOf(
    MethodPlan("Lwlh;->a(Landroidx/compose/ui/Modifier;Lu39;Lu39;Lu39;Lu39;Ls39;Lzdi\$d;ZLandroidx/compose/runtime/Composer;II)V", 50, 473, listOf(
        Guard(144, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(145, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(146, Opcode.MOVE_RESULT, listOf(14))
    ), listOf(
        Edit(145, "insert", "const/16 v11, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 3)),
    MethodPlan("Lxoh;->a(Landroidx/compose/ui/Modifier;Li49;Lk49;Li49;Ls39;Lwu;Llqk\$a;Llqk\$j;ZLandroidx/compose/runtime/Composer;I)V", 35, 343, listOf(
        Guard(141, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(142, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(143, Opcode.MOVE_RESULT, listOf(14))
    ), listOf(
        Edit(142, "insert", "const/16 v16, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lwnh;->a(Landroidx/compose/ui/Modifier;Li49;Li49;Lk49;Lu39;Ls39;Lwu;Llqk\$a;ZLandroidx/compose/runtime/Composer;I)V", 32, 238, listOf(
        Guard(127, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(128, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(129, Opcode.MOVE_RESULT, listOf(10))
    ), listOf(
        Edit(128, "insert", "const/16 v14, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Ly4h;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 16, 112, listOf(
        Guard(49, Opcode.INVOKE_VIRTUAL, listOf(13), "Ljava/lang/Boolean;->booleanValue()Z"),
        Guard(50, Opcode.MOVE_RESULT, listOf(7)),
        Guard(51, Opcode.INVOKE_INTERFACE, listOf(9, 2), "Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z"),
        Guard(52, Opcode.MOVE_RESULT, listOf(13))
    ), listOf(
        Edit(51, "insert", "const/16 v7, 0x1")
    ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1, "Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z" to 4)),
    MethodPlan("Lfxa;->b(Landroidx/compose/ui/Modifier;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ZZZLe79;ZLs39;Landroidx/compose/runtime/Composer;II)V", 48, 809, listOf(
        Guard(190, Opcode.MOVE_RESULT, listOf(7)),
        Guard(192, Opcode.IF_NEZ, listOf(3), null, 219),
        Guard(193, Opcode.CONST, listOf(7))
    ), listOf(
        Edit(192, "at_join", "const/16 v7, 0x1\nif-nez v3, :morphe_join", 219)
    ), mapOf()),
    MethodPlan("Lsfh;->a(Landroidx/compose/ui/Modifier;Lvgh\$a;Lvgh;Ls39;Lu39;Landroidx/compose/runtime/Composer;I)V", 50, 389, listOf(
        Guard(79, Opcode.INVOKE_STATIC, listOf(0, 8, 15, 13), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
        Guard(80, Opcode.INVOKE_STATIC, listOf(1), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(81, Opcode.MOVE_RESULT_OBJECT, listOf(0))
    ), listOf(
        Edit(80, "replace", "invoke-static {v1}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 3, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lsfh;->b(Landroidx/compose/ui/Modifier;Lvgh;Lvgh\$a;Lu39;Lu39;Ls39;Lu39;Landroidx/compose/runtime/Composer;I)V", 34, 286, listOf(
        Guard(202, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Boolean;->booleanValue()Z"),
        Guard(203, Opcode.MOVE_RESULT, listOf(18)),
        Guard(204, Opcode.CONST, listOf(1)),
        Guard(205, Opcode.INVOKE_STATIC, listOf(1, 13, 6), "Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;")
    ), listOf(
        Edit(204, "insert", "const/16 v18, 0x1")
    ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1, "Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;" to 1)),
    MethodPlan("Lyzg;->a(Landroidx/compose/ui/Modifier;Lu35;Lu39;Lku0;Ls39;Lu39;Lu39;Ls39;Ls39;Landroidx/compose/runtime/Composer;I)V", 48, 452, listOf(
        Guard(150, Opcode.INVOKE_STATIC, listOf(8, 11, 15, 0), "Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Li49;Landroidx/compose/runtime/Composer;I)V"),
        Guard(151, Opcode.INVOKE_STATIC, listOf(15), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(152, Opcode.MOVE_RESULT_OBJECT, listOf(0))
    ), listOf(
        Edit(151, "replace", "invoke-static {v15}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Li49;Landroidx/compose/runtime/Composer;I)V" to 1, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Ldph;->a(Landroidx/compose/ui/Modifier;Li49;Lk49;Lu39;Ls39;Lu39;Llqk\$a;Llqk\$j;ZLandroidx/compose/runtime/Composer;II)V", 33, 271, listOf(
        Guard(156, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(157, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(158, Opcode.MOVE_RESULT, listOf(14))
    ), listOf(
        Edit(157, "insert", "const/16 v10, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Ljrh;->a(Landroidx/compose/ui/Modifier;Li49;Lk49;Lu39;Ls39;Lwu;Llqk\$a;Llqk\$j;ZLandroidx/compose/runtime/Composer;I)V", 32, 281, listOf(
        Guard(142, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(143, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(144, Opcode.MOVE_RESULT, listOf(10))
    ), listOf(
        Edit(143, "insert", "const/16 v16, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lamh;->a(Landroidx/compose/ui/Modifier;Lu39;Lu39;Ls39;Ls39;Lzdi\$d;Landroidx/compose/runtime/Composer;I)V", 26, 188, listOf(
        Guard(99, Opcode.INVOKE_INTERFACE, listOf(2, 1), "Lu39;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"),
        Guard(100, Opcode.INVOKE_STATIC, listOf(13), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(101, Opcode.MOVE_RESULT_OBJECT, listOf(1))
    ), listOf(
        Edit(100, "replace", "invoke-static {v13}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Lu39;->invoke(Ljava/lang/Object;)Ljava/lang/Object;" to 1, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lkqh;->c(Landroidx/compose/ui/Modifier;Li49;Lk49;Li49;Ls39;Ls39;Lu39;Llqk\$c;Llqk\$j;ZLandroidx/compose/runtime/Composer;II)V", 35, 275, listOf(
        Guard(157, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(158, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(159, Opcode.MOVE_RESULT, listOf(11))
    ), listOf(
        Edit(158, "insert", "const/16 v4, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lrth;->a(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/fmcore/data/model/reports/Incident;ZLi49;Li49;Lu39;Ls39;Lu39;Llqk\$k;Llqk\$j;ZLandroidx/compose/runtime/Composer;III)V", 35, 342, listOf(
        Guard(190, Opcode.INVOKE_INTERFACE, listOf(5), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(191, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(192, Opcode.MOVE_RESULT, listOf(14))
    ), listOf(
        Edit(191, "insert", "const/16 v2, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lvwg;->a(Landroidx/compose/ui/Modifier;Lwwg;Lu39;Ls39;Landroidx/compose/runtime/Composer;I)V", 26, 186, listOf(
        Guard(84, Opcode.INVOKE_STATIC, listOf(0, 1, 2, 7), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
        Guard(85, Opcode.INVOKE_STATIC, listOf(11), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(86, Opcode.MOVE_RESULT_OBJECT, listOf(16))
    ), listOf(
        Edit(85, "replace", "invoke-static {v11}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 1, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Loqh;->a(Landroidx/compose/ui/Modifier;Li49;Li49;Lk49;Lu39;Ls39;Lwu;Llqk\$a;ZLandroidx/compose/runtime/Composer;I)V", 32, 240, listOf(
        Guard(127, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(128, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(129, Opcode.MOVE_RESULT, listOf(10))
    ), listOf(
        Edit(128, "insert", "const/16 v14, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lprh;->a(Landroidx/compose/ui/Modifier;Li49;Li49;Li49;Lk49;Li49;Ls39;Lu39;Lu39;Llqk\$e;ZLandroidx/compose/runtime/Composer;III)V", 38, 299, listOf(
        Guard(175, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(176, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(177, Opcode.MOVE_RESULT, listOf(14))
    ), listOf(
        Edit(176, "insert", "const/16 v13, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqa0;->b(Landroidx/compose/ui/Modifier;Landroidx/compose/material/ModalBottomSheetState;Lua0;Lag4;Ls39;Ls39;Landroidx/compose/runtime/Composer;I)V", 40, 329, listOf(
        Guard(107, Opcode.INVOKE_STATIC, listOf(1, 15, 6, 5), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
        Guard(108, Opcode.INVOKE_STATIC, listOf(13), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(109, Opcode.MOVE_RESULT_OBJECT, listOf(1))
    ), listOf(
        Edit(108, "replace", "invoke-static {v13}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 3, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lh0h;->b(Landroidx/compose/ui/Modifier;Lu39;Lu39;Ls39;Ltu0;ZLs39;Landroidx/compose/runtime/Composer;II)V", 33, 230, listOf(
        Guard(132, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(133, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(134, Opcode.MOVE_RESULT, listOf(4))
    ), listOf(
        Edit(133, "insert", "const/16 v16, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Ljnh;->a(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/fmcore/data/model/reports/Incident;Lnl/flitsmeister/models/enums/SignalScreens;ZZLs39;Lu39;Li49;Lu39;Landroidx/compose/runtime/Composer;I)V", 37, 242, listOf(
        Guard(134, Opcode.INVOKE_INTERFACE, listOf(13), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(135, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(136, Opcode.MOVE_RESULT, listOf(9))
    ), listOf(
        Edit(135, "insert", "const/16 v3, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqph;->a(Landroidx/compose/ui/Modifier;Lu39;Lk49;Ls39;Llqk\$b;ZZLu39;Landroidx/compose/runtime/Composer;II)V", 28, 244, listOf(
        Guard(136, Opcode.INVOKE_INTERFACE, listOf(14), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(137, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(138, Opcode.MOVE_RESULT, listOf(7))
    ), listOf(
        Edit(137, "insert", "const/16 v10, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Le3h;->a(Landroidx/compose/ui/Modifier;Les8;ZLs39;Lu39;Landroidx/compose/runtime/Composer;I)V", 28, 213, listOf(
        Guard(94, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(95, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(96, Opcode.MOVE_RESULT, listOf(2))
    ), listOf(
        Edit(95, "insert", "const/16 v13, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lehh;->a(Landroidx/compose/ui/Modifier;Lfwc;Lu39;Ls39;ZLandroidx/compose/runtime/Composer;I)V", 27, 217, listOf(
        Guard(96, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(97, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(98, Opcode.MOVE_RESULT, listOf(2))
    ), listOf(
        Edit(97, "insert", "const/16 v13, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lrph;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 24, 84, listOf(
        Guard(38, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Boolean;->booleanValue()Z"),
        Guard(39, Opcode.MOVE_RESULT, listOf(8)),
        Guard(40, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;"),
        Guard(41, Opcode.MOVE_RESULT_OBJECT, listOf(1))
    ), listOf(
        Edit(40, "insert", "const/16 v8, 0x1")
    ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1, "Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;" to 1)),
    MethodPlan("Ltqh;->a(Landroidx/compose/ui/Modifier;Li49;Li49;Lk49;Lu39;Ls39;Lwu;Llqk\$a;ZLandroidx/compose/runtime/Composer;I)V", 32, 235, listOf(
        Guard(127, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(128, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(129, Opcode.MOVE_RESULT, listOf(10))
    ), listOf(
        Edit(128, "insert", "const/16 v14, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lzsh;->a(IILwu;Ls39;Li49;Li49;Li49;Li49;Llqk\$g;Llqk\$j;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;Z)V", 35, 291, listOf(
        Guard(143, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(144, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(145, Opcode.MOVE_RESULT, listOf(11))
    ), listOf(
        Edit(144, "insert", "const/16 v7, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Le2h;->a(Landroidx/compose/ui/Modifier;Lg2h;Lu39;Ls39;ZLandroidx/compose/runtime/Composer;I)V", 27, 209, listOf(
        Guard(99, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(100, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(101, Opcode.MOVE_RESULT, listOf(7))
    ), listOf(
        Edit(100, "insert", "const/16 v13, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lmzg;->a(Landroidx/compose/ui/Modifier;Lu35;Lu39;Lys0;Ls39;Ls39;Lu39;Lu39;Lu39;Lu39;Landroidx/compose/runtime/Composer;I)V", 51, 526, listOf(
        Guard(168, Opcode.INVOKE_STATIC, listOf(14, 1, 5, 0), "Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Li49;Landroidx/compose/runtime/Composer;I)V"),
        Guard(169, Opcode.INVOKE_STATIC, listOf(5), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(170, Opcode.MOVE_RESULT_OBJECT, listOf(0))
    ), listOf(
        Edit(169, "replace", "invoke-static {v5}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Li49;Landroidx/compose/runtime/Composer;I)V" to 1, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lg4h;->a(Landroidx/compose/ui/Modifier;Ljnb;Lu39;Ls39;Landroidx/compose/runtime/Composer;I)V", 26, 206, listOf(
        Guard(90, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
        Guard(91, Opcode.INVOKE_STATIC, listOf(11), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(92, Opcode.MOVE_RESULT_OBJECT, listOf(7))
    ), listOf(
        Edit(91, "replace", "invoke-static {v11}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lkbk;->c(Landroidx/compose/ui/Modifier;Ls39;Landroidx/compose/material/ModalBottomSheetState;Lubk;Ls39;Lpbk;Landroidx/compose/runtime/Composer;I)V", 40, 336, listOf(
        Guard(106, Opcode.INVOKE_STATIC, listOf(1, 2, 8, 6), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
        Guard(107, Opcode.INVOKE_STATIC, listOf(14), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(108, Opcode.MOVE_RESULT_OBJECT, listOf(1))
    ), listOf(
        Edit(107, "replace", "invoke-static {v14}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 3, "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lmnh;->a(Landroidx/compose/ui/Modifier;ZZLs39;Li49;Lu39;Lwu;Landroidx/compose/runtime/Composer;I)V", 31, 213, listOf(
        Guard(99, Opcode.INVOKE_INTERFACE, listOf(1), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(100, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(101, Opcode.MOVE_RESULT, listOf(5))
    ), listOf(
        Edit(100, "insert", "const/16 v12, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqoh;->a(Landroidx/compose/ui/Modifier;Li49;Lk49;Lu39;Ls39;Lu39;Lwu;ZLlqk\$a;Landroidx/compose/runtime/Composer;I)V", 34, 281, listOf(
        Guard(125, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(126, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(127, Opcode.MOVE_RESULT, listOf(8))
    ), listOf(
        Edit(126, "insert", "const/16 v14, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lkhh;->a(Landroidx/compose/ui/Modifier;Lkjd;Lag4;Lu39;Ls39;Landroidx/compose/runtime/Composer;I)V", 31, 237, listOf(
        Guard(136, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
        Guard(137, Opcode.INVOKE_STATIC, listOf(15), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(138, Opcode.MOVE_RESULT_OBJECT, listOf(6))
    ), listOf(
        Edit(137, "replace", "invoke-static {v15}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lk2h;->a(Landroidx/compose/ui/Modifier;Lua0;Lt37;Lu39;Lu39;Ls39;ZLandroidx/compose/runtime/Composer;I)V", 48, 398, listOf(
        Guard(123, Opcode.INVOKE_INTERFACE, listOf(14), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(124, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(125, Opcode.MOVE_RESULT, listOf(11))
    ), listOf(
        Edit(124, "insert", "const/16 v9, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Leth;->b(Landroidx/compose/ui/Modifier;Lu39;Lu39;Ls39;Lu39;Llqk\$h;ZLandroidx/compose/runtime/Composer;II)V", 30, 230, listOf(
        Guard(122, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(123, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(124, Opcode.MOVE_RESULT, listOf(9))
    ), listOf(
        Edit(123, "insert", "const/16 v4, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lcrh;->a(IILwu;Ls39;Li49;Li49;Li49;Li49;Llqk\$g;Llqk\$j;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;Z)V", 34, 288, listOf(
        Guard(143, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(144, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(145, Opcode.MOVE_RESULT, listOf(11))
    ), listOf(
        Edit(144, "insert", "const/16 v7, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lfsh;->a(Landroidx/compose/ui/Modifier;Lu39;Lu39;Lu39;Lu39;Lu39;Lu39;Ls39;Landroidx/compose/foundation/ScrollState;Li49;Llqk\$f;ZLandroidx/compose/runtime/Composer;II)V", 37, 331, listOf(
        Guard(176, Opcode.INVOKE_INTERFACE, listOf(7), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(177, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(178, Opcode.MOVE_RESULT, listOf(5))
    ), listOf(
        Edit(177, "insert", "const/16 v0, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lith;->a(Landroidx/compose/ui/Modifier;Lu39;Ls39;Lwu;Llqk\$i;ZLandroidx/compose/runtime/Composer;I)V", 26, 158, listOf(
        Guard(96, Opcode.INVOKE_INTERFACE, listOf(15), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
        Guard(97, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
        Guard(98, Opcode.MOVE_RESULT, listOf(5))
    ), listOf(
        Edit(97, "insert", "const/16 v11, 0x1")
    ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Liif;->a(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Ljava/lang/String;ILjava/lang/Float;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Integer;Landroidx/compose/ui/graphics/Color;Ljava/lang/String;ZZZLu39;Landroidx/compose/runtime/Composer;III)V", 72, 1356, listOf(
        Guard(322, Opcode.MOVE_RESULT_OBJECT, listOf(3)),
        Guard(323, Opcode.INVOKE_STATIC, listOf(15), "Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
        Guard(324, Opcode.MOVE_RESULT_OBJECT, listOf(10))
    ), listOf(
        Edit(323, "replace", "invoke-static {v15}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
    ), mapOf("Lzpe;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lwkb;->v()V", 6, 83, listOf(
        Guard(19, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(20, Opcode.MOVE_RESULT, listOf(0)),
        Guard(21, Opcode.IF_NEZ, listOf(0), null, 24),
        Guard(22, Opcode.SGET_OBJECT, listOf(0), "Lbgb\$a;->a:Lbgb\$a;")
    ), listOf(
        Edit(21, "insert", "const/16 v0, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lbgb\$a;->a:Lbgb\$a;" to 2)),
    MethodPlan("Lwkb;->w()V", 5, 48, listOf(
        Guard(8, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(9, Opcode.MOVE_RESULT, listOf(0)),
        Guard(10, Opcode.IGET_OBJECT, listOf(1, 4), "Lwkb;->I1:Ldkb;"),
        Guard(11, Opcode.IGET_OBJECT, listOf(2, 1), "Ldkb;->m:Ljava/util/List;")
    ), listOf(
        Edit(10, "insert", "const/16 v0, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lwkb;->I1:Ldkb;" to 1, "Ldkb;->m:Ljava/util/List;" to 1)),
    MethodPlan("Lslb;->onMove(Lorg/maplibre/android/gestures/MoveGestureDetector;)V", 8, 34, listOf(
        Guard(3, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(4, Opcode.MOVE_RESULT, listOf(0)),
        Guard(5, Opcode.IF_EQZ, listOf(0), null, 33),
        Guard(6, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->u0:Ltuh;")
    ), listOf(
        Edit(5, "insert", "const/16 v0, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lsuh;->u0:Ltuh;" to 1)),
    MethodPlan("Lv08;->a(Landroid/content/Context;)Ljava/util/ArrayList;", 13, 85, listOf(
        Guard(1, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(2, Opcode.MOVE_RESULT, listOf(0)),
        Guard(3, Opcode.CONST_4, listOf(1)),
        Guard(4, Opcode.CONST_4, listOf(2))
    ), listOf(
        Edit(3, "insert", "const/16 v0, 0x1")
    ), mapOf("Llp0;->k()Z" to 1)),
    MethodPlan("Lpfe;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 13, 96, listOf(
        Guard(23, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(24, Opcode.MOVE_RESULT, listOf(12)),
        Guard(25, Opcode.IF_EQZ, listOf(12), null, 94),
        Guard(26, Opcode.INVOKE_STATIC, listOf(), "Llp0;->h()Lrie;")
    ), listOf(
        Edit(25, "insert", "const/16 v12, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Llp0;->h()Lrie;" to 1)),
    MethodPlan("Lka1;->k(Ljava/util/Collection;Landroid/content/Context;)Ljava/util/ArrayList;", 19, 182, listOf(
        Guard(3, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(4, Opcode.MOVE_RESULT, listOf(1)),
        Guard(5, Opcode.NEW_INSTANCE, listOf(2), "Lba1;"),
        Guard(6, Opcode.INVOKE_DIRECT, listOf(2, 0, 1), "Lba1;-><init>(Landroid/content/Context;Z)V")
    ), listOf(
        Edit(5, "insert", "const/16 v1, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lba1;" to 1, "Lba1;-><init>(Landroid/content/Context;Z)V" to 1)),
    MethodPlan("Llh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V", 15, 248, listOf(
        Guard(11, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(12, Opcode.MOVE_RESULT, listOf(0)),
        Guard(13, Opcode.INVOKE_VIRTUAL, listOf(14), "Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;->getType()Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;"),
        Guard(14, Opcode.MOVE_RESULT_OBJECT, listOf(2))
    ), listOf(
        Edit(13, "insert", "const/16 v0, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;->getType()Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;" to 5)),
    MethodPlan("Lw91;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V", 5, 35, listOf(
        Guard(23, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(24, Opcode.MOVE_RESULT, listOf(4)),
        Guard(25, Opcode.IF_NEZ, listOf(4), null, 31),
        Guard(26, Opcode.INVOKE_VIRTUAL, listOf(2), "Lw91;->y()Ljava/lang/Boolean;")
    ), listOf(
        Edit(25, "insert", "const/16 v4, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lw91;->y()Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lw91;->start()V", 14, 59, listOf(
        Guard(18, Opcode.INVOKE_STATIC, listOf(), "Llp0;->k()Z"),
        Guard(19, Opcode.MOVE_RESULT, listOf(1)),
        Guard(20, Opcode.IF_NEZ, listOf(1), null, 26),
        Guard(21, Opcode.INVOKE_VIRTUAL, listOf(13), "Lw91;->y()Ljava/lang/Boolean;")
    ), listOf(
        Edit(20, "insert", "const/16 v1, 0x1")
    ), mapOf("Llp0;->k()Z" to 1, "Lw91;->y()Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lfuf;->b(Lw71;)V", 9, 67, listOf(
        Guard(4, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(5, Opcode.MOVE_RESULT, listOf(0)),
        Guard(6, Opcode.IGET_OBJECT, listOf(1, 7), "Llb1;->b:Landroidx/viewbinding/ViewBinding;"),
        Guard(7, Opcode.CHECK_CAST, listOf(1), "Ldva;")
    ), listOf(
        Edit(6, "insert", "const/16 v0, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Llb1;->b:Landroidx/viewbinding/ViewBinding;" to 1, "Ldva;" to 1)),
    MethodPlan("Lubk;-><init>(Landroid/app/Application;Laqe;)V", 5, 49, listOf(
        Guard(28, Opcode.INVOKE_INTERFACE, listOf(4, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(29, Opcode.MOVE_RESULT, listOf(3)),
        Guard(30, Opcode.INVOKE_DIRECT, listOf(1, 3), "Lubk\$c;-><init>(Z)V"),
        Guard(31, Opcode.INVOKE_STATIC, listOf(1), "Ljji;->a(Ljava/lang/Object;)Liji;")
    ), listOf(
        Edit(30, "insert", "const/16 v3, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lubk\$c;-><init>(Z)V" to 1, "Ljji;->a(Ljava/lang/Object;)Liji;" to 3)),
    MethodPlan("Lubk;->d()V", 4, 11, listOf(
        Guard(3, Opcode.INVOKE_INTERFACE, listOf(1, 2), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(4, Opcode.MOVE_RESULT, listOf(1)),
        Guard(5, Opcode.INVOKE_DIRECT, listOf(0, 1), "Lubk\$c;-><init>(Z)V"),
        Guard(6, Opcode.IGET_OBJECT, listOf(3, 3), "Lubk;->x:Liji;")
    ), listOf(
        Edit(5, "insert", "const/16 v1, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lubk\$c;-><init>(Z)V" to 1, "Lubk;->x:Liji;" to 1)),
    MethodPlan("Lzmh;-><init>(Landroid/app/Application;Laqe;Licj;Llob;)V", 11, 109, listOf(
        Guard(36, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(37, Opcode.MOVE_RESULT, listOf(8)),
        Guard(38, Opcode.INVOKE_STATIC, listOf(8), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(39, Opcode.MOVE_RESULT_OBJECT, listOf(8))
    ), listOf(
        Edit(38, "insert", "const/16 v8, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 2)),
    MethodPlan("Ljt6;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 7, 84, listOf(
        Guard(20, Opcode.INVOKE_INTERFACE, listOf(6, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(21, Opcode.MOVE_RESULT, listOf(6)),
        Guard(22, Opcode.INVOKE_STATIC, listOf(6), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(23, Opcode.MOVE_RESULT_OBJECT, listOf(6))
    ), listOf(
        Edit(22, "insert", "const/16 v6, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 4)),
    MethodPlan("Lnl/flitsmeister/controllers/activities/settings/SettingsActivity;->onResume()V", 5, 26, listOf(
        Guard(8, Opcode.INVOKE_INTERFACE, listOf(2, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(9, Opcode.MOVE_RESULT, listOf(2)),
        Guard(10, Opcode.INVOKE_DIRECT, listOf(1, 2), "Lua0\$c;-><init>(Z)V"),
        Guard(11, Opcode.INVOKE_STATIC, listOf(1), "Ljji;->a(Ljava/lang/Object;)Liji;"),
        Guard(15, Opcode.INVOKE_INTERFACE, listOf(0, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(16, Opcode.MOVE_RESULT, listOf(0)),
        Guard(17, Opcode.INVOKE_DIRECT, listOf(2, 0), "Lua0\$c;-><init>(Z)V"),
        Guard(18, Opcode.CONST_4, listOf(0))
    ), listOf(
        Edit(10, "insert", "const/16 v2, 0x1"),
        Edit(17, "insert", "const/16 v0, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 2, "Lua0\$c;-><init>(Z)V" to 2, "Ljji;->a(Ljava/lang/Object;)Liji;" to 1)),
    MethodPlan("Lzwg;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 3, 23, listOf(
        Guard(14, Opcode.INVOKE_INTERFACE, listOf(2, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(15, Opcode.MOVE_RESULT, listOf(0)),
        Guard(16, Opcode.INVOKE_STATIC, listOf(0), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(17, Opcode.MOVE_RESULT_OBJECT, listOf(0))
    ), listOf(
        Edit(16, "insert", "const/16 v0, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Luu0;->a(Lun4;)Ljava/lang/Object;", 14, 118, listOf(
        Guard(55, Opcode.INVOKE_INTERFACE, listOf(5, 4), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(56, Opcode.MOVE_RESULT, listOf(1)),
        Guard(96, Opcode.INVOKE_INTERFACE, listOf(5, 4), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(97, Opcode.MOVE_RESULT, listOf(11)),
        Guard(98, Opcode.IF_NEZ, listOf(11), null, 106),
        Guard(99, Opcode.INVOKE_INTERFACE, listOf(2), "Lnl/flitsmeister/managers/ble/BlePairedDevicesManager;->getPairedDevices()Ljava/util/List;")
    ), listOf(
        Edit(98, "insert", "const/16 v11, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 2, "Lnl/flitsmeister/managers/ble/BlePairedDevicesManager;->getPairedDevices()Ljava/util/List;" to 3)),
    MethodPlan("Ldxg;-><init>(Landroid/app/Application;Laqe;Lfje;)V", 10, 40, listOf(
        Guard(8, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(9, Opcode.MOVE_RESULT, listOf(7)),
        Guard(10, Opcode.INVOKE_STATIC, listOf(7), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(11, Opcode.MOVE_RESULT_OBJECT, listOf(7))
    ), listOf(
        Edit(10, "insert", "const/16 v7, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Ljnb;-><init>(Landroid/app/Application;Laqe;Lgm8;)V", 10, 55, listOf(
        Guard(5, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(6, Opcode.MOVE_RESULT, listOf(8)),
        Guard(7, Opcode.INVOKE_STATIC, listOf(8), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(8, Opcode.MOVE_RESULT_OBJECT, listOf(8))
    ), listOf(
        Edit(7, "insert", "const/16 v8, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 4)),
    MethodPlan("Lua0;->b(Landroid/content/Context;Lnl/flitsmeister/models/enums/AppIcon;Lag4;)V", 8, 53, listOf(
        Guard(9, Opcode.INVOKE_INTERFACE, listOf(2, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(10, Opcode.MOVE_RESULT, listOf(3)),
        Guard(11, Opcode.INVOKE_DIRECT, listOf(0, 3), "Lua0\$c;-><init>(Z)V"),
        Guard(12, Opcode.INVOKE_STATIC, listOf(0), "Ljji;->a(Ljava/lang/Object;)Liji;"),
        Guard(25, Opcode.INVOKE_INTERFACE, listOf(2, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(26, Opcode.MOVE_RESULT, listOf(1)),
        Guard(27, Opcode.INVOKE_DIRECT, listOf(0, 1), "Lua0\$c;-><init>(Z)V"),
        Guard(28, Opcode.INVOKE_STATIC, listOf(0), "Ljji;->a(Ljava/lang/Object;)Liji;")
    ), listOf(
        Edit(11, "insert", "const/16 v3, 0x1"),
        Edit(27, "insert", "const/16 v1, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 2, "Lua0\$c;-><init>(Z)V" to 2, "Ljji;->a(Ljava/lang/Object;)Liji;" to 2)),
    MethodPlan("Lh2h;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 4, 34, listOf(
        Guard(22, Opcode.INVOKE_INTERFACE, listOf(1, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(23, Opcode.MOVE_RESULT, listOf(1)),
        Guard(24, Opcode.INVOKE_STATIC, listOf(1), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(25, Opcode.MOVE_RESULT_OBJECT, listOf(1))
    ), listOf(
        Edit(24, "insert", "const/16 v1, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lt37;-><init>(Landroid/app/Application;Laqe;)V", 10, 40, listOf(
        Guard(4, Opcode.INVOKE_INTERFACE, listOf(9, 8), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(5, Opcode.MOVE_RESULT, listOf(9)),
        Guard(6, Opcode.INVOKE_STATIC, listOf(9), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(7, Opcode.MOVE_RESULT_OBJECT, listOf(9))
    ), listOf(
        Edit(6, "insert", "const/16 v9, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lvuf;-><init>(Landroid/app/Application;Laqe;Lgm8;)V", 10, 45, listOf(
        Guard(4, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(5, Opcode.MOVE_RESULT, listOf(8)),
        Guard(6, Opcode.INVOKE_STATIC, listOf(8), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
        Guard(7, Opcode.MOVE_RESULT_OBJECT, listOf(8))
    ), listOf(
        Edit(6, "insert", "const/16 v8, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lus0;->b(Lun4;)Ljava/lang/Object;", 7, 66, listOf(
        Guard(32, Opcode.INVOKE_INTERFACE, listOf(6, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(33, Opcode.MOVE_RESULT, listOf(6)),
        Guard(34, Opcode.IF_EQZ, listOf(6), null, 62),
        Guard(35, Opcode.IPUT, listOf(3, 0), "Lrs0;->c:I")
    ), listOf(
        Edit(34, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lrs0;->c:I" to 5)),
    MethodPlan("Lus0;->c(Landroid/bluetooth/BluetoothDevice;Lun4;)Ljava/lang/Object;", 11, 83, listOf(
        Guard(41, Opcode.INVOKE_INTERFACE, listOf(10, 8), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(42, Opcode.MOVE_RESULT, listOf(8)),
        Guard(43, Opcode.IF_EQZ, listOf(8), null, 79),
        Guard(44, Opcode.IPUT_OBJECT, listOf(9, 2), "Lss0;->a:Landroid/bluetooth/BluetoothDevice;")
    ), listOf(
        Edit(43, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lss0;->a:Landroid/bluetooth/BluetoothDevice;" to 6)),
    MethodPlan("Llqk;->a(Lnl/flitsmeister/models/enums/SignalScreens;Z)Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;", 10, 204, listOf(
        Guard(100, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
        Guard(101, Opcode.GOTO_16, listOf(), null, 194),
        Guard(102, Opcode.INVOKE_INTERFACE, listOf(9, 5), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(103, Opcode.MOVE_RESULT, listOf(7)),
        Guard(104, Opcode.IF_EQZ, listOf(7), null, 108),
        Guard(105, Opcode.SGET_OBJECT, listOf(7), "Lsuh;->t1:Ltuh;"),
        Guard(115, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
        Guard(116, Opcode.GOTO_16, listOf(), null, 194),
        Guard(117, Opcode.INVOKE_INTERFACE, listOf(9, 5), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(118, Opcode.MOVE_RESULT, listOf(7)),
        Guard(119, Opcode.IF_EQZ, listOf(7), null, 123),
        Guard(120, Opcode.SGET_OBJECT, listOf(7), "Lt28;->U1:Ltuh;"),
        Guard(184, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
        Guard(185, Opcode.GOTO, listOf(), null, 194),
        Guard(186, Opcode.INVOKE_INTERFACE, listOf(9, 5), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(187, Opcode.MOVE_RESULT, listOf(7)),
        Guard(188, Opcode.IF_EQZ, listOf(7), null, 192),
        Guard(189, Opcode.SGET_OBJECT, listOf(7), "Lsuh;->j:Ltuh;")
    ), listOf(
        Edit(104, "replace", "nop"),
        Edit(119, "replace", "nop"),
        Edit(188, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 3, "Lsuh;->t1:Ltuh;" to 1, "Lt28;->U1:Ltuh;" to 1, "Lsuh;->j:Ltuh;" to 1)),
    MethodPlan("Luqk;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 23, 789, listOf(
        Guard(535, Opcode.AGET, listOf(13, 11, 13)),
        Guard(536, Opcode.IF_NE, listOf(13, 5), null, 551),
        Guard(538, Opcode.INVOKE_INTERFACE, listOf(13, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(539, Opcode.MOVE_RESULT, listOf(13)),
        Guard(540, Opcode.IF_EQZ, listOf(13), null, 547),
        Guard(541, Opcode.SGET_OBJECT, listOf(13), "Lxc0;->m:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;"),
        Guard(744, Opcode.AGET, listOf(5, 11, 5)),
        Guard(745, Opcode.IF_NE, listOf(5, 10), null, 758),
        Guard(747, Opcode.INVOKE_INTERFACE, listOf(5, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(748, Opcode.MOVE_RESULT, listOf(5)),
        Guard(749, Opcode.IF_EQZ, listOf(5), null, 754),
        Guard(750, Opcode.SGET_OBJECT, listOf(5), "Lt28;->I0:Ltuh;")
    ), listOf(
        Edit(540, "replace", "nop"),
        Edit(749, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 2, "Lxc0;->m:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1, "Lt28;->I0:Ltuh;" to 1)),
    MethodPlan("Lwgh;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 13, 72, listOf(
        Guard(19, Opcode.IGET_OBJECT, listOf(12, 4), "Lvgh;->b:Laqe;"),
        Guard(20, Opcode.IGET_OBJECT, listOf(0, 11), "Lwgh;->d:Landroid/content/Context;"),
        Guard(21, Opcode.INVOKE_INTERFACE, listOf(12, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(22, Opcode.MOVE_RESULT, listOf(12)),
        Guard(23, Opcode.IF_NEZ, listOf(12), null, 68),
        Guard(24, Opcode.IGET_OBJECT, listOf(12, 4), "Lvgh;->d:Lfje;")
    ), listOf(
        Edit(23, "goto", "", 68)
    ), mapOf("Lvgh;->b:Laqe;" to 1, "Lwgh;->d:Landroid/content/Context;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Lvgh;->d:Lfje;" to 2)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/k;->q(Lnl/flitsmeister/fmx/activities/main/k;Ljava/lang/String;)V", 6, 40, listOf(
        Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(3, Opcode.MOVE_RESULT, listOf(0)),
        Guard(4, Opcode.CONST_4, listOf(2)),
        Guard(5, Opcode.IF_EQZ, listOf(0), null, 13),
        Guard(6, Opcode.SGET_OBJECT, listOf(0), "Lrc6;->a:Lrc6;")
    ), listOf(
        Edit(5, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lrc6;->a:Lrc6;" to 1)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/k;->H(Lun4;)Ljava/lang/Object;", 19, 117, listOf(
        Guard(48, Opcode.INVOKE_INTERFACE, listOf(1, 3), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(49, Opcode.MOVE_RESULT, listOf(1)),
        Guard(50, Opcode.IF_EQZ, listOf(1), null, 114),
        Guard(51, Opcode.SGET_OBJECT, listOf(1), "Lrc6;->a:Lrc6;")
    ), listOf(
        Edit(50, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lrc6;->a:Lrc6;" to 1)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/k;->d(Lun4;)Ljava/io/Serializable;", 21, 222, listOf(
        Guard(95, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
        Guard(96, Opcode.IGET_OBJECT, listOf(3, 0), "Lnl/flitsmeister/fmx/activities/main/k;->s:Laqe;"),
        Guard(97, Opcode.INVOKE_INTERFACE, listOf(3, 5), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(98, Opcode.MOVE_RESULT, listOf(3)),
        Guard(99, Opcode.IF_EQZ, listOf(3), null, 104),
        Guard(100, Opcode.IF_EQZ, listOf(2), null, 104)
    ), listOf(
        Edit(99, "replace", "nop")
    ), mapOf("Lnl/flitsmeister/fmx/activities/main/k;->s:Laqe;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lnl/flitsmeister/models/enums/NightModeTypes\$Companion;->getCurrentNightmodeType(Landroid/content/Context;)Lnl/flitsmeister/models/enums/NightModeTypes;", 3, 25, listOf(
        Guard(9, Opcode.MOVE_RESULT, listOf(0)),
        Guard(10, Opcode.IF_NEZ, listOf(0), null, 23),
        Guard(11, Opcode.INVOKE_INTERFACE, listOf(1, 2), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(12, Opcode.MOVE_RESULT, listOf(1)),
        Guard(13, Opcode.IF_NEZ, listOf(1), null, 15),
        Guard(14, Opcode.GOTO, listOf(), null, 23)
    ), listOf(
        Edit(13, "goto", "", 15)
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lso5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", 10, 35, listOf(
        Guard(15, Opcode.IGET_OBJECT, listOf(0, 9), "Lup5;->b:Laqe;"),
        Guard(16, Opcode.IGET_OBJECT, listOf(9, 9), "Lup5;->a:Landroid/app/Application;"),
        Guard(17, Opcode.INVOKE_INTERFACE, listOf(0, 9), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(18, Opcode.MOVE_RESULT, listOf(9)),
        Guard(19, Opcode.IF_EQZ, listOf(9), null, 29),
        Guard(20, Opcode.NEW_INSTANCE, listOf(2), "Lmo5;")
    ), listOf(
        Edit(19, "replace", "nop")
    ), mapOf("Lup5;->b:Laqe;" to 1, "Lup5;->a:Landroid/app/Application;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Lmo5;" to 1)),
    MethodPlan("Ldv0;->a(Lun4;)Ljava/io/Serializable;", 9, 106, listOf(
        Guard(42, Opcode.IGET_OBJECT, listOf(1, 7), "Ldv0;->x:Laqe;"),
        Guard(43, Opcode.IGET_OBJECT, listOf(6, 7), "Ldv0;->a:Landroid/content/Context;"),
        Guard(44, Opcode.INVOKE_INTERFACE, listOf(1, 6), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(45, Opcode.MOVE_RESULT, listOf(1)),
        Guard(46, Opcode.IF_EQZ, listOf(1), null, 84),
        Guard(47, Opcode.IPUT_OBJECT, listOf(8, 0), "Lev0;->a:Ljava/util/List;")
    ), listOf(
        Edit(46, "replace", "nop")
    ), mapOf("Ldv0;->x:Laqe;" to 1, "Ldv0;->a:Landroid/content/Context;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Lev0;->a:Ljava/util/List;" to 6)),
    MethodPlan("Ldw0;->c(Lun4;)Ljava/lang/Object;", 7, 66, listOf(
        Guard(32, Opcode.INVOKE_INTERFACE, listOf(6, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(33, Opcode.MOVE_RESULT, listOf(6)),
        Guard(34, Opcode.IF_EQZ, listOf(6), null, 62),
        Guard(35, Opcode.IPUT, listOf(3, 0), "Lzv0;->c:I")
    ), listOf(
        Edit(34, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lzv0;->c:I" to 5)),
    MethodPlan("Ldw0;->f(Lun4;)Ljava/lang/Object;", 7, 69, listOf(
        Guard(32, Opcode.INVOKE_INTERFACE, listOf(6, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(33, Opcode.MOVE_RESULT, listOf(6)),
        Guard(34, Opcode.IF_EQZ, listOf(6), null, 65),
        Guard(35, Opcode.IPUT, listOf(3, 0), "Lcw0;->c:I")
    ), listOf(
        Edit(34, "replace", "nop")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lcw0;->c:I" to 5)),
    MethodPlan("Lgj4;->a(Ljava/lang/String;Lun4;)Ljava/lang/Object;", 14, 148, listOf(
        Guard(39, Opcode.IGET_OBJECT, listOf(13, 11), "Lgj4;->d:Laqe;"),
        Guard(40, Opcode.IGET_OBJECT, listOf(1, 11), "Lgj4;->a:Landroid/content/Context;"),
        Guard(41, Opcode.INVOKE_INTERFACE, listOf(13, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(42, Opcode.MOVE_RESULT, listOf(13)),
        Guard(43, Opcode.IF_NEZ, listOf(13), null, 50),
        Guard(44, Opcode.NEW_INSTANCE, listOf(11), "Lnl/flitsmeister/fmcore/utils/exception/GenericException;")
    ), listOf(
        Edit(43, "goto", "", 50)
    ), mapOf("Lgj4;->d:Laqe;" to 1, "Lgj4;->a:Landroid/content/Context;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Lnl/flitsmeister/fmcore/utils/exception/GenericException;" to 2)),
    MethodPlan("Lnjd;->a(Landroid/content/Context;)V", 3, 30, listOf(
        Guard(13, Opcode.SGET_BOOLEAN, listOf(1), "Lnl/flitsmeister/FlitsmeisterApplication;->y:Z"),
        Guard(14, Opcode.IF_EQZ, listOf(1), null, 29),
        Guard(15, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(16, Opcode.MOVE_RESULT, listOf(0)),
        Guard(17, Opcode.IF_EQZ, listOf(0), null, 29),
        Guard(18, Opcode.SGET_OBJECT, listOf(0), "Lnjd;->c:Lyhi;")
    ), listOf(
        Edit(17, "replace", "nop")
    ), mapOf("Lnl/flitsmeister/FlitsmeisterApplication;->y:Z" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Lnjd;->c:Lyhi;" to 2)),
    MethodPlan("Lvgh;->a(Lvgh;)Ljava/lang/String;", 4, 40, listOf(
        Guard(5, Opcode.INVOKE_INTERFACE, listOf(2, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(6, Opcode.MOVE_RESULT, listOf(2)),
        Guard(7, Opcode.IF_NEZ, listOf(2), null, 10),
        Guard(8, Opcode.CONST_STRING, listOf(3))
    ), listOf(
        Edit(7, "goto", "", 10)
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lvgh;->b(Lvgh;)Ljava/lang/String;", 3, 22, listOf(
        Guard(2, Opcode.INVOKE_INTERFACE, listOf(1, 0), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(3, Opcode.MOVE_RESULT, listOf(1)),
        Guard(4, Opcode.IF_NEZ, listOf(1), null, 7),
        Guard(5, Opcode.CONST_STRING, listOf(2))
    ), listOf(
        Edit(4, "goto", "", 7)
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lnsj;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;", 4, 47, listOf(
        Guard(7, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Laqe;->c(Landroid/content/Context;)Z"),
        Guard(8, Opcode.MOVE_RESULT, listOf(1)),
        Guard(9, Opcode.IF_EQZ, listOf(1), null, 13),
        Guard(10, Opcode.INVOKE_STATIC, listOf(2), "Lnxj;->c(Landroid/content/Context;)Z"),
        Guard(24, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Laqe;->c(Landroid/content/Context;)Z"),
        Guard(25, Opcode.MOVE_RESULT, listOf(3)),
        Guard(26, Opcode.IF_EQZ, listOf(3), null, 35),
        Guard(27, Opcode.INVOKE_STATIC, listOf(2), "Lnxj;->c(Landroid/content/Context;)Z")
    ), listOf(
        Edit(9, "insert", "const/16 v1, 0x1"),
        Edit(26, "insert", "const/16 v3, 0x1")
    ), mapOf("Laqe;->c(Landroid/content/Context;)Z" to 2, "Lnxj;->c(Landroid/content/Context;)Z" to 2)),
    MethodPlan("Li0c;->invoke()Ljava/lang/Object;", 6, 28, listOf(
        Guard(2, Opcode.MOVE_RESULT_OBJECT, listOf(1)),
        Guard(3, Opcode.CHECK_CAST, listOf(1), "Ljld;"),
        Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljld;->b()Z"),
        Guard(5, Opcode.MOVE_RESULT, listOf(1)),
        Guard(7, Opcode.IF_NEZ, listOf(1), null, 24),
        Guard(8, Opcode.INVOKE_INTERFACE, listOf(0), "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;")
    ), listOf(
        Edit(7, "goto", "", 24)
    ), mapOf("Ljld;" to 2, "Ljld;->b()Z" to 1, "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;" to 2)),
    MethodPlan("Lj0c;->invoke()Ljava/lang/Object;", 7, 31, listOf(
        Guard(3, Opcode.CHECK_CAST, listOf(1), "Ljld;"),
        Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljld;->b()Z"),
        Guard(5, Opcode.MOVE_RESULT, listOf(1)),
        Guard(6, Opcode.IGET_OBJECT, listOf(2, 6), "Lj0c;->a:Lu39;"),
        Guard(7, Opcode.IF_NEZ, listOf(1), null, 24),
        Guard(8, Opcode.INVOKE_INTERFACE, listOf(0), "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;")
    ), listOf(
        Edit(7, "goto", "", 24)
    ), mapOf("Ljld;" to 2, "Ljld;->b()Z" to 1, "Lj0c;->a:Lu39;" to 1, "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;" to 2)),
    MethodPlan("Lk1c;->invoke()Ljava/lang/Object;", 7, 41, listOf(
        Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(5, Opcode.SGET_OBJECT, listOf(2), "Ljld;->b:Ljld;"),
        Guard(6, Opcode.IGET_OBJECT, listOf(3, 6), "Lk1c;->a:Lu39;"),
        Guard(7, Opcode.CONST_STRING, listOf(4)),
        Guard(8, Opcode.IF_NE, listOf(1, 2), null, 10),
        Guard(9, Opcode.GOTO, listOf(), null, 35)
    ), listOf(
        Edit(8, "goto", "", 35)
    ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 1, "Ljld;->b:Ljld;" to 1, "Lk1c;->a:Lu39;" to 1))
)
