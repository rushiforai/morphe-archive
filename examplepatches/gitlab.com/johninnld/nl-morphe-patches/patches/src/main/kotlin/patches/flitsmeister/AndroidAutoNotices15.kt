package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Separately guarded15.0 operations derived from the publisher artifact. */
internal fun androidAutoNotices15Plans() = listOf(
    MethodPlan("Lxa2;->onCreate(Landroidx/lifecycle/LifecycleOwner;)V", 20, 208, listOf(
        Guard(8, Opcode.IGET_OBJECT, listOf(3, 0), "Lxa2;->q:Laqe;"),
        Guard(9, Opcode.INVOKE_INTERFACE, listOf(3, 2), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(10, Opcode.MOVE_RESULT, listOf(2)),
        Guard(11, Opcode.CONST_STRING, listOf(3)),
        Guard(12, Opcode.IF_NEZ, listOf(2), null, 25),
        Guard(13, Opcode.INVOKE_VIRTUAL, listOf(0), "Landroidx/car/app/Screen;->getCarContext()Landroidx/car/app/CarContext;")
    ), listOf(
        Edit(12, "goto", "", 25)
    ), mapOf("Lxa2;->q:Laqe;" to 1, "Laqe;->b(Landroid/content/Context;)Z" to 1, "Landroidx/car/app/Screen;->getCarContext()Landroidx/car/app/CarContext;" to 12)),
    MethodPlan("Lxa2;->onGetTemplate()Landroidx/car/app/model/Template;", 9, 298, listOf(
        Guard(10, Opcode.INVOKE_INTERFACE, listOf(3, 2), "Laqe;->b(Landroid/content/Context;)Z"),
        Guard(11, Opcode.MOVE_RESULT, listOf(2)),
        Guard(12, Opcode.IGET_OBJECT, listOf(3, 8), "Lxa2;->Z:Lfti;"),
        Guard(13, Opcode.CONST_4, listOf(4)),
        Guard(14, Opcode.IF_NEZ, listOf(2), null, 34),
        Guard(15, Opcode.NEW_INSTANCE, listOf(2), "Landroidx/car/app/model/Action\$Builder;")
    ), listOf(
        Edit(14, "goto", "", 34)
    ), mapOf("Laqe;->b(Landroid/content/Context;)Z" to 1, "Lxa2;->Z:Lfti;" to 1, "Landroidx/car/app/model/Action\$Builder;" to 9))
)
