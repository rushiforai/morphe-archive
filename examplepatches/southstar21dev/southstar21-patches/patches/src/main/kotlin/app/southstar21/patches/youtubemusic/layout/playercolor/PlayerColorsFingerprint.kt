package app.southstar21.patches.youtubemusic.layout.playercolor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The player page controller's method that colors the full player: `(top, bottom, durationMs)`.
 * It animates the page's gradient to the two colors, tints an icon, sets the color that fades in
 * while swiping between songs, and, behind an experiment flag, the scrims. Its class's only
 * private (int, int, long) method; the flag and the tint call pin it down.
 */
internal object PlayerColorsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "I", "J"),
    filters = listOf(
        methodCall(definingClass = "Landroid/widget/ImageView;", name = "setImageTintList"),
        methodCall(definingClass = "Landroid/view/View;", name = "setBackground"),
        literal(45762151L),
    ),
)
