package semicoloncolonel.mobilestream.patches.dealseek.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// DealSeek 1.64.0 — Hide pop-ups.
//
// DealSeek is an Expo / React Native app, and its screens are Hermes bytecode
// (version 98) in assets/index.android.bundle. Four pop-ups are removed there:
//
//   TrustPilotModal         asks for a review on Trustpilot.
//   AppStoreReviewModal     asks for a review in the Play Store.
//   shouldShowSpinPopup     decides whether the daily "spin the wheel" pop-up
//                           opens on its own; it now always answers no. The
//                           wheel itself is left in place.
//   present (the one that   opens the deal feedback survey when you come back
//   logs "deal_feedback_    from a store after opening a deal. It now does
//   modal_shown")           nothing.
//
// The two review modals render nothing, and the other two return at once.
//
// Expo checks for a new JavaScript bundle on every launch and would replace
// the patched one, so Expo updates are turned off in the manifest. The app
// then always runs the JavaScript that shipped with 1.64.0.
// ─────────────────────────────────────────────────────────────────────────────

private val hidePopupsInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("TrustPilotModal", HermesBundle.Value.NULL)
        bundle.returnAtStart("AppStoreReviewModal", HermesBundle.Value.NULL)
        bundle.returnAtStart("shouldShowSpinPopup", HermesBundle.Value.FALSE)
        bundle.returnAtStart("present", "deal_feedback_modal_shown", HermesBundle.Value.UNDEFINED)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hidePopupsPatch = resourcePatch(
    name = "Hide pop-ups",
    description = "Removes the review requests, the daily spin-the-wheel pop-up, and the survey after opening a deal.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hidePopupsInBundlePatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = application.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val element = metaData.item(i) as? Element ?: continue
                if (element.getAttribute("android:name") == "expo.modules.updates.ENABLED") {
                    element.setAttribute("android:value", "false")
                }
            }
        }
    }
}
