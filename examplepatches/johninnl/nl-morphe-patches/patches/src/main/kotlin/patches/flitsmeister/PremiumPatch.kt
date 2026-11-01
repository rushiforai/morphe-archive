package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val noticeResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        listOf("list_item_pro_banner", "list_item_pro_banner_small").forEach { name ->
            document("res/layout/$name.xml").use { doc ->
                doc.documentElement.apply {
                    setAttributeNS(ANDROID, "android:visibility", "gone")
                    setAttributeNS(ANDROID, "android:layout_height", "0.0dip")
                }
            }
        }
        listOf("view_settings_normal", "list_item_route_button").forEach { name ->
            document("res/layout/$name.xml").use { doc ->
                val all = doc.getElementsByTagName("*")
                val badges = (0 until all.length).map { all.item(it) as Element }
                    .filter { it.getAttributeNS(ANDROID, "id") == "@id/proLabel" }
                check(badges.size == 1) { "Expected exactly one Pro badge in $name" }
                badges.single().apply {
                    check(tagName == "ImageView") { "Changed native Pro badge type" }
                    setAttributeNS(ANDROID, "android:visibility", "gone")
                    listOf("layout_width", "layout_height", "layout_marginStart", "layout_marginEnd").forEach {
                        setAttributeNS(ANDROID, "android:$it", "0.0dip")
                    }
                    setAttributeNS(ANDROID, "android:importantForAccessibility", "no")
                }
            }
        }
    }
}

private val noticeRendering = bytecodePatch {
    dependsOn(originalInput)
    execute { applyPlans(listOf(
    MethodPlan("Le8d;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", 4, 33, listOf(
            Guard(20, Opcode.MOVE_RESULT_OBJECT, listOf(3)),
            Guard(21, Opcode.CHECK_CAST, listOf(3), "Lsle;"),
            Guard(22, Opcode.INVOKE_INTERFACE, listOf(3, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(23, Opcode.MOVE_RESULT, listOf(3)),
            Guard(24, Opcode.IF_EQZ, listOf(3), null, 26),
            Guard(25, Opcode.GOTO, listOf(), null, 29)
        ), listOf(
            Edit(24, "replace", "nop")
        ), mapOf("Lsle;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lf8d;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 4, 34, listOf(
            Guard(21, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
            Guard(22, Opcode.CHECK_CAST, listOf(2), "Lsle;"),
            Guard(23, Opcode.INVOKE_INTERFACE, listOf(2, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(24, Opcode.MOVE_RESULT, listOf(2)),
            Guard(25, Opcode.IF_EQZ, listOf(2), null, 27),
            Guard(26, Opcode.GOTO, listOf(), null, 30)
        ), listOf(
            Edit(25, "replace", "nop")
        ), mapOf("Lsle;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V", 22, 757, listOf(
            Guard(581, Opcode.INVOKE_INTERFACE, listOf(12, 8), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(582, Opcode.MOVE_RESULT, listOf(12)),
            Guard(583, Opcode.IF_NEZ, listOf(12), null, 596),
            Guard(584, Opcode.SGET_OBJECT, listOf(12), "Lib;->j:Lib\$a;")
        ), listOf(
            Edit(583, "goto", "", 596)
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lib;->j:Lib\$a;" to 1)),
    MethodPlan("Lmp5;->b(Landroidx/compose/ui/Modifier;Lg3i;Lnl/flitsmeister/fmx/activities/main/k;Lb49;Lb49;Lb49;Lb49;Lnp5;Landroidx/compose/runtime/Composer;I)V", 55, 1025, listOf(
            Guard(860, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
            Guard(861, Opcode.CHECK_CAST, listOf(2), "Landroid/content/Context;"),
            Guard(862, Opcode.INVOKE_INTERFACE, listOf(1, 2), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(863, Opcode.MOVE_RESULT, listOf(1)),
            Guard(864, Opcode.IF_NEZ, listOf(1), null, 940),
            Guard(865, Opcode.CONST, listOf(1))
        ), listOf(
            Edit(864, "goto", "", 940)
        ), mapOf("Landroid/content/Context;" to 2, "Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lnl/flitsmeister/controllers/fragments/achievements/AchievementFragment;->onResume()V", 6, 87, listOf(
            Guard(63, Opcode.INVOKE_INTERFACE, listOf(1, 0), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(64, Opcode.MOVE_RESULT, listOf(0)),
            Guard(65, Opcode.IF_EQZ, listOf(0), null, 77),
            Guard(66, Opcode.INVOKE_VIRTUAL, listOf(5), "Lkb1;->getBinding()Landroidx/viewbinding/ViewBinding;")
        ), listOf(
            Edit(65, "goto", "", 77)
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkb1;->getBinding()Landroidx/viewbinding/ViewBinding;" to 5)),
    MethodPlan("Lvtb;->a(Lfi7;Landroidx/compose/runtime/Composer;I)V", 13, 139, listOf(
            Guard(84, Opcode.INVOKE_INTERFACE, listOf(0, 11), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(85, Opcode.MOVE_RESULT, listOf(0)),
            Guard(86, Opcode.IF_EQZ, listOf(0), null, 95),
            Guard(87, Opcode.CONST, listOf(0))
        ), listOf(
            Edit(86, "insert", "const/16 v0, 0x0")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lkie;->a(Landroidx/compose/ui/Modifier;FLz39;Ljava/lang/String;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/runtime/Composer;II)V", 67, 575, listOf(
            Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(1, 59)),
            Guard(1, Opcode.MOVE_OBJECT_FROM16, listOf(3, 61))
        ), listOf(
            Edit(0, "body", "return-void")
        ), mapOf()),
    MethodPlan("Lkie;->b(ILz39;Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;Ljava/lang/String;)V", 39, 282, listOf(
            Guard(0, Opcode.MOVE_FROM16, listOf(0, 34)),
            Guard(1, Opcode.MOVE_OBJECT_FROM16, listOf(1, 35))
        ), listOf(
            Edit(0, "body", "return-void")
        ), mapOf()),
    MethodPlan("Ldje;->b(Landroidx/compose/ui/Modifier;Leje\$a\$a;JLandroidx/compose/runtime/Composer;II)V", 21, 102, listOf(
            Guard(0, Opcode.MOVE_FROM16, listOf(5, 19)),
            Guard(1, Opcode.INVOKE_VIRTUAL, listOf(15), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")
        ), listOf(
            Edit(0, "body", "return-void")
        ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 1)),
    MethodPlan("Ldje;->d(Landroidx/compose/ui/Modifier;Leje\$a\$a;JLandroidx/compose/runtime/Composer;II)V", 21, 131, listOf(
            Guard(0, Opcode.MOVE_FROM16, listOf(5, 19)),
            Guard(1, Opcode.INVOKE_VIRTUAL, listOf(15), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")
        ), listOf(
            Edit(0, "body", "return-void")
        ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 1)),
    MethodPlan("Lzdh;->a(Landroidx/compose/ui/Modifier;Laeh;Lz39;Lb49;ZZZLandroidx/compose/foundation/ScrollState;Ljava/lang/String;Lr49;Landroidx/compose/runtime/Composer;II)V", 46, 581, listOf(
            Guard(553, Opcode.MOVE_OBJECT_FROM16, listOf(14, 33)),
            Guard(554, Opcode.INVOKE_STATIC_RANGE, listOf(13, 14, 15, 16, 17, 18, 19, 20, 21), "Landroidx/compose/animation/AnimatedVisibilityKt;->AnimatedVisibility(ZLandroidx/compose/ui/Modifier;Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;Ljava/lang/String;Lr49;Landroidx/compose/runtime/Composer;II)V"),
            Guard(555, Opcode.MOVE_OBJECT_FROM16, listOf(17, 19))
        ), listOf(
            Edit(554, "insert", "const/16 v13, 0x0")
        ), mapOf("Landroidx/compose/animation/AnimatedVisibilityKt;->AnimatedVisibility(ZLandroidx/compose/ui/Modifier;Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;Ljava/lang/String;Lr49;Landroidx/compose/runtime/Composer;II)V" to 1)),
    MethodPlan("Lsvg;->a(Landroidx/compose/ui/Modifier;Lz39;Lb49;Lst0;Landroidx/compose/foundation/ScrollState;Landroidx/compose/runtime/Composer;I)V", 15, 121, listOf(
            Guard(94, Opcode.CONST_16, listOf(2)),
            Guard(95, Opcode.INVOKE_STATIC, listOf(1, 0, 13, 2), "Lrle;->a(Landroidx/compose/ui/Modifier;Lp49;Landroidx/compose/runtime/Composer;I)V"),
            Guard(96, Opcode.INVOKE_INTERFACE, listOf(13), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V")
        ), listOf(
            Edit(95, "replace", "nop")
        ), mapOf("Lrle;->a(Landroidx/compose/ui/Modifier;Lp49;Landroidx/compose/runtime/Composer;I)V" to 1, "Landroidx/compose/runtime/Composer;->endReplaceGroup()V" to 2)),
    MethodPlan("Lt0a;->f(Landroid/content/Context;ZLjava/util/Date;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V", 15, 70, listOf(
            Guard(66, Opcode.INVOKE_STATIC, listOf(), "Lnl/flitsmeister/fmcore/models/eventbuses/ShowProOnboardingBusKt;->getBusShowProOnboarding()Lfs7;"),
            Guard(67, Opcode.MOVE_RESULT_OBJECT, listOf(5)),
            Guard(68, Opcode.INVOKE_VIRTUAL, listOf(5, 2), "Lfs7;->a(Ljava/lang/Object;)V"),
            Guard(69, Opcode.RETURN_VOID, listOf())
        ), listOf(
            Edit(68, "replace", "nop")
        ), mapOf("Lnl/flitsmeister/fmcore/models/eventbuses/ShowProOnboardingBusKt;->getBusShowProOnboarding()Lfs7;" to 1, "Lfs7;->a(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lj6b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 9, 66, listOf(
            Guard(0, Opcode.IGET_OBJECT, listOf(0, 7), "Lj6b;->a:Ljava/lang/Object;"),
            Guard(1, Opcode.CHECK_CAST, listOf(0), "Ljava/lang/Boolean;")
        ), listOf(
            Edit(0, "body", "invoke-static {p1}, Lijf;->b(Ljava/lang/Object;)V\niget-object v0, p0, Lj6b;->b:Lnl/flitsmeister/fmx/activities/main/MainActivity;\ninvoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;\nmove-result-object v0\niget-object v0, v0, Lnl/flitsmeister/fmx/activities/main/k;->K3:Ljei;\nsget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nconst/4 v2, 0x0\ninvoke-virtual {v0, v2, v1}, Ljei;->l(Ljava/lang/Object;Ljava/lang/Object;)Z\nsget-object v0, Ltvj;->a:Ltvj;\nreturn-object v0")
        ), mapOf("Lj6b;->a:Ljava/lang/Object;" to 1, "Ljava/lang/Boolean;" to 1)),
    MethodPlan("Lcvb;->b(ZLjava/lang/String;Landroid/graphics/Bitmap;Landroidx/compose/ui/graphics/painter/Painter;Lz39;Ljava/lang/String;Lz39;Ljava/lang/String;ZLandroidx/compose/runtime/Composer;I)V", 45, 753, listOf(
            Guard(482, Opcode.CHECK_CAST, listOf(1), "Lpji;"),
            Guard(483, Opcode.INVOKE_STATIC, listOf(1, 11), "Loy0;->a(Lpji;Landroidx/compose/runtime/Composer;)Lpy0;"),
            Guard(484, Opcode.MOVE_RESULT_OBJECT, listOf(1)),
            Guard(488, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endNode()V")
        ), listOf(
            Edit(483, "labelled", "instance-of v13, v1, Lpji\$b;\nif-nez v13, :morphe_join\ninstance-of v13, v1, Lpji\$c;\nif-nez v13, :morphe_join", 488)
        ), mapOf("Lpji;" to 1, "Loy0;->a(Lpji;Landroidx/compose/runtime/Composer;)Lpy0;" to 1, "Landroidx/compose/runtime/Composer;->endNode()V" to 2)),
    MethodPlan("Leb0;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 65, 658, listOf(
            Guard(56, Opcode.SGET_OBJECT, listOf(2), "Lpji\$d;->a:Lpji\$d;"),
            Guard(57, Opcode.INVOKE_STATIC, listOf(2, 8), "Loy0;->a(Lpji;Landroidx/compose/runtime/Composer;)Lpy0;"),
            Guard(58, Opcode.MOVE_RESULT_OBJECT, listOf(2)),
            Guard(59, Opcode.INVOKE_INTERFACE, listOf(8), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V")
        ), listOf(
            Edit(57, "labelled_at_join", "instance-of v3, v2, Lpji\$b;\nif-nez v3, :morphe_badge_none\ninstance-of v3, v2, Lpji\$c;\nif-nez v3, :morphe_badge_none\ngoto :morphe_badge_real\n:morphe_badge_none\nconst/4 v2, 0x0\ngoto :morphe_join\n:morphe_badge_real\ninvoke-static {v2, v8}, Loy0;->a(Lpji;Landroidx/compose/runtime/Composer;)Lpy0;", 59)
        ), mapOf("Lpji\$d;->a:Lpji\$d;" to 1, "Loy0;->a(Lpji;Landroidx/compose/runtime/Composer;)Lpy0;" to 1, "Landroidx/compose/runtime/Composer;->endReplaceGroup()V" to 4)),
    MethodPlan("Lga2;->onDraw(Landroid/graphics/Canvas;)V", 50, 1457, listOf(
            Guard(105, Opcode.INVOKE_VIRTUAL, listOf(0, 1), "Landroid/graphics/Canvas;->drawColor(I)V"),
            Guard(106, Opcode.IGET_OBJECT, listOf(1, 9), "Lea2;->d:Lmdb;"),
            Guard(107, Opcode.SGET_OBJECT, listOf(2), "Lmdb;->a:Lmdb;"),
            Guard(108, Opcode.IF_NE, listOf(1, 2), null, 110)
        ), listOf(
            Edit(107, "labelled", "sget-object v2, Lmdb;->c:Lmdb;\nif-eq v1, v2, :morphe_join", 1456)
        ), mapOf("Landroid/graphics/Canvas;->drawColor(I)V" to 1, "Lea2;->d:Lmdb;" to 5, "Lmdb;->a:Lmdb;" to 1))
    )) }
}

@Suppress("unused")
val unlockPro = bytecodePatch(
    name = "Unlock Pro",
    description = "Enables local Pro feature eligibility while preserving saved preferences, permissions, genuine account tiers and backend activation requirements.",
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility, featureSettings, featureUi, androidAutoFeatures, androidAutoNotices)
}

@Suppress("unused")
val hideProNotices = bytecodePatch(
    name = "Hide Pro notices",
    description = "Hides automatic Pro promotions, Pro/Plus badges and Android Auto upsells while retaining settings, avatar data and genuine account/readiness states.",
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility, noticeResources, noticeRendering, androidAutoNotices)
}
