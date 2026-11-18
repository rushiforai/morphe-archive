package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Exact15.0 publisher operations; retain14.17 declarations separately. */
internal fun featureSettings15Plans() = listOf(
    MethodPlan("Lgm8;->A(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lxc0;->n:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lxc0;->n:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->D(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->R1:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->R1:Ltuh;" to 1)),
    MethodPlan("Lgm8;->E(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->p:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->p:Ltuh;" to 1)),
    MethodPlan("Lgm8;->F(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->W:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->W:Ltuh;" to 1)),
    MethodPlan("Lgm8;->G(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->D:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->D:Ltuh;" to 1)),
    MethodPlan("Lgm8;->H(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->s:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->s:Ltuh;" to 1)),
    MethodPlan("Lgm8;->J(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->J1:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->J1:Ltuh;" to 1)),
    MethodPlan("Lgm8;->K(Landroid/content/Context;)Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;", 4, 23, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(2, 3), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(2)),
            Guard(4, Opcode.IF_EQZ, listOf(2), null, 21),
            Guard(5, Opcode.SGET_OBJECT, listOf(2), "Lsuh;->f:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->f:Ltuh;" to 1)),
    MethodPlan("Lgm8;->L(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->x:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->x:Ltuh;" to 1)),
    MethodPlan("Lgm8;->M(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->a:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->a:Ltuh;" to 1)),
    MethodPlan("Lgm8;->O(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->A:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->A:Ltuh;" to 1)),
    MethodPlan("Lgm8;->P(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->t1:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->t1:Ltuh;" to 1)),
    MethodPlan("Lgm8;->Q(Landroid/content/Context;)Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;", 4, 23, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(2, 3), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(2)),
            Guard(4, Opcode.IF_EQZ, listOf(2), null, 21),
            Guard(5, Opcode.SGET_OBJECT, listOf(2), "Lsuh;->c:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->c:Ltuh;" to 1)),
    MethodPlan("Lgm8;->R(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->B:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->B:Ltuh;" to 1)),
    MethodPlan("Lgm8;->S(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->K:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->K:Ltuh;" to 1)),
    MethodPlan("Lgm8;->T(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->s1:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->s1:Ltuh;" to 1)),
    MethodPlan("Lgm8;->U(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->E:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->E:Ltuh;" to 1)),
    MethodPlan("Lgm8;->W(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->e0:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->e0:Ltuh;" to 1)),
    MethodPlan("Lgm8;->X(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->u0:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->u0:Ltuh;" to 1)),
    MethodPlan("Lgm8;->Y(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->x0:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->x0:Ltuh;" to 1)),
    MethodPlan("Lgm8;->Z(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lxc0;->P:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lxc0;->P:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->a(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->M:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->M:Ltuh;" to 1)),
    MethodPlan("Lgm8;->a0(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lxc0;->z:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lxc0;->z:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->b(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->X:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->X:Ltuh;" to 1)),
    MethodPlan("Lgm8;->c(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->n:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->n:Ltuh;" to 1)),
    MethodPlan("Lgm8;->c0(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->H0:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->H0:Ltuh;" to 1)),
    MethodPlan("Lgm8;->d(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->Y:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->Y:Ltuh;" to 1)),
    MethodPlan("Lgm8;->e(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->O:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->O:Ltuh;" to 1)),
    MethodPlan("Lgm8;->f(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lxc0;->s:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lxc0;->s:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->g(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->R:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->R:Ltuh;" to 1)),
    MethodPlan("Lgm8;->h(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->S1:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->S1:Ltuh;" to 1)),
    MethodPlan("Lgm8;->i(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->I:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->I:Ltuh;" to 1)),
    MethodPlan("Lgm8;->j(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->U:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->U:Ltuh;" to 1)),
    MethodPlan("Lgm8;->k(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->C:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->C:Ltuh;" to 1)),
    MethodPlan("Lgm8;->l(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lt28;->T1:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lt28;->T1:Ltuh;" to 1)),
    MethodPlan("Lgm8;->n(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->J:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->J:Ltuh;" to 1)),
    MethodPlan("Lgm8;->o(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->Q:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->Q:Ltuh;" to 1)),
    MethodPlan("Lgm8;->p(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->H:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->H:Ltuh;" to 1)),
    MethodPlan("Lgm8;->q(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->t:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->t:Ltuh;" to 1)),
    MethodPlan("Lgm8;->r(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->z:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->z:Ltuh;" to 1)),
    MethodPlan("Lgm8;->s(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->P:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->P:Ltuh;" to 1)),
    MethodPlan("Lgm8;->t(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->S:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->S:Ltuh;" to 1)),
    MethodPlan("Lgm8;->u(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->r:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->r:Ltuh;" to 1)),
    MethodPlan("Lgm8;->v(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->T:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->T:Ltuh;" to 1)),
    MethodPlan("Lgm8;->w(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->q:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->q:Ltuh;" to 1)),
    MethodPlan("Lgm8;->x(Landroid/content/Context;)Z", 2, 13, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 11),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lxc0;->t:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lxc0;->t:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;" to 1)),
    MethodPlan("Lgm8;->y(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->V:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->V:Ltuh;" to 1)),
    MethodPlan("Lgm8;->z(Landroid/content/Context;)Z", 2, 11, listOf(
            Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
            Guard(3, Opcode.MOVE_RESULT, listOf(0)),
            Guard(4, Opcode.IF_EQZ, listOf(0), null, 9),
            Guard(5, Opcode.SGET_OBJECT, listOf(0), "Lsuh;->N:Ltuh;")
        ), listOf(
            Edit(4, "insert", "const/16 p0, 0x1")
        ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lsuh;->N:Ltuh;" to 1)),
    MethodPlan("Lam8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lam8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lam8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lhof;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lam8;->a:Z" to 1, "Lam8;->b:Z" to 1, "Lhof;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lbm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lbm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lbm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lhof;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lbm8;->a:Z" to 1, "Lbm8;->b:Z" to 1, "Lhof;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lcm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lcm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lcm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lhof;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lcm8;->a:Z" to 1, "Lcm8;->b:Z" to 1, "Lhof;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Ldm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Ldm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Ldm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lhof;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Ldm8;->a:Z" to 1, "Ldm8;->b:Z" to 1, "Lhof;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lem8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lem8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lem8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lhof;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lem8;->a:Z" to 1, "Lem8;->b:Z" to 1, "Lhof;->b(Ljava/lang/Object;)V" to 1)),
    MethodPlan("Lfm8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 3, 9, listOf(
            Guard(0, Opcode.IGET_BOOLEAN, listOf(0, 1), "Lfm8;->a:Z"),
            Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 1), "Lfm8;->b:Z"),
            Guard(2, Opcode.INVOKE_STATIC, listOf(2), "Lhof;->b(Ljava/lang/Object;)V"),
            Guard(3, Opcode.IF_EQZ, listOf(0), null, 5),
            Guard(4, Opcode.GOTO, listOf(), null, 6)
        ), listOf(
            Edit(3, "replace", "nop")
        ), mapOf("Lfm8;->a:Z" to 1, "Lfm8;->b:Z" to 1, "Lhof;->b(Ljava/lang/Object;)V" to 1))

)
