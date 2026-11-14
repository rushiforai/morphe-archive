package semicoloncolonel.mobilestream.patches.walgreens.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.walgreens.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide surveys and rating prompt.
//
// Walgreens 118.0 starts Medallia Digital from WalgreensApp with
// MedalliaDigital.init, which then shows its survey invitations. init now
// returns at once, so Medallia never starts.
//
// The app also has its own "rate the app" dialog on the home screen. Home
// shows it unless AppRatingManager reports that it was shown or declined, so
// the status now always reads as declined.
// ─────────────────────────────────────────────────────────────────────────────

private const val RATING_STATUS = "Lcom/usablenet/mobile/walgreen/AppRatingManager\$AppRatingDialogStatus;"

internal object MedalliaInitFingerprint : Fingerprint(
    definingClass = "Lcom/medallia/digital/mobilesdk/MedalliaDigital;",
    name = "init",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
)

internal object RatingDialogStatusFingerprint : Fingerprint(
    definingClass = "Lcom/usablenet/mobile/walgreen/AppRatingManager;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    returnType = RATING_STATUS,
)

@Suppress("unused")
val hideSurveysPatch = bytecodePatch(
    name = "Hide surveys and rating prompt",
    description = "Stops Medallia survey invitations and the \"rate the app\" dialog on the home screen.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        MedalliaInitFingerprint.method.returnEarly("return-void")

        RatingDialogStatusFingerprint.method.returnEarly(
            """
                sget-object v0, $RATING_STATUS->NO_THANKS:$RATING_STATUS
                return-object v0
            """.trimIndent(),
        )
    }
}
