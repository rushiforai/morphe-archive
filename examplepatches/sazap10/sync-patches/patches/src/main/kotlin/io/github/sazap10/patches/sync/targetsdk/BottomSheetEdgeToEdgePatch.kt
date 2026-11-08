package io.github.sazap10.patches.sync.targetsdk

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val BOTTOM_SHEET_BEHAVIOR = "Lcom/google/android/material/bottomsheet/BottomSheetBehavior;"
private const val ANCHORED_SHEETS = "Lio/github/sazap10/extension/sync/AnchoredSheets;"
private const val EDGE_TO_EDGE_CALLBACK = "Lcom/google/android/material/bottomsheet/BottomSheetDialog\$EdgeToEdgeCallback;"

/** BottomSheetBehavior.from(View). Used to resolve the obfuscated CoordinatorLayout.LayoutParams names. */
internal object BottomSheetBehaviorFromFingerprint : Fingerprint(
    definingClass = BOTTOM_SHEET_BEHAVIOR,
    returnType = BOTTOM_SHEET_BEHAVIOR,
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("The view is not associated with BottomSheetBehavior"),
)

/** The OnApplyWindowInsetsListener that BottomSheetDialog installs on the sheet when edge-to-edge is enabled. */
internal object BottomSheetDialogInsetsListenerFingerprint : Fingerprint(
    parameters = listOf("Landroid/view/View;", "L"),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/google/android/material/bottomsheet/BottomSheetDialog$") &&
            method.implementation?.instructions?.any {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == EDGE_TO_EDGE_CALLBACK
            } == true
    },
)

/**
 * Sync shows the sort and "more actions" sheets anchored under the toolbar. For those it removes the
 * BottomSheetBehavior from the sheet's layout params (s9/f.onViewCreated), which leaves the sheet at the top of its
 * CoordinatorLayout.
 *
 * Material 1.9's insets listener builds an EdgeToEdgeCallback, which calls BottomSheetBehavior.from() and throws
 * "The view is not associated with BottomSheetBehavior". At target 33 the listener never received insets: Sync
 * sets an opaque navigation bar color, so Material kept fitsSystemWindows on the sheet's container, which consumed
 * them. From target 35 edge-to-edge is enforced and the navigation bar is transparent, so the insets reach the sheet.
 *
 * The listener now returns the insets unchanged when the sheet has no BottomSheetBehavior, which is what Material
 * would need to do anyway: without a behavior there is no sheet state to follow. Sheets that keep their behavior are
 * unchanged and still get Material's edge-to-edge handling.
 *
 * The same edge-to-edge change moves the dialog content to the top of the screen, so a sheet left at the top of its
 * CoordinatorLayout now covers the toolbar. For sheets without a behavior, the listener also asks [ANCHORED_SHEETS]
 * to set the sheet's top margin to the toolbar's bottom edge, measured in the dialog's coordinate space.
 */
internal val bottomSheetEdgeToEdgePatch = patch(
    description = "Fixes Sync's toolbar-anchored sheets under enforced edge-to-edge.",
) {
    extendWith("extensions/sync.mpe")

    execute {
        val from = BottomSheetBehaviorFromFingerprint.method.implementation!!.instructions.toList()
        val layoutParamsType = from.firstNotNullOfOrNull {
            if (it.opcode != Opcode.CHECK_CAST) null else ((it as ReferenceInstruction).reference as TypeReference).type
        } ?: throw PatchException("CoordinatorLayout.LayoutParams cast not found in BottomSheetBehavior.from()")
        val getBehavior = from.firstNotNullOfOrNull {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.takeIf { it.definingClass == layoutParamsType && it.parameterTypes.isEmpty() }
        } ?: throw PatchException("LayoutParams.getBehavior() not found in BottomSheetBehavior.from()")
        val behaviorType = getBehavior.returnType

        BottomSheetDialogInsetsListenerFingerprint.method.apply {
            // p1 is the sheet view and p2 the insets. v0 and v1 are not live at the start of the method.
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p1 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
                    move-result-object v0
                    instance-of v1, v0, $layoutParamsType
                    if-eqz v1, :no_behavior
                    check-cast v0, $layoutParamsType
                    invoke-virtual { v0 }, $layoutParamsType->${getBehavior.name}()$behaviorType
                    move-result-object v0
                    instance-of v0, v0, $BOTTOM_SHEET_BEHAVIOR
                    if-nez v0, :apply
                    :no_behavior
                    invoke-static { p1 }, $ANCHORED_SHEETS->position(Landroid/view/View;)V
                    return-object p2
                """,
                ExternalLabel("apply", implementation!!.instructions.first()),
            )
        }
    }
}
