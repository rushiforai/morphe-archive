package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle.installZhuyinToggleGestureDispatchHelpers
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

private val gestureDispatcherClass = GboardVersionBindings.gestureDispatch.classType
private val gestureDispatchDescriptor = buildString {
    append('(')
    append(GboardVersionBindings.gestureDispatch.parameterTypes.joinToString(""))
    append(')')
    append(GboardVersionBindings.gestureDispatch.returnType)
}

internal val TOP_ROW_SWIPE_GESTURE_OWNER_DELEGATE = """
    invoke-direct/range {p0 .. p13}, $gestureDispatcherClass->jasondevDispatchWithTopRow$gestureDispatchDescriptor

    return-void
""".trimIndent()

internal val gboardTopRowSwipeGesturePatch = bytecodePatch(
    description = "在 gesture dispatch 前 consume armed top-row swipe，並阻擋 stale custom metadata dispatch。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        installGestureDispatchHelpers()
        val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.gestureDispatch)
        mutableMethod.addInstructions(0, TOP_ROW_SWIPE_GESTURE_OWNER_DELEGATE)
    }
}

context(context: BytecodePatchContext)
private fun installGestureDispatchHelpers() = with(context) {
    installZhuyinToggleGestureDispatchHelpers()
    addHelperMethodIfMissing(
        classType = gestureDispatcherClass,
        name = "jasondevDispatchWithTopRow",
        parameterTypes = GboardVersionBindings.gestureDispatch.parameterTypes,
        returnType = GboardVersionBindings.gestureDispatch.returnType,
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
    invoke-direct/range {p0 .. p13}, $gestureDispatcherClass->jasondevDispatchOrToggle$gestureDispatchDescriptor

    return-void
""".trimIndent()
