package app.template.patches.samsungkeyboard.controls

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch

@Suppress("unused")
val swipeDownToDismissPatch = samsungKeyboardControls.featurePatch(
    HevalFeature(
        id = "samsungkeyboard.swipe_dismiss",
        name = "Swipe down to dismiss",
        description = "Swipe down on the suggestion strip or toolbar to hide the keyboard.",
        category = SamsungKeyboardControlsCategory.TYPING,
        // On once the patch is selected (the patch itself is opt-in in Manager).
        default = true,
    ),
    default = false,
) {
    // Validate both hook sites first, then edit.
    val intercept = KeyboardLayoutInterceptFingerprint.method
    val create = KeyboardServiceCreateFingerprint.method
    intercept.requireLocal()

    // 1. A swipe that starts on the strip hides the keyboard; the extension answers false for every other gesture,
    //    so the stock handling (and typing on the keys) is untouched. p0 is the layout, p1 the event.
    intercept.addInstructionsWithLabelsChecked(
        0,
        """
            invoke-static {p0, p1}, ${SAMSUNG_CONTROLS_PACKAGE}SwipeDismiss;->intercept(Landroid/view/View;Landroid/view/MotionEvent;)Z
            move-result v0
            if-eqz v0, :morphe_stock
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("morphe_stock", intercept.getInstruction(0)),
    )

    // 2. The running service is remembered, the fallback when the view's context cannot be unwrapped to it.
    create.addInstructionsChecked(
        0,
        "invoke-static {p0}, ${SAMSUNG_CONTROLS_PACKAGE}KeyboardService;->set(Landroid/inputmethodservice/InputMethodService;)V",
    )
}
