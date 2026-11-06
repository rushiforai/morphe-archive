package app.ayufa.patches.transit.ads

import app.morphe.patcher.Fingerprint

private val CONTEXT_ATTRS = listOf(
    "Landroid/content/Context;",
    "Landroid/util/AttributeSet;"
)
private val CONTEXT_ATTRS_INT = CONTEXT_ATTRS + "I"

private fun constructorFingerprints(
    definingClass: String,
    parameterSets: List<List<String>>
): List<Fingerprint> = parameterSets.map { parameters ->
    Fingerprint(
        definingClass = definingClass,
        name = "<init>",
        returnType = "V",
        parameters = parameters
    )
}

/**
 * Every ad placement view class in the app. The views' load/render
 * methods are R8-obfuscated and differ per screen, but the view
 * classes kept their names and the standard Android view
 * constructor signatures. Verified against Yahoo! Transit 8.5.8.
 */
internal val AD_VIEW_CLASSES = listOf(
    // Each screen's banner / native ad views (transit/ad).
    "Ljp/co/yahoo/android/apps/transit/ad/NaviSearchTopAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/NaviSearchBottomAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/SearchResultListBottomAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/StationAdTopView;",
    "Ljp/co/yahoo/android/apps/transit/ad/StationAdBottomView;",
    "Ljp/co/yahoo/android/apps/transit/ad/DiainfoBottomAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/DiainfoDetailAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/MyPageAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/RailAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/ReservationAdView;",
    // Shared native-ad base views and the infeed variants.
    "Ljp/co/yahoo/android/apps/transit/ad/YdnAdView;",
    "Ljp/co/yahoo/android/apps/transit/ad/YdnAdAutoSizeView;",
    "Ljp/co/yahoo/android/apps/transit/ad/YdnInfeed001ImageSize600View;",
    "Ljp/co/yahoo/android/apps/transit/ad/YdnInfeed002FullWidthImageView;",
    "Ljp/co/yahoo/android/apps/transit/ad/YdnInfeedImageWidth1200View;",
    "Ljp/co/yahoo/android/apps/transit/ad/YdnInfeedImageWidth65View;",
    // Text ads.
    "Ljp/co/yahoo/android/apps/transit/ad/YdaTextLarge;",
    // Full-screen overlay ads (Yahoo ads SDK).
    "Ljp/co/yahoo/android/ads/YJCpfOverlayView;",
    // In-list ad rows on the search result screen.
    "Ljp/co/yahoo/android/apps/transit/ui/view/navi/list/SearchResultListRowAdView;"
)

/**
 * Constructor fingerprints grouped by view class, so patches can
 * work per class without reading fingerprint internals.
 */
internal val adViewConstructorFingerprintsByClass: Map<String, List<Fingerprint>> =
    AD_VIEW_CLASSES.associateWith { definingClass ->
        if (definingClass.endsWith("SearchResultListRowAdView;")) {
            // Search-result rows only expose the 3-argument constructor.
            constructorFingerprints(definingClass, listOf(CONTEXT_ATTRS_INT))
        } else {
            constructorFingerprints(
                definingClass,
                listOf(CONTEXT_ATTRS, CONTEXT_ATTRS_INT)
            )
        }
    }

internal val adViewConstructorFingerprints: List<Fingerprint> =
    adViewConstructorFingerprintsByClass.values.flatten()

/**
 * The ad views share a visibility state machine: a declared
 * setVisibility(<state enum>) method that force-shows the view's
 * inner root and toggles loading / ad / error children whenever
 * the ad state changes. Hiding the view at construction time is
 * not enough, because the state machine revives the slot (an
 * empty ad frame on the search result screen was the visible
 * symptom). Classes without such a method are skipped.
 */
internal val adViewStateMachineFingerprints: List<Fingerprint> =
    AD_VIEW_CLASSES.map { definingClass ->
        Fingerprint(
            definingClass = definingClass,
            name = "setVisibility",
            returnType = "V"
        )
    }

