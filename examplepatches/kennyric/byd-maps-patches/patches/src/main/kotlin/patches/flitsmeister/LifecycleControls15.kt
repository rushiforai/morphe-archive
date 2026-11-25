package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

private const val SERVICE = "Lnl/flitsmeister/services/base/FlitsmeisterBaseService;"
private const val MAIN = "Lnl/flitsmeister/fmx/activities/main/MainActivity;"

/** Preserve the selected custom icon after stopping a locally unlocked service. */
internal fun serviceFeaturePlans15() = listOf(
    MethodPlan("$SERVICE->onDestroy()V", 13, 556, listOf(
        Guard(384, Opcode.IGET_OBJECT, listOf(6, 12), "$SERVICE->o1:Laqe;"),
        Guard(386, Opcode.INVOKE_INTERFACE, listOf(6, 12), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(387, Opcode.MOVE_RESULT, listOf(6)),
        Guard(388, Opcode.IF_NEZ, listOf(6), target = 396),
        Guard(389, Opcode.INVOKE_VIRTUAL, listOf(3, 12, 2), "Ltuh;->m(Landroid/content/Context;Ljava/lang/String;)Z"),
    ), listOf(Edit(388, "goto", target = 396))),
)

/** Skip only the automatic main-screen Pro promotion after its genuine checks. */
internal fun mainNoticePlans15() = listOf(
    MethodPlan("$MAIN->onCreate(Landroid/os/Bundle;)V", 22, 747, listOf(
        Guard(571, Opcode.INVOKE_INTERFACE, listOf(12, 8), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(572, Opcode.MOVE_RESULT, listOf(12)),
        Guard(573, Opcode.IF_NEZ, listOf(12), target = 586),
        Guard(574, Opcode.SGET_OBJECT, listOf(12), "Lgb;->j:Lgb\$a;"),
    ), listOf(Edit(573, "goto", target = 586))),
)

/** Keep the resource-hidden parking footer from being shown and wired again. */
internal fun mainPartnerPlans15() = listOf(
    MethodPlan("$MAIN->onCreate(Landroid/os/Bundle;)V", 22, 747, listOf(
        Guard(83, Opcode.IGET_OBJECT, listOf(4, 1), "Lag;->I:Landroid/widget/ImageView;"),
        Guard(87, Opcode.INVOKE_VIRTUAL, listOf(4, 2), "Landroid/view/View;->setVisibility(I)V"),
        Guard(90, Opcode.INVOKE_VIRTUAL, listOf(4, 5), "Landroid/view/View;->setOnClickListener(Landroid/view/View\$OnClickListener;)V"),
    ), listOf(Edit(87, "replace", "nop"), Edit(90, "replace", "nop"))),
)

/** Bypass SDK identity scheduling and take the existing local trip reset. */
internal fun lifecycleTelemetryPlans15() = listOf(
    MethodPlan("Lnl/flitsmeister/FlitsmeisterApplication;->onCreate()V", 21, 230, listOf(
        Guard(92, Opcode.INVOKE_STATIC, emptyList(), "Lfb8;->a()Lfb8;"),
        Guard(94, Opcode.IGET_OBJECT, listOf(0, 0), "Lfb8;->a:Lq85;"),
        Guard(95, Opcode.IGET_OBJECT, listOf(5, 0), "Lq85;->o:Ly95;"),
        Guard(97, Opcode.NEW_INSTANCE, listOf(6), "Lh85;"),
        Guard(98, Opcode.INVOKE_DIRECT, listOf(6, 0, 4), "Lh85;-><init>(Lq85;Ljava/lang/String;)V"),
        Guard(100, Opcode.INVOKE_STATIC, emptyList(), "Lfb8;->a()Lfb8;"),
    ), listOf(Edit(92, "goto", target = 100))),
    MethodPlan("$SERVICE->onStartCommand(Landroid/content/Intent;II)I", 41, 796, listOf(
        Guard(629, Opcode.SGET_OBJECT, listOf(0), "Ldyj;->a:Ldyj;"),
        Guard(635, Opcode.IGET_OBJECT, listOf(3, 3), "Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;"),
        Guard(636, Opcode.IF_EQZ, listOf(3), target = 690),
        Guard(690, Opcode.INVOKE_VIRTUAL, listOf(0, 1), "Ldyj;->m(Landroid/content/Context;)V"),
    ), listOf(Edit(636, "goto", target = 690))),
)
