package semicoloncolonel.mobilestream.patches.reuters.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.reuters.shared.ArticleRenderer
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// Reuters 7.51.0.
//
//   SubscribeButton,              the Subscribe button in the header and the
//   useEnableSubscribeButton      pull-up it opens. The button's remote switch
//                                 (enable_today_subscribe) also answers false.
//   PreferenceCard,               the "Turn on notifications" and topic cards
//   TopicEngagementBlock          placed inside articles.
//   NewsletterArticleCard,        the newsletter sign-ups inside articles. The
//   NewsletterCard                NewsletterCard that subscribes (it loads
//                                 SUBSCRIBE_TO_NEWSLETTERS) is changed; the one
//                                 in the newsletter settings list is not.
//   parseArticleNotificationData  the notification block at the end of an
//                                 article, now always absent.
//   parseArticleDetail            the newsletter list at the end of an article
//                                 is dropped (config.newsletters reads as off),
//                                 and the newsletter card is not copied.
//
//   SignInCard                    the sign-in card in Menu and Settings. Its
//                                 read of isInSubsCountryAtom now gives false,
//                                 so it shows only the Sign in button, as it
//                                 does where Reuters sells no subscription.
//   useSignInBannerTitle          the card's headline, now null, so the card
//                                 has no title, and ActionCard leaves out its
//                                 empty text container.
//   Settings list                 the Subscription row.
//   Breakingviews banner          the "breaking-views" promo in the Today and
//                                 section feeds and in topic feeds: the jsx
//                                 call that renders it becomes LoadConstNull.
//   Braze in-app messages         marketing pop-ups. Braze's default listener
//                                 now discards each message; Braze still
//                                 delivers push alerts.
//
// The cards render nothing, and in articles the preference, newsletter, and
// topic-engagement elements are dropped from the renderer, so their empty
// containers leave no gap (ArticleRenderer). Topic tags and Read next stay.

private const val VERSION = 96

private fun ByteArray.of(vararg values: Int) = values.map { it.toByte() }.toByteArray()

private const val IN_APP_OPERATION = "Lcom/braze/ui/inappmessage/InAppMessageOperation;"

internal object BrazeBeforeInAppMessageDisplayedFingerprint : Fingerprint(
    definingClass = "Lcom/braze/ui/inappmessage/listeners/DefaultInAppMessageManagerListener;",
    name = "beforeInAppMessageDisplayed",
    returnType = IN_APP_OPERATION,
)

private val discardBrazeMessagesPatch = bytecodePatch {
    execute {
        BrazeBeforeInAppMessageDisplayedFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $IN_APP_OPERATION->DISCARD:$IN_APP_OPERATION
                return-object v0
            """,
        )
    }
}

// The Breakingviews banner branch: LoadConstString "breaking-views",
// PutNewOwnById "variant", CreateClosure onPress, PutNewOwnByIdShort
// "onPress", then Call3 jsx and Ret. Only the Call3 changes, to three
// LoadConstNull into its result register.
private fun bannerEdit(prefix: List<Int>, register: Int, jsx: List<Int>) =
    byteArrayOf().of(*(prefix + listOf(84, register) + jsx + listOf(92, register)).toIntArray()) to
        byteArrayOf().of(*(prefix + listOf(119, register, 119, register, 119, register, 92, register)).toIntArray())

@Suppress("unused")
val hidePromotionsPatch = rawResourcePatch(
    name = "Hide promotions",
    description = "Removes the Subscribe buttons and offers, the Subscription row in Settings, the Breakingviews " +
        "promo banners, marketing pop-ups, and the newsletter sign-ups and notification prompts in articles and feeds.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(discardBrazeMessagesPatch)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("SubscribeButton", HermesBundle.Value.NULL)
        bundle.returnAtStart("useEnableSubscribeButton", HermesBundle.Value.FALSE)
        bundle.returnAtStart("PreferenceCard", HermesBundle.Value.NULL)
        bundle.returnAtStart("TopicEngagementBlock", HermesBundle.Value.NULL)
        bundle.returnAtStart("NewsletterArticleCard", HermesBundle.Value.NULL)
        bundle.returnAtStart("NewsletterCard", "SUBSCRIBE_TO_NEWSLETTERS", HermesBundle.Value.NULL)
        bundle.returnAtStart("parseArticleNotificationData", HermesBundle.Value.UNDEFINED)
        ArticleRenderer.drop(bundle, "preference")
        ArticleRenderer.drop(bundle, "newsletter")
        ArticleRenderer.drop(bundle, "topic-engagement")

        val article = listOf("parseArticleNotificationData")
        // GetById r14, r10, "newsletters"; Neq r16, r14, r4 -> LoadConstFalse r16 (twice),
        // so the following JmpFalse leaves newsletters undefined.
        val newsletters = bundle.stringId("newsletters")
        bundle.replaceInstructions(
            "parseArticleDetail", article, VERSION,
            byteArrayOf().of(55, 14, 10, 44, newsletters and 0xFF, newsletters shr 8, 16, 16, 14, 4),
            byteArrayOf().of(55, 14, 10, 44, newsletters and 0xFF, newsletters shr 8, 121, 16, 121, 16),
        )
        // GetById r3, r1, "newsletterCard" -> LoadConstUndefined r3 (three times).
        val newsletterCard = bundle.stringId("newsletterCard")
        bundle.replaceInstructions(
            "parseArticleDetail", article, VERSION,
            byteArrayOf().of(55, 3, 1, 33, newsletterCard and 0xFF, newsletterCard shr 8),
            byteArrayOf().of(118, 3, 118, 3, 118, 3),
        )
        // GetById <atom>, "isInSubsCountryAtom"; Call2 useAtomValue(<atom>) ->
        // LoadConstFalse plus a no-op Mov, the same length.
        val subsCountry = bundle.stringId("isInSubsCountryAtom")
        val lo = subsCountry and 0xFF
        val hi = subsCountry shr 8
        bundle.replaceInstructions(
            "SignInCard", listOf("isInSubsCountryAtom"), VERSION,
            byteArrayOf().of(55, 1, 1, 11, lo, hi, 83, 19, 2, 3, 1),
            byteArrayOf().of(55, 1, 1, 11, lo, hi, 121, 19, 8, 19, 19),
        )
        // The card's headline ("Get unlimited access..."); the card has no
        // title when this returns null, and the Sign in button stays.
        bundle.returnAtStart("useSignInBannerTitle", HermesBundle.Value.NULL)
        // ActionCard lays its children out in a column with a gap, so its
        // text container leaves a gap above the buttons even when empty. The
        // container is now stored only when r19 is truthy: r19 holds the
        // title, and the subtitle branch overwrites it with truthy values, so
        // it is falsy only when there is neither. The button check tests
        // buttonGroup (r12) directly, instead of through a copy in r5, and
        // without buttons skips the store, which keeps the length.
        //   PutNewOwnByIdShort r5, r13, children; Call3 r5, ...;
        //   PutOwnByIndex r4, r5, 1; Mov r5, r12; JmpFalse +0x43, r5
        // becomes
        //   PutNewOwnByIdShort r5, r13, children; Call3 r5, ...;
        //   JmpFalse +7, r19; PutOwnByIndex r4, r5, 1; JmpFalse +0x47, r12
        bundle.replaceInstructions(
            "ActionCard", listOf("textContainer"), VERSION,
            byteArrayOf().of(0x3f, 5, 13, 0x66, 0x54, 5, 8, 3, 7, 5, 0x44, 4, 5, 1, 8, 5, 12, 0x92, 0x43, 5),
            byteArrayOf().of(0x3f, 5, 13, 0x66, 0x54, 5, 8, 3, 7, 5, 0x92, 7, 19, 0x44, 4, 5, 1, 0x92, 0x47, 12),
        )
        // Settings: the Subscription row is added only when environment
        // slot 23 is set. "JmpTrue +9, r3" becomes "Mov r3, r3", so the list
        // of subscription rows is always empty.
        bundle.replaceInstructionsInAny(
            "", listOf("settingsList", "loggedIn", "subscription", "separator"), VERSION,
            byteArrayOf().of(0x2e, 3, 1, 23, 0x90, 9, 3),
            byteArrayOf().of(0x2e, 3, 1, 23, 8, 3, 3),
        )

        val banners = listOf("breakingviews-promo-banner", "breaking-views")
        // Today and section feeds.
        val (feedFind, feedReplace) = bannerEdit(
            listOf(0x73, 0x0b, 0xcc, 0xaf, 0x40, 0x04, 0x0b, 0x5b, 0x67, 0x64, 0x0b, 0x01, 0xef, 0x7e, 0x3f, 0x04, 0x0b, 0xc9),
            4, listOf(6, 3, 5, 4),
        )
        bundle.replaceInstructions("", banners + "commentary.highlight.click", VERSION, feedFind, feedReplace)
        // Topic feeds.
        val (topicFind, topicReplace) = bannerEdit(
            listOf(0x73, 0x0d, 0xcc, 0xaf, 0x40, 0x05, 0x0d, 0x5b, 0x67, 0x64, 0x0d, 0x09, 0x4d, 0x85, 0x3f, 0x05, 0x0d, 0xc9),
            5, listOf(8, 3, 7, 5),
        )
        bundle.replaceInstructions("", banners + "ExploreLinks", VERSION, topicFind, topicReplace)
        file.writeBytes(bundle.toByteArray())
    }
}
