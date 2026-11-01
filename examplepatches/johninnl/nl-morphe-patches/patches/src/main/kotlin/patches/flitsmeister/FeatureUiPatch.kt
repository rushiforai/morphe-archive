package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/** Exact 14.17 local eligibility operations; genuine providers remain called. */
internal val featureUi = bytecodePatch {
    dependsOn(originalInput, featureEligibility)
    execute { applyPlans(listOf(
    MethodPlan("Lahh;->a(Landroidx/compose/ui/Modifier;Lb49;Lb49;Lb49;Lb49;Lz39;Lm8i\$d;ZLandroidx/compose/runtime/Composer;II)V", 50, 474, listOf(
            Guard(144, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(145, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(146, Opcode.MOVE_RESULT, listOf(14))
        ), listOf(
            Edit(145, "insert", "const/16 v11, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 3)),
    MethodPlan("Lakh;->a(Landroidx/compose/ui/Modifier;Lp49;Lr49;Lp49;Lz39;La3h;Ldkk\$a;Ldkk\$j;ZLandroidx/compose/runtime/Composer;I)V", 35, 342, listOf(
            Guard(141, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(142, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(143, Opcode.MOVE_RESULT, listOf(14))
        ), listOf(
            Edit(142, "insert", "const/16 v16, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lbjh;->a(Landroidx/compose/ui/Modifier;Lp49;Lp49;Lr49;Lb49;Lz39;La3h;Ldkk\$a;ZLandroidx/compose/runtime/Composer;I)V", 32, 240, listOf(
            Guard(127, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(128, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(129, Opcode.MOVE_RESULT, listOf(10))
        ), listOf(
            Edit(128, "insert", "const/16 v14, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Ld0h;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 16, 112, listOf(
            Guard(49, Opcode.INVOKE_VIRTUAL, listOf(13), "Ljava/lang/Boolean;->booleanValue()Z"),
            Guard(50, Opcode.MOVE_RESULT, listOf(7)),
            Guard(51, Opcode.INVOKE_INTERFACE, listOf(9, 2), "Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z"),
            Guard(52, Opcode.MOVE_RESULT, listOf(13))
        ), listOf(
            Edit(51, "insert", "const/16 v7, 0x1")
        ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1, "Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z" to 4)),
    MethodPlan("Ldxa;->b(Landroidx/compose/ui/Modifier;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ZZZLl79;ZLz39;Landroidx/compose/runtime/Composer;II)V", 54, 849, listOf(
            Guard(218, Opcode.MOVE_RESULT, listOf(0)),
            Guard(219, Opcode.IF_NEZ, listOf(10), null, 246),
            Guard(220, Opcode.CONST, listOf(14))
        ), listOf(
            Edit(219, "at_join", "const/16 v0, 0x1\nif-nez v10, :morphe_join", 246)
        ), mapOf()),
    MethodPlan("Lebh;->a(Landroidx/compose/ui/Modifier;Lhch\$a;Lhch;Lz39;Lb49;Landroidx/compose/runtime/Composer;I)V", 50, 386, listOf(
            Guard(79, Opcode.INVOKE_STATIC, listOf(0, 8, 15, 13), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
            Guard(80, Opcode.INVOKE_STATIC, listOf(1), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(81, Opcode.MOVE_RESULT_OBJECT, listOf(0))
        ), listOf(
            Edit(80, "replace", "invoke-static {v1}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 3, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lebh;->b(Landroidx/compose/ui/Modifier;Lhch;Lhch\$a;Lb49;Lb49;Lz39;Lb49;Landroidx/compose/runtime/Composer;I)V", 34, 287, listOf(
            Guard(202, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Boolean;->booleanValue()Z"),
            Guard(203, Opcode.MOVE_RESULT, listOf(18)),
            Guard(204, Opcode.CONST, listOf(1)),
            Guard(205, Opcode.INVOKE_STATIC, listOf(1, 13, 6), "Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;")
        ), listOf(
            Edit(204, "insert", "const/16 v18, 0x1")
        ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1, "Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;" to 1)),
    MethodPlan("Levg;->a(Landroidx/compose/ui/Modifier;Lgz0;Lb49;Lcu0;Lz39;Lb49;Lb49;Lz39;Lz39;Landroidx/compose/runtime/Composer;I)V", 48, 449, listOf(
            Guard(150, Opcode.INVOKE_STATIC, listOf(8, 11, 15, 0), "Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lp49;Landroidx/compose/runtime/Composer;I)V"),
            Guard(151, Opcode.INVOKE_STATIC, listOf(15), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(152, Opcode.MOVE_RESULT_OBJECT, listOf(0))
        ), listOf(
            Edit(151, "replace", "invoke-static {v15}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lp49;Landroidx/compose/runtime/Composer;I)V" to 1, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lfkh;->a(Landroidx/compose/ui/Modifier;Lp49;Lr49;Lb49;Lz39;Lb49;Ldkk\$a;Ldkk\$j;ZLandroidx/compose/runtime/Composer;II)V", 32, 270, listOf(
            Guard(156, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(157, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(158, Opcode.MOVE_RESULT, listOf(14))
        ), listOf(
            Edit(157, "insert", "const/16 v10, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lfmh;->a(Landroidx/compose/ui/Modifier;Lp49;Lr49;Lb49;Lz39;La3h;Ldkk\$a;Ldkk\$j;ZLandroidx/compose/runtime/Composer;I)V", 32, 284, listOf(
            Guard(142, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(143, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(144, Opcode.MOVE_RESULT, listOf(10))
        ), listOf(
            Edit(143, "insert", "const/16 v16, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lghh;->a(Landroidx/compose/ui/Modifier;Lb49;Lb49;Lz39;Lz39;Lm8i\$d;Landroidx/compose/runtime/Composer;I)V", 26, 188, listOf(
            Guard(99, Opcode.INVOKE_INTERFACE, listOf(2, 1), "Lb49;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"),
            Guard(100, Opcode.INVOKE_STATIC, listOf(13), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(101, Opcode.MOVE_RESULT_OBJECT, listOf(1))
        ), listOf(
            Edit(100, "replace", "invoke-static {v13}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Lb49;->invoke(Ljava/lang/Object;)Ljava/lang/Object;" to 1, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lglh;->c(Landroidx/compose/ui/Modifier;Lp49;Lr49;Lp49;Lz39;Lz39;Lb49;Ldkk\$c;Ldkk\$j;ZLandroidx/compose/runtime/Composer;II)V", 35, 274, listOf(
            Guard(157, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(158, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(159, Opcode.MOVE_RESULT, listOf(11))
        ), listOf(
            Edit(158, "insert", "const/16 v4, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lijh;->a(Landroidx/compose/ui/Modifier;Lp49;Lr49;Lb49;Lz39;Lb49;Lb49;ZLdkk\$a;Landroidx/compose/runtime/Composer;II)V", 37, 333, listOf(
            Guard(155, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(156, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(157, Opcode.MOVE_RESULT, listOf(11))
        ), listOf(
            Edit(156, "insert", "const/16 v17, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lioh;->a(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/fmcore/data/model/reports/Incident;ZLp49;Lp49;Lb49;Lz39;Lb49;Ldkk\$k;Ldkk\$j;ZLandroidx/compose/runtime/Composer;III)V", 35, 342, listOf(
            Guard(190, Opcode.INVOKE_INTERFACE, listOf(5), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(191, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(192, Opcode.MOVE_RESULT, listOf(14))
        ), listOf(
            Edit(191, "insert", "const/16 v2, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Ljsg;->a(Landroidx/compose/ui/Modifier;Lksg;Lb49;Lz39;Landroidx/compose/runtime/Composer;I)V", 26, 186, listOf(
            Guard(84, Opcode.INVOKE_STATIC, listOf(0, 1, 2, 7), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
            Guard(85, Opcode.INVOKE_STATIC, listOf(11), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(86, Opcode.MOVE_RESULT_OBJECT, listOf(16))
        ), listOf(
            Edit(85, "replace", "invoke-static {v11}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 1, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Llkh;->a(ILz39;Lp49;La3h;Ldkk;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)V", 25, 183, listOf(
            Guard(120, Opcode.INVOKE_VIRTUAL, listOf(7), "Ljava/lang/Boolean;->booleanValue()Z"),
            Guard(121, Opcode.MOVE_RESULT, listOf(16)),
            Guard(122, Opcode.CONST, listOf(7)),
            Guard(123, Opcode.CONST_4, listOf(14))
        ), listOf(
            Edit(122, "insert", "const/16 v16, 0x1")
        ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1)),
    MethodPlan("Lllh;->a(Landroidx/compose/ui/Modifier;Lp49;Lp49;Lr49;Lb49;Lz39;La3h;Ldkk\$a;ZLandroidx/compose/runtime/Composer;I)V", 32, 240, listOf(
            Guard(127, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(128, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(129, Opcode.MOVE_RESULT, listOf(10))
        ), listOf(
            Edit(128, "insert", "const/16 v14, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lmmh;->a(Landroidx/compose/ui/Modifier;Lp49;Lp49;Lp49;Lr49;Lp49;Lz39;Lb49;Lb49;Ldkk\$e;ZLandroidx/compose/runtime/Composer;III)V", 38, 297, listOf(
            Guard(175, Opcode.INVOKE_INTERFACE, listOf(3), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(176, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(177, Opcode.MOVE_RESULT, listOf(14))
        ), listOf(
            Edit(176, "insert", "const/16 v13, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Loa0;->b(Landroidx/compose/ui/Modifier;Landroidx/compose/material/ModalBottomSheetState;Lsa0;Lsf4;Lz39;Lz39;Landroidx/compose/runtime/Composer;I)V", 40, 329, listOf(
            Guard(107, Opcode.INVOKE_STATIC, listOf(1, 15, 6, 5), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
            Guard(108, Opcode.INVOKE_STATIC, listOf(13), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(109, Opcode.MOVE_RESULT_OBJECT, listOf(1))
        ), listOf(
            Edit(108, "replace", "invoke-static {v13}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 3, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lovg;->b(Landroidx/compose/ui/Modifier;Lb49;Lb49;Lz39;Lmu0;ZLz39;Landroidx/compose/runtime/Composer;II)V", 33, 230, listOf(
            Guard(132, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(133, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(134, Opcode.MOVE_RESULT, listOf(4))
        ), listOf(
            Edit(133, "insert", "const/16 v16, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lpih;->a(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/fmcore/data/model/reports/Incident;Lnl/flitsmeister/models/enums/SignalScreens;ZZLz39;Lb49;Lp49;Lb49;Landroidx/compose/runtime/Composer;I)V", 37, 241, listOf(
            Guard(134, Opcode.INVOKE_INTERFACE, listOf(13), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(135, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(136, Opcode.MOVE_RESULT, listOf(9))
        ), listOf(
            Edit(135, "insert", "const/16 v3, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lpkh;->a(Landroidx/compose/ui/Modifier;Lb49;Lr49;Lz39;Ldkk\$b;ZZLb49;Landroidx/compose/runtime/Composer;II)V", 30, 246, listOf(
            Guard(136, Opcode.INVOKE_INTERFACE, listOf(14), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(137, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(138, Opcode.MOVE_RESULT, listOf(7))
        ), listOf(
            Edit(137, "insert", "const/16 v10, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lpyg;->a(Landroidx/compose/ui/Modifier;Lls8;ZLz39;Lb49;Landroidx/compose/runtime/Composer;I)V", 28, 213, listOf(
            Guard(94, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(95, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(96, Opcode.MOVE_RESULT, listOf(2))
        ), listOf(
            Edit(95, "insert", "const/16 v13, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqch;->a(Landroidx/compose/ui/Modifier;Lnuc;Lb49;Lz39;ZLandroidx/compose/runtime/Composer;I)V", 27, 217, listOf(
            Guard(96, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(97, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(98, Opcode.MOVE_RESULT, listOf(2))
        ), listOf(
            Edit(97, "insert", "const/16 v13, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqkh;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 24, 85, listOf(
            Guard(38, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Boolean;->booleanValue()Z"),
            Guard(39, Opcode.MOVE_RESULT, listOf(8)),
            Guard(40, Opcode.INVOKE_INTERFACE, listOf(12), "Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;"),
            Guard(41, Opcode.MOVE_RESULT_OBJECT, listOf(1))
        ), listOf(
            Edit(40, "insert", "const/16 v8, 0x1")
        ), mapOf("Ljava/lang/Boolean;->booleanValue()Z" to 1, "Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;" to 1)),
    MethodPlan("Lqlh;->a(Landroidx/compose/ui/Modifier;Lp49;Lp49;Lr49;Lb49;Lz39;La3h;Ldkk\$a;ZLandroidx/compose/runtime/Composer;I)V", 32, 240, listOf(
            Guard(127, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(128, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(129, Opcode.MOVE_RESULT, listOf(10))
        ), listOf(
            Edit(128, "insert", "const/16 v14, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqnh;->a(IILz39;Lp49;Lp49;Lp49;Lp49;La3h;Ldkk\$g;Ldkk\$j;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;Z)V", 36, 286, listOf(
            Guard(142, Opcode.INVOKE_INTERFACE, listOf(5), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(143, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(144, Opcode.MOVE_RESULT, listOf(4))
        ), listOf(
            Edit(143, "insert", "const/16 v12, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lqxg;->a(Landroidx/compose/ui/Modifier;Lsxg;Lb49;Lz39;ZLandroidx/compose/runtime/Composer;I)V", 27, 209, listOf(
            Guard(99, Opcode.INVOKE_INTERFACE, listOf(10), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(100, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(101, Opcode.MOVE_RESULT, listOf(7))
        ), listOf(
            Edit(100, "insert", "const/16 v13, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lrug;->a(Landroidx/compose/ui/Modifier;Lgz0;Lb49;Lss0;Lz39;Lz39;Lb49;Lb49;Lb49;Lb49;Landroidx/compose/runtime/Composer;I)V", 51, 523, listOf(
            Guard(168, Opcode.INVOKE_STATIC, listOf(14, 1, 5, 0), "Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lp49;Landroidx/compose/runtime/Composer;I)V"),
            Guard(169, Opcode.INVOKE_STATIC, listOf(5), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(170, Opcode.MOVE_RESULT_OBJECT, listOf(0))
        ), listOf(
            Edit(169, "replace", "invoke-static {v5}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lp49;Landroidx/compose/runtime/Composer;I)V" to 1, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lrzg;->a(Landroidx/compose/ui/Modifier;Lrlb;Lb49;Lz39;Landroidx/compose/runtime/Composer;I)V", 25, 203, listOf(
            Guard(90, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
            Guard(91, Opcode.INVOKE_STATIC, listOf(11), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(92, Opcode.MOVE_RESULT_OBJECT, listOf(7))
        ), listOf(
            Edit(91, "replace", "invoke-static {v11}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lt5k;->c(Landroidx/compose/ui/Modifier;Lz39;Landroidx/compose/material/ModalBottomSheetState;Lc6k;Lz39;Ly5k;Landroidx/compose/runtime/Composer;I)V", 39, 337, listOf(
            Guard(106, Opcode.INVOKE_STATIC, listOf(1, 2, 8, 6), "Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V"),
            Guard(107, Opcode.INVOKE_STATIC, listOf(14), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(108, Opcode.MOVE_RESULT_OBJECT, listOf(1))
        ), listOf(
            Edit(107, "replace", "invoke-static {v14}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V" to 3, "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Ltih;->a(Landroidx/compose/ui/Modifier;ZZLz39;Lp49;Lb49;La3h;Landroidx/compose/runtime/Composer;I)V", 31, 213, listOf(
            Guard(99, Opcode.INVOKE_INTERFACE, listOf(1), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(100, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(101, Opcode.MOVE_RESULT, listOf(5))
        ), listOf(
            Edit(100, "insert", "const/16 v12, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Ltjh;->a(Landroidx/compose/ui/Modifier;Lp49;Lr49;Lb49;Lz39;Lb49;La3h;ZLdkk\$a;Landroidx/compose/runtime/Composer;I)V", 35, 298, listOf(
            Guard(125, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(126, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(127, Opcode.MOVE_RESULT, listOf(8))
        ), listOf(
            Edit(126, "insert", "const/16 v14, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lvch;->a(Landroidx/compose/ui/Modifier;Ljhd;Lsf4;Lb49;Lz39;Landroidx/compose/runtime/Composer;I)V", 31, 237, listOf(
            Guard(136, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
            Guard(137, Opcode.INVOKE_STATIC, listOf(15), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(138, Opcode.MOVE_RESULT_OBJECT, listOf(7))
        ), listOf(
            Edit(137, "replace", "invoke-static {v15}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Lvxg;->a(Landroidx/compose/ui/Modifier;Lsa0;Lv37;Lb49;Lb49;Lz39;ZLandroidx/compose/runtime/Composer;I)V", 48, 401, listOf(
            Guard(123, Opcode.INVOKE_INTERFACE, listOf(14), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(124, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(125, Opcode.MOVE_RESULT, listOf(11))
        ), listOf(
            Edit(124, "insert", "const/16 v9, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lwnh;->b(Landroidx/compose/ui/Modifier;Lb49;Lb49;Lz39;Lb49;Ldkk\$h;ZLandroidx/compose/runtime/Composer;II)V", 30, 230, listOf(
            Guard(122, Opcode.INVOKE_INTERFACE, listOf(2), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(123, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(124, Opcode.MOVE_RESULT, listOf(9))
        ), listOf(
            Edit(123, "insert", "const/16 v4, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lzlh;->a(IILz39;Lp49;Lp49;Lp49;Lp49;La3h;Ldkk\$g;Ldkk\$j;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;Z)V", 36, 282, listOf(
            Guard(142, Opcode.INVOKE_INTERFACE, listOf(5), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(143, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(144, Opcode.MOVE_RESULT, listOf(4))
        ), listOf(
            Edit(143, "insert", "const/16 v12, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lzmh;->a(Landroidx/compose/ui/Modifier;Lb49;Lb49;Lb49;Lb49;Lb49;Lb49;Lz39;Landroidx/compose/foundation/ScrollState;Lp49;Ldkk\$f;ZLandroidx/compose/runtime/Composer;II)V", 37, 332, listOf(
            Guard(178, Opcode.INVOKE_INTERFACE, listOf(7), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(179, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(180, Opcode.MOVE_RESULT, listOf(6))
        ), listOf(
            Edit(179, "insert", "const/16 v0, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lznh;->a(Landroidx/compose/ui/Modifier;Lb49;Lz39;La3h;Ldkk\$i;ZLandroidx/compose/runtime/Composer;I)V", 26, 158, listOf(
            Guard(96, Opcode.INVOKE_INTERFACE, listOf(15), "Landroidx/compose/runtime/Composer;->endDefaults()V"),
            Guard(97, Opcode.INVOKE_STATIC, listOf(), "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z"),
            Guard(98, Opcode.MOVE_RESULT, listOf(5))
        ), listOf(
            Edit(97, "insert", "const/16 v11, 0x1")
        ), mapOf("Landroidx/compose/runtime/Composer;->endDefaults()V" to 1, "Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z" to 2)),
    MethodPlan("Lidf;->a(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Ljava/lang/String;ILjava/lang/Float;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Integer;Landroidx/compose/ui/graphics/Color;Ljava/lang/String;ZZZLb49;Landroidx/compose/runtime/Composer;III)V", 72, 1400, listOf(
            Guard(323, Opcode.MOVE_RESULT_OBJECT, listOf(3)),
            Guard(324, Opcode.INVOKE_STATIC, listOf(15), "Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;"),
            Guard(325, Opcode.MOVE_RESULT_OBJECT, listOf(10))
        ), listOf(
            Edit(324, "replace", "invoke-static {v15}, Lmorphe/flitsmeister/FeatureEligibility;->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;")
        ), mapOf("Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;" to 1)),
    MethodPlan("Ldgj\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 24, 236, listOf(
            Guard(4, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(5, Opcode.MOVE_RESULT, listOf(2)),
            Guard(6, Opcode.IF_EQZ, listOf(2), null, 12),
            Guard(7, Opcode.SGET_OBJECT, listOf(2), "Lkph;->z:Llph;")
        ), listOf(
            Edit(6, "insert", "const/16 v2, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lkph;->z:Llph;" to 1)),
    MethodPlan("Lgjb;->w()V", 7, 82, listOf(
            Guard(19, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(20, Opcode.MOVE_RESULT, listOf(1)),
            Guard(21, Opcode.IF_NEZ, listOf(1), null, 24),
            Guard(22, Opcode.SGET_OBJECT, listOf(1), "Lafb\$a;->a:Lafb\$a;")
        ), listOf(
            Edit(21, "insert", "const/16 v1, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lafb\$a;->a:Lafb\$a;" to 2)),
    MethodPlan("Lgjb;->x()V", 5, 44, listOf(
            Guard(4, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(5, Opcode.MOVE_RESULT, listOf(0)),
            Guard(6, Opcode.IGET_OBJECT, listOf(1, 4), "Lgjb;->N1:Lsib;"),
            Guard(7, Opcode.IGET_OBJECT, listOf(2, 1), "Lsib;->m:Ljava/util/List;")
        ), listOf(
            Edit(6, "insert", "const/16 v0, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lgjb;->N1:Lsib;" to 1, "Lsib;->m:Ljava/util/List;" to 1)),
    MethodPlan("Lpde;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 25, 206, listOf(
            Guard(2, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 204),
            Guard(5, Opcode.INVOKE_STATIC, listOf(), "Lt25;->g()Lpge;")
        ), listOf(
            Edit(4, "insert", "const/16 v0, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lt25;->g()Lpge;" to 2)),
    MethodPlan("Lakb;->onMove(Lorg/maplibre/android/gestures/MoveGestureDetector;)V", 8, 34, listOf(
            Guard(3, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(4, Opcode.MOVE_RESULT, listOf(0)),
            Guard(5, Opcode.IF_EQZ, listOf(0), null, 33),
            Guard(6, Opcode.SGET_OBJECT, listOf(0), "Lkph;->u0:Llph;")
        ), listOf(
            Edit(5, "insert", "const/16 v0, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lkph;->u0:Llph;" to 1)),
    MethodPlan("Lf18;->a(Landroid/content/Context;)Ljava/util/ArrayList;", 13, 85, listOf(
            Guard(1, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(2, Opcode.MOVE_RESULT, listOf(0)),
            Guard(3, Opcode.CONST_4, listOf(1)),
            Guard(4, Opcode.CONST_4, listOf(2))
        ), listOf(
            Edit(3, "insert", "const/16 v0, 0x1")
        ), mapOf("Lt25;->j()Z" to 1)),
    MethodPlan("Lhz0\$a\$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 10, 137, listOf(
            Guard(13, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(14, Opcode.MOVE_RESULT, listOf(3)),
            Guard(15, Opcode.IF_NEZ, listOf(3), null, 17),
            Guard(16, Opcode.GOTO_16, listOf(), null, 130)
        ), listOf(
            Edit(15, "insert", "const/16 v3, 0x1")
        ), mapOf("Lt25;->j()Z" to 1)),
    MethodPlan("Liz0\$b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 4, 32, listOf(
            Guard(7, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(8, Opcode.MOVE_RESULT, listOf(0)),
            Guard(9, Opcode.IF_EQZ, listOf(0), null, 18),
            Guard(10, Opcode.SGET_OBJECT, listOf(0), "Lkph;->A:Llph;")
        ), listOf(
            Edit(9, "insert", "const/16 v0, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lkph;->A:Llph;" to 1)),
    MethodPlan("Lkde;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 13, 96, listOf(
            Guard(23, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(24, Opcode.MOVE_RESULT, listOf(12)),
            Guard(25, Opcode.IF_EQZ, listOf(12), null, 94),
            Guard(26, Opcode.INVOKE_STATIC, listOf(), "Lt25;->g()Lpge;")
        ), listOf(
            Edit(25, "insert", "const/16 p1, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lt25;->g()Lpge;" to 1)),
    MethodPlan("Lma1;->k(Ljava/util/Collection;Landroid/content/Context;)Ljava/util/ArrayList;", 21, 188, listOf(
            Guard(3, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(4, Opcode.MOVE_RESULT, listOf(1)),
            Guard(5, Opcode.NEW_INSTANCE, listOf(2), "Lda1;"),
            Guard(6, Opcode.INVOKE_DIRECT, listOf(2, 0, 1), "Lda1;-><init>(Landroid/content/Context;Z)V")
        ), listOf(
            Edit(5, "insert", "const/16 v1, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lda1;" to 1, "Lda1;-><init>(Landroid/content/Context;Z)V" to 1)),
    MethodPlan("Lnh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V", 15, 248, listOf(
            Guard(11, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(12, Opcode.MOVE_RESULT, listOf(0)),
            Guard(13, Opcode.INVOKE_VIRTUAL, listOf(14), "Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;->getType()Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;"),
            Guard(14, Opcode.MOVE_RESULT_OBJECT, listOf(2))
        ), listOf(
            Edit(13, "insert", "const/16 v0, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;->getType()Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;" to 5)),
    MethodPlan("Lqbi;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 11, 167, listOf(
            Guard(1, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(2, Opcode.MOVE_RESULT, listOf(10)),
            Guard(3, Opcode.IF_EQZ, listOf(10), null, 12),
            Guard(4, Opcode.SGET_OBJECT, listOf(10), "Lkph;->a:Llph;")
        ), listOf(
            Edit(3, "insert", "const/16 p1, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lkph;->a:Llph;" to 1)),
    MethodPlan("Lu9i;->q(Ljava/util/List;Ltn4;)Ljava/lang/Object;", 11, 91, listOf(
            Guard(30, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(31, Opcode.MOVE_RESULT, listOf(10)),
            Guard(32, Opcode.IGET_OBJECT, listOf(0, 8), "Lw91;->a:Landroid/content/Context;"),
            Guard(33, Opcode.IF_EQZ, listOf(10), null, 41)
        ), listOf(
            Edit(32, "insert", "const/16 p2, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lw91;->a:Landroid/content/Context;" to 2)),
    MethodPlan("Lw91;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V", 5, 35, listOf(
            Guard(23, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(24, Opcode.MOVE_RESULT, listOf(4)),
            Guard(25, Opcode.IF_NEZ, listOf(4), null, 31),
            Guard(26, Opcode.INVOKE_VIRTUAL, listOf(2), "Lw91;->y()Ljava/lang/Boolean;")
        ), listOf(
            Edit(25, "insert", "const/16 p2, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lw91;->y()Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lw91;->start()V", 14, 59, listOf(
            Guard(18, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(19, Opcode.MOVE_RESULT, listOf(1)),
            Guard(20, Opcode.IF_NEZ, listOf(1), null, 26),
            Guard(21, Opcode.INVOKE_VIRTUAL, listOf(13), "Lw91;->y()Ljava/lang/Boolean;")
        ), listOf(
            Edit(20, "insert", "const/16 v1, 0x1")
        ), mapOf("Lt25;->j()Z" to 1, "Lw91;->y()Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lx9i;->a(Landroid/location/Location;)V", 15, 300, listOf(
            Guard(0, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(1, Opcode.MOVE_RESULT, listOf(0)),
            Guard(2, Opcode.IF_EQZ, listOf(0), null, 14),
            Guard(3, Opcode.SGET_OBJECT, listOf(0), "Lkph;->x:Llph;"),
            Guard(114, Opcode.INVOKE_STATIC, listOf(), "Lt25;->j()Z"),
            Guard(115, Opcode.MOVE_RESULT, listOf(6)),
            Guard(116, Opcode.CONST_4, listOf(7)),
            Guard(117, Opcode.IF_EQZ, listOf(6), null, 129)
        ), listOf(
            Edit(2, "insert", "const/16 v0, 0x1"),
            Edit(116, "insert", "const/16 v6, 0x1")
        ), mapOf("Lt25;->j()Z" to 2, "Lkph;->x:Llph;" to 2)),
    MethodPlan("Ljpf;->b(Lr71;)V", 9, 66, listOf(
            Guard(4, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(5, Opcode.MOVE_RESULT, listOf(0)),
            Guard(6, Opcode.IGET_OBJECT, listOf(1, 7), "Llb1;->b:Landroidx/viewbinding/ViewBinding;"),
            Guard(7, Opcode.CHECK_CAST, listOf(1), "Lxua;")
        ), listOf(
            Edit(6, "insert", "const/16 v0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Llb1;->b:Landroidx/viewbinding/ViewBinding;" to 1, "Lxua;" to 1)),
    MethodPlan("Lc6k;-><init>(Landroid/app/Application;Lsle;)V", 5, 49, listOf(
            Guard(28, Opcode.INVOKE_INTERFACE, listOf(4, 3), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(29, Opcode.MOVE_RESULT, listOf(3)),
            Guard(30, Opcode.INVOKE_DIRECT, listOf(1, 3), "Lc6k\$c;-><init>(Z)V"),
            Guard(31, Opcode.INVOKE_STATIC, listOf(1), "Lkei;->a(Ljava/lang/Object;)Ljei;")
        ), listOf(
            Edit(30, "insert", "const/16 p1, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lc6k\$c;-><init>(Z)V" to 1, "Lkei;->a(Ljava/lang/Object;)Ljei;" to 3)),
    MethodPlan("Lc6k;->d()V", 4, 11, listOf(
            Guard(3, Opcode.INVOKE_INTERFACE, listOf(1, 2), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(4, Opcode.MOVE_RESULT, listOf(1)),
            Guard(5, Opcode.INVOKE_DIRECT, listOf(0, 1), "Lc6k\$c;-><init>(Z)V"),
            Guard(6, Opcode.IGET_OBJECT, listOf(3, 3), "Lc6k;->x:Ljei;")
        ), listOf(
            Edit(5, "insert", "const/16 v1, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lc6k\$c;-><init>(Z)V" to 1, "Lc6k;->x:Ljei;" to 1)),
    MethodPlan("Ldg8;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 8, 108, listOf(
            Guard(25, Opcode.INVOKE_INTERFACE, listOf(7, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(26, Opcode.MOVE_RESULT, listOf(7)),
            Guard(27, Opcode.INVOKE_STATIC, listOf(7), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(28, Opcode.MOVE_RESULT_OBJECT, listOf(7))
        ), listOf(
            Edit(27, "insert", "const/16 p2, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Leih;-><init>(Landroid/app/Application;Lsle;Ld7j;Lqmb;)V", 11, 109, listOf(
            Guard(36, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(37, Opcode.MOVE_RESULT, listOf(8)),
            Guard(38, Opcode.INVOKE_STATIC, listOf(8), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(39, Opcode.MOVE_RESULT_OBJECT, listOf(8))
        ), listOf(
            Edit(38, "insert", "const/16 p2, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lizg;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 6, 51, listOf(
            Guard(17, Opcode.INVOKE_INTERFACE, listOf(5, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(18, Opcode.MOVE_RESULT, listOf(5)),
            Guard(19, Opcode.INVOKE_STATIC, listOf(5), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(20, Opcode.MOVE_RESULT_OBJECT, listOf(5))
        ), listOf(
            Edit(19, "insert", "const/16 p2, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 4)),
    MethodPlan("Lnl/flitsmeister/controllers/activities/settings/SettingsActivity;->onResume()V", 5, 26, listOf(
            Guard(8, Opcode.INVOKE_INTERFACE, listOf(2, 3), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(9, Opcode.MOVE_RESULT, listOf(2)),
            Guard(10, Opcode.INVOKE_DIRECT, listOf(1, 2), "Lsa0\$c;-><init>(Z)V"),
            Guard(11, Opcode.INVOKE_STATIC, listOf(1), "Lkei;->a(Ljava/lang/Object;)Ljei;"),
            Guard(15, Opcode.INVOKE_INTERFACE, listOf(0, 3), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(16, Opcode.MOVE_RESULT, listOf(0)),
            Guard(17, Opcode.INVOKE_DIRECT, listOf(2, 0), "Lsa0\$c;-><init>(Z)V"),
            Guard(18, Opcode.CONST_4, listOf(0))
        ), listOf(
            Edit(10, "insert", "const/16 v2, 0x1"),
            Edit(17, "insert", "const/16 v0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 2, "Lsa0\$c;-><init>(Z)V" to 2, "Lkei;->a(Ljava/lang/Object;)Ljei;" to 1)),
    MethodPlan("Lnsg;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 3, 23, listOf(
            Guard(14, Opcode.INVOKE_INTERFACE, listOf(2, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(15, Opcode.MOVE_RESULT, listOf(0)),
            Guard(16, Opcode.INVOKE_STATIC, listOf(0), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(17, Opcode.MOVE_RESULT_OBJECT, listOf(0))
        ), listOf(
            Edit(16, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lnu0;->a(Lvn4;)Ljava/lang/Object;", 14, 118, listOf(
            Guard(55, Opcode.INVOKE_INTERFACE, listOf(5, 4), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(56, Opcode.MOVE_RESULT, listOf(1)),
            Guard(96, Opcode.INVOKE_INTERFACE, listOf(5, 4), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(97, Opcode.MOVE_RESULT, listOf(11)),
            Guard(98, Opcode.IF_NEZ, listOf(11), null, 106),
            Guard(99, Opcode.INVOKE_INTERFACE, listOf(2), "Lnl/flitsmeister/managers/ble/BlePairedDevicesManager;->getPairedDevices()Ljava/util/List;")
        ), listOf(
            Edit(98, "insert", "const/16 v11, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 2, "Lnl/flitsmeister/managers/ble/BlePairedDevicesManager;->getPairedDevices()Ljava/util/List;" to 3)),
    MethodPlan("Lqsg;-><init>(Landroid/app/Application;Lsle;Ldhe;)V", 10, 40, listOf(
            Guard(8, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(9, Opcode.MOVE_RESULT, listOf(7)),
            Guard(10, Opcode.INVOKE_STATIC, listOf(7), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(11, Opcode.MOVE_RESULT_OBJECT, listOf(7))
        ), listOf(
            Edit(10, "insert", "const/16 p1, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lrlb;-><init>(Landroid/app/Application;Lsle;Lgm8;)V", 9, 66, listOf(
            Guard(5, Opcode.INVOKE_INTERFACE, listOf(7, 6), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(6, Opcode.MOVE_RESULT, listOf(7)),
            Guard(7, Opcode.INVOKE_STATIC, listOf(7), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(8, Opcode.MOVE_RESULT_OBJECT, listOf(7))
        ), listOf(
            Edit(7, "insert", "const/16 p2, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 4)),
    MethodPlan("Lsa0;->b(Landroid/content/Context;Lnl/flitsmeister/models/enums/AppIcon;Lsf4;)V", 8, 53, listOf(
            Guard(9, Opcode.INVOKE_INTERFACE, listOf(2, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(10, Opcode.MOVE_RESULT, listOf(3)),
            Guard(11, Opcode.INVOKE_DIRECT, listOf(0, 3), "Lsa0\$c;-><init>(Z)V"),
            Guard(12, Opcode.INVOKE_STATIC, listOf(0), "Lkei;->a(Ljava/lang/Object;)Ljei;"),
            Guard(25, Opcode.INVOKE_INTERFACE, listOf(2, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(26, Opcode.MOVE_RESULT, listOf(1)),
            Guard(27, Opcode.INVOKE_DIRECT, listOf(0, 1), "Lsa0\$c;-><init>(Z)V"),
            Guard(28, Opcode.INVOKE_STATIC, listOf(0), "Lkei;->a(Ljava/lang/Object;)Ljei;")
        ), listOf(
            Edit(11, "insert", "const/16 v3, 0x1"),
            Edit(27, "insert", "const/16 v1, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 2, "Lsa0\$c;-><init>(Z)V" to 2, "Lkei;->a(Ljava/lang/Object;)Ljei;" to 2)),
    MethodPlan("Lu9g;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 6, 70, listOf(
            Guard(25, Opcode.INVOKE_INTERFACE, listOf(3, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(26, Opcode.MOVE_RESULT, listOf(3)),
            Guard(27, Opcode.INVOKE_STATIC, listOf(3), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(28, Opcode.MOVE_RESULT_OBJECT, listOf(3))
        ), listOf(
            Edit(27, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lv37;-><init>(Landroid/app/Application;Lsle;)V", 10, 40, listOf(
            Guard(4, Opcode.INVOKE_INTERFACE, listOf(9, 8), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(5, Opcode.MOVE_RESULT, listOf(9)),
            Guard(6, Opcode.INVOKE_STATIC, listOf(9), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(7, Opcode.MOVE_RESULT_OBJECT, listOf(9))
        ), listOf(
            Edit(6, "insert", "const/16 p2, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lzpf;-><init>(Landroid/app/Application;Lsle;Lgm8;)V", 10, 45, listOf(
            Guard(4, Opcode.INVOKE_INTERFACE, listOf(8, 7), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(5, Opcode.MOVE_RESULT, listOf(8)),
            Guard(6, Opcode.INVOKE_STATIC, listOf(8), "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
            Guard(7, Opcode.MOVE_RESULT_OBJECT, listOf(8))
        ), listOf(
            Edit(6, "insert", "const/16 p2, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" to 2)),
    MethodPlan("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onDestroy()V", 13, 572, listOf(
            Guard(398, Opcode.IGET_OBJECT, listOf(6, 12), "Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->t1:Lsle;"),
            Guard(399, Opcode.IF_EQZ, listOf(6), null, 407),
            Guard(400, Opcode.INVOKE_INTERFACE, listOf(6, 12), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(401, Opcode.MOVE_RESULT, listOf(6)),
            Guard(402, Opcode.IF_NEZ, listOf(6), null, 410),
            Guard(403, Opcode.INVOKE_VIRTUAL, listOf(3, 12, 2), "Llph;->m(Landroid/content/Context;Ljava/lang/String;)Z")
        ), listOf(
            Edit(402, "goto", "", 410)
        ), mapOf("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->t1:Lsle;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Llph;->m(Landroid/content/Context;Ljava/lang/String;)Z" to 2)),
    MethodPlan("Los0;->b(Lvn4;)Ljava/lang/Object;", 7, 66, listOf(
            Guard(32, Opcode.INVOKE_INTERFACE, listOf(6, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(33, Opcode.MOVE_RESULT, listOf(6)),
            Guard(34, Opcode.IF_EQZ, listOf(6), null, 62),
            Guard(35, Opcode.IPUT, listOf(3, 0), "Lls0;->c:I")
        ), listOf(
            Edit(34, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lls0;->c:I" to 5)),
    MethodPlan("Los0;->c(Landroid/bluetooth/BluetoothDevice;Lvn4;)Ljava/lang/Object;", 11, 83, listOf(
            Guard(41, Opcode.INVOKE_INTERFACE, listOf(10, 8), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(42, Opcode.MOVE_RESULT, listOf(8)),
            Guard(43, Opcode.IF_EQZ, listOf(8), null, 79),
            Guard(44, Opcode.IPUT_OBJECT, listOf(9, 2), "Lms0;->a:Landroid/bluetooth/BluetoothDevice;")
        ), listOf(
            Edit(43, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lms0;->a:Landroid/bluetooth/BluetoothDevice;" to 6)),
    MethodPlan("Ldkk;->a(Lnl/flitsmeister/models/enums/SignalScreens;Z)Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;", 10, 204, listOf(
            Guard(100, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
            Guard(101, Opcode.GOTO_16, listOf(), null, 194),
            Guard(102, Opcode.INVOKE_INTERFACE, listOf(9, 5), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(103, Opcode.MOVE_RESULT, listOf(7)),
            Guard(104, Opcode.IF_EQZ, listOf(7), null, 108),
            Guard(105, Opcode.SGET_OBJECT, listOf(7), "Lkph;->t1:Llph;"),
            Guard(115, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
            Guard(116, Opcode.GOTO_16, listOf(), null, 194),
            Guard(117, Opcode.INVOKE_INTERFACE, listOf(9, 5), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(118, Opcode.MOVE_RESULT, listOf(7)),
            Guard(119, Opcode.IF_EQZ, listOf(7), null, 123),
            Guard(120, Opcode.SGET_OBJECT, listOf(7), "Lb38;->V1:Llph;"),
            Guard(184, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
            Guard(185, Opcode.GOTO, listOf(), null, 194),
            Guard(186, Opcode.INVOKE_INTERFACE, listOf(9, 5), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(187, Opcode.MOVE_RESULT, listOf(7)),
            Guard(188, Opcode.IF_EQZ, listOf(7), null, 192),
            Guard(189, Opcode.SGET_OBJECT, listOf(7), "Lkph;->j:Llph;")
        ), listOf(
            Edit(104, "replace", "nop"),
            Edit(119, "replace", "nop"),
            Edit(188, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 3, "Lkph;->t1:Llph;" to 1, "Lb38;->V1:Llph;" to 1, "Lkph;->j:Llph;" to 1)),
    MethodPlan("Ldkk;->g()V", 23, 722, listOf(
            Guard(477, Opcode.AGET, listOf(14, 12, 14)),
            Guard(478, Opcode.IF_NE, listOf(14, 11), null, 492),
            Guard(479, Opcode.INVOKE_INTERFACE, listOf(7, 5), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(480, Opcode.MOVE_RESULT, listOf(14)),
            Guard(481, Opcode.IF_EQZ, listOf(14), null, 488),
            Guard(482, Opcode.SGET_OBJECT, listOf(14), "Lwc0;->m:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;"),
            Guard(674, Opcode.AGET, listOf(6, 12, 6)),
            Guard(675, Opcode.IF_NE, listOf(6, 13), null, 687),
            Guard(676, Opcode.INVOKE_INTERFACE, listOf(7, 5), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(677, Opcode.MOVE_RESULT, listOf(6)),
            Guard(678, Opcode.IF_EQZ, listOf(6), null, 683),
            Guard(679, Opcode.SGET_OBJECT, listOf(6), "Lb38;->J0:Llph;")
        ), listOf(
            Edit(481, "replace", "nop"),
            Edit(678, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 2, "Lwc0;->m:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1, "Lb38;->J0:Llph;" to 1)),
    MethodPlan("Lich;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 13, 72, listOf(
            Guard(19, Opcode.IGET_OBJECT, listOf(12, 4), "Lhch;->b:Lsle;"),
            Guard(20, Opcode.IGET_OBJECT, listOf(0, 11), "Lich;->d:Landroid/content/Context;"),
            Guard(21, Opcode.INVOKE_INTERFACE, listOf(12, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(22, Opcode.MOVE_RESULT, listOf(12)),
            Guard(23, Opcode.IF_NEZ, listOf(12), null, 68),
            Guard(24, Opcode.IGET_OBJECT, listOf(12, 4), "Lhch;->d:Ldhe;")
        ), listOf(
            Edit(23, "goto", "", 68)
        ), mapOf("Lhch;->b:Lsle;" to 1, "Lich;->d:Landroid/content/Context;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Lhch;->d:Ldhe;" to 2)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/k;->q(Lnl/flitsmeister/fmx/activities/main/k;Ljava/lang/String;)V", 6, 40, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.CONST_4, listOf(2)),
            Guard(5, Opcode.IF_EQZ, listOf(0), null, 13),
            Guard(6, Opcode.SGET_OBJECT, listOf(0), "Lqc6;->a:Lqc6;")
        ), listOf(
            Edit(5, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lqc6;->a:Lqc6;" to 1)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/k;->H(Lvn4;)Ljava/lang/Object;", 19, 117, listOf(
            Guard(48, Opcode.INVOKE_INTERFACE, listOf(1, 3), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(49, Opcode.MOVE_RESULT, listOf(1)),
            Guard(50, Opcode.IF_EQZ, listOf(1), null, 114),
            Guard(51, Opcode.SGET_OBJECT, listOf(1), "Lqc6;->a:Lqc6;")
        ), listOf(
            Edit(50, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lqc6;->a:Lqc6;" to 1)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/k;->d(Lvn4;)Ljava/io/Serializable;", 21, 222, listOf(
            Guard(95, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
            Guard(96, Opcode.IGET_OBJECT, listOf(3, 0), "Lnl/flitsmeister/fmx/activities/main/k;->s:Lsle;"),
            Guard(97, Opcode.INVOKE_INTERFACE, listOf(3, 5), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(98, Opcode.MOVE_RESULT, listOf(3)),
            Guard(99, Opcode.IF_EQZ, listOf(3), null, 104),
            Guard(100, Opcode.IF_EQZ, listOf(2), null, 104)
        ), listOf(
            Edit(99, "replace", "nop")
        ), mapOf("Lnl/flitsmeister/fmx/activities/main/k;->s:Lsle;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lnl/flitsmeister/models/enums/NightModeTypes\$Companion;->getCurrentNightmodeType(Landroid/content/Context;)Lnl/flitsmeister/models/enums/NightModeTypes;", 3, 25, listOf(
            Guard(9, Opcode.MOVE_RESULT, listOf(0)),
            Guard(10, Opcode.IF_NEZ, listOf(0), null, 23),
            Guard(11, Opcode.INVOKE_INTERFACE, listOf(1, 2), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(12, Opcode.MOVE_RESULT, listOf(1)),
            Guard(13, Opcode.IF_NEZ, listOf(1), null, 15),
            Guard(14, Opcode.GOTO, listOf(), null, 23)
        ), listOf(
            Edit(13, "goto", "", 15)
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lso5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", 10, 35, listOf(
            Guard(15, Opcode.IGET_OBJECT, listOf(0, 9), "Lup5;->b:Lsle;"),
            Guard(16, Opcode.IGET_OBJECT, listOf(9, 9), "Lup5;->a:Landroid/app/Application;"),
            Guard(17, Opcode.INVOKE_INTERFACE, listOf(0, 9), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(18, Opcode.MOVE_RESULT, listOf(9)),
            Guard(19, Opcode.IF_EQZ, listOf(9), null, 29),
            Guard(20, Opcode.NEW_INSTANCE, listOf(2), "Lmo5;")
        ), listOf(
            Edit(19, "replace", "nop")
        ), mapOf("Lup5;->b:Lsle;" to 1, "Lup5;->a:Landroid/app/Application;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Lmo5;" to 1)),
    MethodPlan("Lvu0;->a(Lvn4;)Ljava/io/Serializable;", 9, 105, listOf(
            Guard(42, Opcode.IGET_OBJECT, listOf(1, 7), "Lvu0;->x:Lsle;"),
            Guard(43, Opcode.IGET_OBJECT, listOf(6, 7), "Lvu0;->a:Landroid/content/Context;"),
            Guard(44, Opcode.INVOKE_INTERFACE, listOf(1, 6), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(45, Opcode.MOVE_RESULT, listOf(1)),
            Guard(46, Opcode.IF_EQZ, listOf(1), null, 83),
            Guard(47, Opcode.IPUT_OBJECT, listOf(8, 0), "Lwu0;->a:Ljava/util/List;")
        ), listOf(
            Edit(46, "replace", "nop")
        ), mapOf("Lvu0;->x:Lsle;" to 1, "Lvu0;->a:Landroid/content/Context;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Lwu0;->a:Ljava/util/List;" to 6)),
    MethodPlan("Lvv0;->c(Lvn4;)Ljava/lang/Object;", 7, 66, listOf(
            Guard(32, Opcode.INVOKE_INTERFACE, listOf(6, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(33, Opcode.MOVE_RESULT, listOf(6)),
            Guard(34, Opcode.IF_EQZ, listOf(6), null, 62),
            Guard(35, Opcode.IPUT, listOf(3, 0), "Lrv0;->c:I")
        ), listOf(
            Edit(34, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lrv0;->c:I" to 5)),
    MethodPlan("Lvv0;->f(Lvn4;)Ljava/lang/Object;", 7, 68, listOf(
            Guard(32, Opcode.INVOKE_INTERFACE, listOf(6, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(33, Opcode.MOVE_RESULT, listOf(6)),
            Guard(34, Opcode.IF_EQZ, listOf(6), null, 64),
            Guard(35, Opcode.IPUT, listOf(3, 0), "Luv0;->c:I")
        ), listOf(
            Edit(34, "replace", "nop")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Luv0;->c:I" to 5)),
    MethodPlan("Lzi4;->a(Ljava/lang/String;Lvn4;)Ljava/lang/Object;", 14, 148, listOf(
            Guard(39, Opcode.IGET_OBJECT, listOf(13, 11), "Lzi4;->d:Lsle;"),
            Guard(40, Opcode.IGET_OBJECT, listOf(1, 11), "Lzi4;->a:Landroid/content/Context;"),
            Guard(41, Opcode.INVOKE_INTERFACE, listOf(13, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(42, Opcode.MOVE_RESULT, listOf(13)),
            Guard(43, Opcode.IF_NEZ, listOf(13), null, 50),
            Guard(44, Opcode.NEW_INSTANCE, listOf(11), "Lnl/flitsmeister/fmcore/utils/exception/GenericException;")
        ), listOf(
            Edit(43, "goto", "", 50)
        ), mapOf("Lzi4;->d:Lsle;" to 1, "Lzi4;->a:Landroid/content/Context;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Lnl/flitsmeister/fmcore/utils/exception/GenericException;" to 2)),
    MethodPlan("Lnhd;->a(Landroid/content/Context;)V", 3, 30, listOf(
            Guard(13, Opcode.SGET_BOOLEAN, listOf(1), "Lnl/flitsmeister/FlitsmeisterApplication;->y:Z"),
            Guard(14, Opcode.IF_EQZ, listOf(1), null, 29),
            Guard(15, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(16, Opcode.MOVE_RESULT, listOf(0)),
            Guard(17, Opcode.IF_EQZ, listOf(0), null, 29),
            Guard(18, Opcode.SGET_OBJECT, listOf(0), "Lnhd;->c:Ladi;")
        ), listOf(
            Edit(17, "replace", "nop")
        ), mapOf("Lnl/flitsmeister/FlitsmeisterApplication;->y:Z" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Lnhd;->c:Ladi;" to 2)),
    MethodPlan("Lhch;->a(Lhch;)Ljava/lang/String;", 4, 40, listOf(
            Guard(5, Opcode.INVOKE_INTERFACE, listOf(2, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(6, Opcode.MOVE_RESULT, listOf(2)),
            Guard(7, Opcode.IF_NEZ, listOf(2), null, 10),
            Guard(8, Opcode.CONST_STRING, listOf(3))
        ), listOf(
            Edit(7, "goto", "", 10)
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lhch;->b(Lhch;)Ljava/lang/String;", 3, 22, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(1, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(1)),
            Guard(4, Opcode.IF_NEZ, listOf(1), null, 7),
            Guard(5, Opcode.CONST_STRING, listOf(2))
        ), listOf(
            Edit(4, "goto", "", 7)
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lcnj;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;", 4, 47, listOf(
            Guard(7, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Lsle;->c(Landroid/content/Context;)Z"),
            Guard(8, Opcode.MOVE_RESULT, listOf(1)),
            Guard(9, Opcode.IF_EQZ, listOf(1), null, 13),
            Guard(10, Opcode.INVOKE_STATIC, listOf(2), "Lcsj;->c(Landroid/content/Context;)Z"),
            Guard(24, Opcode.INVOKE_INTERFACE, listOf(0, 2), "Lsle;->c(Landroid/content/Context;)Z"),
            Guard(25, Opcode.MOVE_RESULT, listOf(3)),
            Guard(26, Opcode.IF_EQZ, listOf(3), null, 35),
            Guard(27, Opcode.INVOKE_STATIC, listOf(2), "Lcsj;->c(Landroid/content/Context;)Z")
        ), listOf(
            Edit(9, "insert", "const/16 v1, 0x1"),
            Edit(26, "insert", "const/16 p1, 0x1")
        ), mapOf("Lsle;->c(Landroid/content/Context;)Z" to 2, "Lcsj;->c(Landroid/content/Context;)Z" to 2)),
    MethodPlan("Lbz5;->invoke()Ljava/lang/Object;", 9, 47, listOf(
            Guard(6, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
            Guard(7, Opcode.CHECK_CAST, listOf(0), "Lljd;"),
            Guard(8, Opcode.INVOKE_VIRTUAL, listOf(0), "Lljd;->b()Z"),
            Guard(9, Opcode.MOVE_RESULT, listOf(0)),
            Guard(10, Opcode.IF_NEZ, listOf(0), null, 27),
            Guard(11, Opcode.INVOKE_INTERFACE, listOf(1), "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;")
        ), listOf(
            Edit(10, "goto", "", 27)
        ), mapOf("Lljd;" to 2, "Lljd;->b()Z" to 1, "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;" to 2)),
    MethodPlan("Lryb;->invoke()Ljava/lang/Object;", 7, 31, listOf(
            Guard(3, Opcode.CHECK_CAST, listOf(1), "Lljd;"),
            Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Lljd;->b()Z"),
            Guard(5, Opcode.MOVE_RESULT, listOf(1)),
            Guard(6, Opcode.IGET_OBJECT, listOf(2, 6), "Lryb;->a:Lb49;"),
            Guard(7, Opcode.IF_NEZ, listOf(1), null, 24),
            Guard(8, Opcode.INVOKE_INTERFACE, listOf(0), "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;")
        ), listOf(
            Edit(7, "goto", "", 24)
        ), mapOf("Lljd;" to 2, "Lljd;->b()Z" to 1, "Lryb;->a:Lb49;" to 1, "Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;" to 2)),
    MethodPlan("Lnzb;->invoke()Ljava/lang/Object;", 7, 41, listOf(
            Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
            Guard(5, Opcode.SGET_OBJECT, listOf(2), "Lljd;->b:Lljd;"),
            Guard(6, Opcode.IGET_OBJECT, listOf(3, 6), "Lnzb;->a:Lb49;"),
            Guard(7, Opcode.CONST_STRING, listOf(4)),
            Guard(8, Opcode.IF_NE, listOf(1, 2), null, 10),
            Guard(9, Opcode.GOTO, listOf(), null, 35)
        ), listOf(
            Edit(8, "goto", "", 35)
        ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 1, "Lljd;->b:Lljd;" to 1, "Lnzb;->a:Lb49;" to 1))
    )) }
}
