package app.jaybyte.patches.ifunny.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/** Decides whether a server-provided "extra element" card may be inserted into the feed. */
internal object ExtraElementCriterionFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/extraElements/criterions/ExtraElementCriterion;",
    returnType = "Z",
    parameters = listOf("Lmobi/ifunny/rest/content/extraElements/ExtraElement;"),
    filters = listOf(string("projectItem")),
)

/** Attaches the vertical "Hide ads" tab to an ad frame. */
internal object HideAdsTabAttachFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/ads/hide/PremiumHideAdControllerImpl;",
    returnType = "V",
    parameters = listOf("Lmobi/ifunny/view/FrameLayoutEx;"),
)

/** Whether the "Hide ads" badge is shown on comment ads. */
internal object HideCommentsAdsBadgeFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/comments/nativeads/nativeplacer/entrypoints/HideCommentsAdsEntryControllerImpl;",
    returnType = "Z",
    parameters = listOf("I"),
)

/** Master switch of the "Boost post" upsell experiment. */
internal object BoostUpsellEnabledFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/inapp/boost/BoostPostUpsellCriterion;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(methodCall(name = "isExpEnabled")),
)

/** Visibility of the "Boost post" button in the post bottom bar. */
internal object GalleryBoostButtonFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/gallery_new/criterions/GalleryBoostPostCriterion;",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Boolean;", "Z"),
)

/** Status of the Premium / Trial / LTO entry in the main toolbar. */
internal object MainEntryTitleStatusFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/app/subscription/SubscriptionEntryPointsCriterion;",
    returnType = "Lmobi/ifunny/app/subscription/MainEntryTitleStatus;",
    parameters = listOf("Landroidx/fragment/app/Fragment;", "Z"),
)

/** Status of the Paywall v4 Premium entry point. */
internal object Paywall4EntryStatusFingerprint : Fingerprint(
    definingClass = "Lmobi/ifunny/app/subscription/paywall4/Paywall4MainPremiumEntrypointControllerImpl;",
    returnType = "Lmobi/ifunny/app/subscription/paywall4/Paywall4PremiumEntryStatus;",
    parameters = listOf("Landroidx/fragment/app/Fragment;", "Z"),
)
