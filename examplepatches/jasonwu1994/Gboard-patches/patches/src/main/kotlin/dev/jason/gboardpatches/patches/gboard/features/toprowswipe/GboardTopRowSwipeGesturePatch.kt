package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle.installZhuyinToggleOfiHelpers
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

internal val TOP_ROW_SWIPE_GESTURE_OWNER_DELEGATE = """
    invoke-direct/range {p0 .. p13}, Lofi;->jasondevDispatchWithTopRow(Lofk;Lnxi;Lnyf;Loaa;JZZIZJI)V

    return-void
""".trimIndent()

internal val gboardTopRowSwipeGesturePatch = bytecodePatch(
    description = "在 gesture dispatch 前 consume armed top-row swipe，並阻擋 stale custom metadata dispatch。"
) {
    execute {
        installOfiHelpers()
        val mutableMethod = findMutableMethodOrThrow(
            classType = TOP_ROW_SWIPE_GESTURE_DISPATCHER_CLASS,
            name = "f",
            returnType = "V",
            parameterTypes = listOf("Lofk;", "Lnxi;", "Lnyf;", "Loaa;", "J", "Z", "Z", "I", "Z", "J", "I")
        )
        mutableMethod.addInstructions(0, TOP_ROW_SWIPE_GESTURE_OWNER_DELEGATE)
    }
}

context(context: BytecodePatchContext)
private fun installOfiHelpers() = with(context) {
    installZhuyinToggleOfiHelpers()
    addHelperMethodIfMissing(
        classType = TOP_ROW_SWIPE_GESTURE_DISPATCHER_CLASS,
        name = "jasondevDispatchWithTopRow",
        parameterTypes = listOf("Lofk;", "Lnxi;", "Lnyf;", "Loaa;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        registerCount = 15,
        body = TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY
    )
}

internal val TOP_ROW_SWIPE_DISPATCH_WITH_TOP_ROW_BODY = """
    invoke-static {p0, p1, p2, p4}, $TOP_ROW_SWIPE_RUNTIME_CLASS->maybeConsumeTopRowSwipe(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_return

    invoke-static {p0, p1, p2, p3, p4}, $TOP_ROW_SWIPE_RUNTIME_CLASS->maybeConsumeQuickJsTopRowPress(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_dispatch_or_toggle

    :cond_return
    return-void

    :cond_dispatch_or_toggle
    invoke-direct/range {p0 .. p13}, Lofi;->jasondevDispatchOrToggle(Lofk;Lnxi;Lnyf;Loaa;JZZIZJI)V

    return-void
""".trimIndent()
