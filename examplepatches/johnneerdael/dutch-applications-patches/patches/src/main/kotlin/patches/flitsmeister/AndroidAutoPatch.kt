package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/** Exact 14.17 local eligibility operations; genuine providers remain called. */
internal val androidAutoFeatures = bytecodePatch {
    dependsOn(originalInput)
    execute { applyPlans(listOf(
    MethodPlan("Lyb2;->onClick()V", 5, 72, listOf(
            Guard(5, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(6, Opcode.MOVE_RESULT, listOf(0)),
            Guard(7, Opcode.CONST_4, listOf(1)),
            Guard(8, Opcode.IF_EQZ, listOf(0), null, 30)
        ), listOf(
            Edit(7, "insert", "const/16 v0, 0x1")
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1)),
    MethodPlan("Lac2;->d(Lvn4;)Ljava/lang/Object;", 8, 85, listOf(
            Guard(41, Opcode.INVOKE_VIRTUAL, listOf(4), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
            Guard(42, Opcode.IGET_OBJECT, listOf(5, 6), "Lac2;->a:Lsle;"),
            Guard(43, Opcode.INVOKE_INTERFACE, listOf(5, 4), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(44, Opcode.MOVE_RESULT, listOf(4)),
            Guard(45, Opcode.IF_EQZ, listOf(4), null, 60),
            Guard(46, Opcode.SGET_OBJECT, listOf(7), "Lp37;->a:Loe6;")
        ), listOf(
            Edit(45, "replace", "nop")
        ), mapOf("Ljava/lang/Object;->getClass()Ljava/lang/Class;" to 2, "Lac2;->a:Lsle;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Lp37;->a:Loe6;" to 2)),
    MethodPlan("Lea2;->j()V", 4, 37, listOf(
            Guard(19, Opcode.GOTO, listOf(), null, 27),
            Guard(20, Opcode.IF_NEZ, listOf(0), null, 23),
            Guard(21, Opcode.SGET_OBJECT, listOf(0), "Lmdb;->b:Lmdb;"),
            Guard(22, Opcode.GOTO, listOf(), null, 27),
            Guard(23, Opcode.IF_NEZ, listOf(1), null, 26),
            Guard(24, Opcode.SGET_OBJECT, listOf(0), "Lmdb;->c:Lmdb;")
        ), listOf(
            Edit(23, "goto", "", 26)
        ), mapOf("Lmdb;->b:Lmdb;" to 1, "Lmdb;->c:Lmdb;" to 1))
    )) }
}

/** Both named controls reference the same dependency object, so overlap applies once. */
internal val androidAutoNotices = bytecodePatch {
    dependsOn(originalInput)
    execute { applyPlans(listOf(
    MethodPlan("Lfb2;->onCreate(Landroidx/lifecycle/LifecycleOwner;)V", 20, 206, listOf(
            Guard(8, Opcode.IGET_OBJECT, listOf(3, 0), "Lfb2;->q:Lsle;"),
            Guard(9, Opcode.INVOKE_INTERFACE, listOf(3, 2), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(10, Opcode.MOVE_RESULT, listOf(2)),
            Guard(11, Opcode.CONST_STRING, listOf(3)),
            Guard(12, Opcode.IF_NEZ, listOf(2), null, 25),
            Guard(13, Opcode.INVOKE_VIRTUAL, listOf(0), "Landroidx/car/app/Screen;->getCarContext()Landroidx/car/app/CarContext;")
        ), listOf(
            Edit(12, "goto", "", 25)
        ), mapOf("Lfb2;->q:Lsle;" to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1, "Landroidx/car/app/Screen;->getCarContext()Landroidx/car/app/CarContext;" to 12)),
    MethodPlan("Lfb2;->onGetTemplate()Landroidx/car/app/model/Template;", 9, 298, listOf(
            Guard(10, Opcode.INVOKE_INTERFACE, listOf(3, 2), "Lsle;->b(Landroid/content/Context;)Z"),
            Guard(11, Opcode.MOVE_RESULT, listOf(2)),
            Guard(12, Opcode.IGET_OBJECT, listOf(3, 8), "Lfb2;->Z:Lgoi;"),
            Guard(13, Opcode.CONST_4, listOf(4)),
            Guard(14, Opcode.IF_NEZ, listOf(2), null, 34),
            Guard(15, Opcode.NEW_INSTANCE, listOf(2), "Landroidx/car/app/model/Action\$Builder;")
        ), listOf(
            Edit(14, "goto", "", 34)
        ), mapOf("Lsle;->b(Landroid/content/Context;)Z" to 1, "Lfb2;->Z:Lgoi;" to 1, "Landroidx/car/app/model/Action\$Builder;" to 9))
    )) }
}
