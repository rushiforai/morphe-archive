package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/** Exact 14.17 local eligibility operations; genuine providers remain called. */
internal val featureSettings = bytecodePatch {
    dependsOn(originalInput)
    execute { applyPlans(listOf(
    MethodPlan("Lgm8;->A(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lwc0;->n:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lwc0;->n:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->D(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->S1:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->S1:Llph;" to 1)),
    MethodPlan("Lgm8;->E(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->p:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->p:Llph;" to 1)),
    MethodPlan("Lgm8;->F(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->W:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->W:Llph;" to 1)),
    MethodPlan("Lgm8;->G(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->D:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->D:Llph;" to 1)),
    MethodPlan("Lgm8;->H(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->s:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->s:Llph;" to 1)),
    MethodPlan("Lgm8;->J(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->K1:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->K1:Llph;" to 1)),
    MethodPlan("Lgm8;->K(Landroid/content/Context;)Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;", 4, 23, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(2, 3), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(2)),
            Guard(4, Opcode.IF_EQZ, listOf(2), null, 21),
            Guard(5, Opcode.SGET_OBJECT, listOf(2), "Lkph;->f:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->f:Llph;" to 1)),
    MethodPlan("Lgm8;->L(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->x:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->x:Llph;" to 1)),
    MethodPlan("Lgm8;->M(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->a:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->a:Llph;" to 1)),
    MethodPlan("Lgm8;->O(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->A:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->A:Llph;" to 1)),
    MethodPlan("Lgm8;->P(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->u1:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->u1:Llph;" to 1)),
    MethodPlan("Lgm8;->Q(Landroid/content/Context;)Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;", 4, 23, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(2, 3), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(2)),
            Guard(4, Opcode.IF_EQZ, listOf(2), null, 21),
            Guard(5, Opcode.SGET_OBJECT, listOf(2), "Lkph;->c:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->c:Llph;" to 1)),
    MethodPlan("Lgm8;->R(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->B:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->B:Llph;" to 1)),
    MethodPlan("Lgm8;->S(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->K:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->K:Llph;" to 1)),
    MethodPlan("Lgm8;->T(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->s1:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->s1:Llph;" to 1)),
    MethodPlan("Lgm8;->U(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->E:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->E:Llph;" to 1)),
    MethodPlan("Lgm8;->W(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->f0:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->f0:Llph;" to 1)),
    MethodPlan("Lgm8;->X(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->u0:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->u0:Llph;" to 1)),
    MethodPlan("Lgm8;->Y(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->x0:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->x0:Llph;" to 1)),
    MethodPlan("Lgm8;->Z(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lwc0;->P:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lwc0;->P:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->a(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->M:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->M:Llph;" to 1)),
    MethodPlan("Lgm8;->a0(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lwc0;->z:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lwc0;->z:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->b(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->X:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->X:Llph;" to 1)),
    MethodPlan("Lgm8;->c(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->n:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->n:Llph;" to 1)),
    MethodPlan("Lgm8;->c0(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->I0:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->I0:Llph;" to 1)),
    MethodPlan("Lgm8;->d(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->Y:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->Y:Llph;" to 1)),
    MethodPlan("Lgm8;->e(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->O:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->O:Llph;" to 1)),
    MethodPlan("Lgm8;->f(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lwc0;->s:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lwc0;->s:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->g(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->R:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->R:Llph;" to 1)),
    MethodPlan("Lgm8;->h(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->T1:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->T1:Llph;" to 1)),
    MethodPlan("Lgm8;->i(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->I:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->I:Llph;" to 1)),
    MethodPlan("Lgm8;->j(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->U:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->U:Llph;" to 1)),
    MethodPlan("Lgm8;->k(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->C:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->C:Llph;" to 1)),
    MethodPlan("Lgm8;->l(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lb38;->U1:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lb38;->U1:Llph;" to 1)),
    MethodPlan("Lgm8;->n(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->J:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->J:Llph;" to 1)),
    MethodPlan("Lgm8;->o(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->Q:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->Q:Llph;" to 1)),
    MethodPlan("Lgm8;->p(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->H:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->H:Llph;" to 1)),
    MethodPlan("Lgm8;->q(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->t:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->t:Llph;" to 1)),
    MethodPlan("Lgm8;->r(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->z:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->z:Llph;" to 1)),
    MethodPlan("Lgm8;->s(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->P:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->P:Llph;" to 1)),
    MethodPlan("Lgm8;->t(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->S:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->S:Llph;" to 1)),
    MethodPlan("Lgm8;->u(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->r:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->r:Llph;" to 1)),
    MethodPlan("Lgm8;->v(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->T:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->T:Llph;" to 1)),
    MethodPlan("Lgm8;->w(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->q:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->q:Llph;" to 1)),
    MethodPlan("Lgm8;->x(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lwc0;->t:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lwc0;->t:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->y(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->V:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->V:Llph;" to 1)),
    MethodPlan("Lgm8;->z(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lkph;->N:Llph;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lkph;->N:Llph;" to 1)),
    MethodPlan("Lam8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lam8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lam8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lijf;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lam8;->a:Z" to 1, "Lam8;->b:Z" to 1, "Lijf;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lbm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lbm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lbm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lijf;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lbm8;->a:Z" to 1, "Lbm8;->b:Z" to 1, "Lijf;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lcm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lcm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lcm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lijf;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lcm8;->a:Z" to 1, "Lcm8;->b:Z" to 1, "Lijf;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Ldm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Ldm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Ldm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lijf;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Ldm8;->a:Z" to 1, "Ldm8;->b:Z" to 1, "Lijf;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lem8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lem8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lem8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lijf;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lem8;->a:Z" to 1, "Lem8;->b:Z" to 1, "Lijf;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lfm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lfm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lfm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lijf;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lfm8;->a:Z" to 1, "Lfm8;->b:Z" to 1, "Lijf;->b(Ljava/lang/Object;)V" to 1))
    )) }
}
