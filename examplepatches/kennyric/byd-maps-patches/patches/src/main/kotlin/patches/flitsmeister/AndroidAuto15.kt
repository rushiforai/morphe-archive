package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Separately guarded15.0 operations derived from the publisher artifact. */
internal fun androidAutoFeatures15Plans() = listOf(
    MethodPlan("Lsb2;->onClick()V", 5, 72, listOf(
        Guard(5, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(6, Opcode.MOVE_RESULT, listOf(0)),
        Guard(7, Opcode.CONST_4, listOf(1)),
        Guard(8, Opcode.IF_EQZ, listOf(0), null, 30)
    ), listOf(
        Edit(7, "insert", "const/16 v0, 0x1")
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lub2;->d(Lun4;)Ljava/lang/Object;", 8, 85, listOf(
        Guard(41, Opcode.INVOKE_VIRTUAL, listOf(4), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(42, Opcode.IGET_OBJECT, listOf(5, 6), "Lub2;->a:Laqe;"),
        Guard(43, Opcode.INVOKE_INTERFACE, listOf(5, 4), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(44, Opcode.MOVE_RESULT, listOf(4)),
        Guard(45, Opcode.IF_EQZ, listOf(4), null, 60),
        Guard(46, Opcode.SGET_OBJECT, listOf(7), "Ln37;->a:Lre6;")
    ), listOf(
        Edit(45, "replace", "nop")
    ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 2, "Lub2;->a:Laqe;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Ln37;->a:Lre6;" to 2)),
    MethodPlan("Laa2;->l()V", 4, 37, listOf(
        Guard(19, Opcode.GOTO, listOf(), null, 27),
        Guard(20, Opcode.IF_NEZ, listOf(0), null, 23),
        Guard(21, Opcode.SGET_OBJECT, listOf(0), "Lkeb;->b:Lkeb;"),
        Guard(22, Opcode.GOTO, listOf(), null, 27),
        Guard(23, Opcode.IF_NEZ, listOf(1), null, 26),
        Guard(24, Opcode.SGET_OBJECT, listOf(0), "Lkeb;->c:Lkeb;")
    ), listOf(
        Edit(23, "goto", "", 26)
    ), mapOf("Lkeb;->b:Lkeb;" to 1, "Lkeb;->c:Lkeb;" to 1))
)
