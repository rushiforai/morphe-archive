package semicoloncolonel.mobilestream.patches.aljazeera.misc

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.aljazeera.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn

// Al Jazeera 12.2.0. The app's own prompts are React Native components in the
// Hermes bundle, and each now renders nothing:
//
//  - CreateAccountCoachMark and AccountTabCoachMark: the "Enrich your Al
//    Jazeera experience by signing in" tip above the tab bar.
//  - Nudge: the cards placed between stories, which ask you to follow a topic
//    ("Stay connected and follow what matters to you"), turn on
//    notifications, or sign up for a newsletter. Nudge picks which card to
//    draw, so the cards stay out of the feed and articles.
//
// Sign-in, the notification switch in settings, and the newsletters page are
// unchanged.

// Part of hidePromptsAndPopupsPatch: runs only when its "promotions" option is on.
private val hidePromotionsPatch = rawResourcePatch {
    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "promotions")) return@execute
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        listOf("CreateAccountCoachMark", "AccountTabCoachMark", "Nudge").forEach {
            bundle.returnAtStart(it, HermesBundle.Value.NULL)
        }
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hidePromptsAndPopupsPatch: BytecodePatch = bytecodePatch(
    name = "Hide prompts and pop-ups",
    description = "Hides the prompts and pop-ups you choose in the patch options.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(hidePromotionsPatch)
    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "rating",
        default = true,
        title = "Rating prompt",
        description = "Stops Google Play's rate-this-app sheet.",
    )
    booleanOption(
        key = "promotions",
        default = true,
        title = "Promotions",
        description = "Removes the sign-in tip above the tab bar and the cards between stories that ask you " +
            "to follow a topic, turn on notifications, or sign up for a newsletter.",
    )

    execute {
        if (isOptionOn(hidePromptsAndPopupsPatch, "rating")) blockPlayReviewSheet()
    }
}
