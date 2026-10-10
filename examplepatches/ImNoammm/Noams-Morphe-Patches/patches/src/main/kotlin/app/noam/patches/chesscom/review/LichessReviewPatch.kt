package app.noam.patches.chesscom.review

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.upsell.NavigateFingerprint
import app.noam.patches.chesscom.upsell.ShowDialogDirectionFingerprint
import org.w3c.dom.Element

private const val LICHESS_REVIEW = "${Constants.EXTENSION_PACKAGE}/review/LichessReview;"
private const val LICHESS_ACTIVITY = "app.noam.extension.chesscom.review.LichessActivity"
private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private val lichessResourcePatch = resourcePatch(
    description = "Adds the in-app Lichess browser screen.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")
            application.appendChild(
                document.createElement("activity").apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:name", LICHESS_ACTIVITY)
                    setAttributeNS(ANDROID_NAMESPACE, "android:exported", "false")
                    setAttributeNS(ANDROID_NAMESPACE, "android:label", "Lichess")
                    setAttributeNS(ANDROID_NAMESPACE, "android:theme", "@android:style/Theme.Material.NoActionBar")
                    setAttributeNS(
                        ANDROID_NAMESPACE, "android:configChanges",
                        "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden",
                    )
                },
            )
        }
    }
}

/** Lets LichessReview take over a navigation call: `if (method(p1, p2)) return;`. */
private fun MutableMethod.interceptWith(method: String, label: String) = addInstructionsWithLabels(
    0,
    """
        invoke-static/range { p1 .. p2 }, $LICHESS_REVIEW->$method(Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :$label
        return-void
    """,
    ExternalLabel(label, getInstruction(0)),
)

@Suppress("unused")
val lichessReviewPatch = bytecodePatch(
    name = "Review on Lichess",
    description = "Game Review opens your game on Lichess (imported, with Lichess's analysis board) " +
        "in a browser inside the app: always, or only once chess.com's free review is used up.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, lichessResourcePatch)

    execute {
        markFeaturePatched("lichessReviewPatched")

        // navigate(activity, directions) and navigateForResult(activity, directions, launcher):
        // the full-screen Game Review and the Game Review paywall.
        NavigateFingerprint.method.interceptWith("onScreen", "morphe_lichess_screen")
        val router = NavigateFingerprint.classDef
        router.methods.single { method ->
            method.returnType == "V" && method.parameterTypes.size == 3 &&
                method.parameterTypes[0].toString() == "Landroidx/fragment/app/FragmentActivity;" &&
                method.parameterTypes[1].toString() == "Lcom/chess/navigationinterface/NavigationDirections\$WithResult;"
        }.interceptWith("onScreen", "morphe_lichess_result")

        // show(router, direction, fragmentManager): Game Review as a dialog, and the review limit.
        ShowDialogDirectionFingerprint.method.interceptWith("onDialog", "morphe_lichess_dialog")
    }
}
