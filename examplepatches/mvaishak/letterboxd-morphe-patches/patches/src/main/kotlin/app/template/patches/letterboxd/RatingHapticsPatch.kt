package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val LISTENER = "Lcom/letterboxd/letterboxd/ui/interaction/StarRatingTouchListener;"
private const val HAPTICS = "Lapp/template/extension/RatingHaptics;"

private val ratingTouch = Fingerprint(
    definingClass = LISTENER,
    name = "onTouch",
    returnType = "Z",
    parameters = listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
)

private val ratingStep = Fingerprint(
    definingClass = LISTENER,
    name = "updateDisplayedStarRating",
    returnType = "V",
    parameters = listOf("J"),
)

@Suppress("unused")
val ratingHapticsPatch = bytecodePatch(
    name = "Rating slider haptics",
    description = "Feel a light tick at each half-star step as you drag the rating slider.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "Letterboxd",
            packageName = "com.letterboxd.letterboxd",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.6.7")),
        ),
    )
    dependsOn(modSettingsPatch)
    execute {
        ratingTouch.method.addInstruction(
            0, "invoke-static {p0, p1, p2}, $HAPTICS->onTouch(Ljava/lang/Object;Landroid/view/View;Landroid/view/MotionEvent;)V",
        )
        ratingStep.method.addInstruction(0, "invoke-static {p0, p1, p2}, $HAPTICS->onStep(Ljava/lang/Object;J)V")
    }
}
