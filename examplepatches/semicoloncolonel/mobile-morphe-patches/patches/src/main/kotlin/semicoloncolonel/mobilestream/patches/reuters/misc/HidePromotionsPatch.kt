package semicoloncolonel.mobilestream.patches.reuters.misc

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.reuters.shared.ArticleRenderer
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
        if (!isOptionOn(hidePromptsAndPopupsPatch, "promotions")) return@execute
        BrazeBeforeInAppMessageDisplayedFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $IN_APP_OPERATION->DISCARD:$IN_APP_OPERATION
                return-object v0
            """,
        )
    }
}

// Part of hidePromptsAndPopupsPatch: runs only when its "promotions" option is on.
internal val hidePromotionsPatch = rawResourcePatch {
    dependsOn(discardBrazeMessagesPatch)

    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "promotions")) return@execute
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
        // GetById r14, r10, <cache>, "newsletters"; Neq r16, r14, r4 -> the Neq
        // becomes LoadConstFalse r16 (twice), so the following JmpFalse leaves
        // newsletters undefined. The property-cache slot moves between versions,
        // so it is wildcarded; the registers and the "newsletters" id pin it.
        val newsletters = bundle.stringId("newsletters")
        bundle.replaceMaskedInstructions(
            "parseArticleDetail", article, VERSION,
            intArrayOf(55, 14, 10, -1, newsletters and 0xFF, newsletters shr 8, 16, 16, 14, 4),
            intArrayOf(-1, -1, -1, -1, -1, -1, 121, 16, 121, 16),
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
        // The "children" short id moves between versions, so it is wildcarded.
        bundle.replaceMaskedInstructions(
            "ActionCard", listOf("textContainer"), VERSION,
            intArrayOf(0x3f, 5, 13, -1, 0x54, 5, 8, 3, 7, 5, 0x44, 4, 5, 1, 8, 5, 12, 0x92, 0x43, 5),
            intArrayOf(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0x92, 7, 19, 0x44, 4, 5, 1, 0x92, 0x47, 12),
        )
        // Settings: the Subscription row is added only when environment
        // slot 23 is set. "JmpTrue +9, r3" becomes "Mov r3, r3", so the list
        // of subscription rows is always empty.
        bundle.replaceInstructionsInAny(
            "", listOf("settingsList", "loggedIn", "subscription", "separator"), VERSION,
            byteArrayOf().of(0x2e, 3, 1, 23, 0x90, 9, 3),
            byteArrayOf().of(0x2e, 3, 1, 23, 8, 3, 3),
        )

        // The Breakingviews banner branch loads "breaking-views", builds the
        // variant object with an onPress closure, then renders it:
        //   LoadConstString rX, "breaking-views"; GetByIdShort; CreateClosure
        //   onPress; PutNewOwnByIdShort rX, onPress; Call3 rX, jsx; Ret rX
        // The Call3 becomes three LoadConstNull into its result register, so the
        // branch returns null and the banner does not render. The string ids,
        // cache slot, closure id, and short id move between versions and are
        // wildcarded; the opcodes, registers, and the Call and Ret are the
        // stable anchor.
        val banners = listOf("breakingviews-promo-banner", "breaking-views")
        // Today and section feeds (jsx call and return in r4).
        bundle.replaceMaskedInstructions(
            "", banners + "commentary.highlight.click", VERSION,
            intArrayOf(
                0x73, 0x0b, -1, -1, 0x40, 0x04, 0x0b, -1, -1, 0x64, 0x0b, 0x01, -1, -1,
                0x3f, 0x04, 0x0b, -1, 0x54, 0x04, 0x06, 0x03, 0x05, 0x04, 0x5c, 0x04,
            ),
            intArrayOf(
                -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
                -1, -1, -1, -1, 0x77, 0x04, 0x77, 0x04, 0x77, 0x04, -1, -1,
            ),
        )
        // Topic feeds (jsx call and return in r5).
        bundle.replaceMaskedInstructions(
            "", banners + "ExploreLinks", VERSION,
            intArrayOf(
                0x73, 0x0d, -1, -1, 0x40, 0x05, 0x0d, -1, -1, 0x64, 0x0d, 0x09, -1, -1,
                0x3f, 0x05, 0x0d, -1, 0x54, 0x05, 0x08, 0x03, 0x07, 0x05, 0x5c, 0x05,
            ),
            intArrayOf(
                -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
                -1, -1, -1, -1, 0x77, 0x05, 0x77, 0x05, 0x77, 0x05, -1, -1,
            ),
        )
        file.writeBytes(bundle.toByteArray())
    }
}
