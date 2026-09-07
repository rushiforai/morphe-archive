package app.aimal.patches.viki

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Injection points, verified against Viki 26.5.0 (versionCode 78800).
 *
 * Viki obfuscates almost everything - the session manager is `Lu20/h0;`, the
 * video fragment is `Lcom/viki/android/video/j;` - but two kinds of name
 * survive and both are used here:
 *
 *  * the `com.viki.library.beans` model classes, because they are
 *    kotlinx.serialization types matched against the API's JSON, and
 *  * string literals, which R8 never rewrites.
 *
 * Nothing here matches on an obfuscated name.
 */

/**
 * True if [method] reads the named constant of `com.viki.library.beans.Features`.
 *
 * The entitlement checks this bundle cares about are one-line Kotlin functions
 * of the shape `fun hasNoAds() = hasFeature(Features.noads)`, so the constant
 * they read *is* their identity. Matching on that rather than on a method name
 * is what makes these fingerprints survive obfuscation.
 */
private fun readsFeature(method: Method, name: String): Boolean =
    method.implementation?.instructions?.any { instruction ->
        instruction.opcode == Opcode.SGET_OBJECT &&
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                field.definingClass == VIKI_FEATURES && field.name == name
            } == true
    } == true

/**
 * `SessionManagerImpl.hasNoAdsFeature()` - `Lu20/h0;->h()Z` in 26.5.0.
 *
 * This is the single most valuable hook in the app, because *both* ad systems
 * consult it:
 *
 *  * the video-ad path, through `GetShowAdsUseCase`, and
 *  * the Google Ad Manager banner path, which computes its "should I show
 *    banners" flag as literally `!sessionManager.hasNoAdsFeature()`.
 *
 * A scan of 26.5.0 found exactly one no-argument boolean method in the whole
 * app that reads `Features.noads`, so this cannot collide.
 */
internal object SessionManagerHasNoAdsFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    custom = { method, _ -> readsFeature(method, "noads") },
)

/*
 * There was a `SessionManagerHasHdFingerprint` here, forcing
 * `SessionManagerImpl.hasHdFeature()` (`Lu20/h0;->o()Z`) true to unlock the
 * "High" entry of the video-quality enum. It was removed in v1.1.0-dev.9,
 * because it changed the label and nothing else.
 *
 * The rendition ladder is built entirely server-side. The client has no say in
 * it: `v5/playback_streams/{video_id}.json` takes no quality parameter, its
 * `drms` argument is the constant "dt3" (`SupportedDrm` has a single entry), the
 * stream is always `main[0]`, and the player factory sets no maximum height or
 * bitrate on the track selector. Forcing the entitlement only convinces the app
 * it is entitled - the server still builds the manifest from its own record of
 * the account, so the picture stays SD.
 *
 * Do not add this back. The only remaining lever would be spoofing the device's
 * Widevine security level, which is DRM circumvention and would fail anyway.
 */

/**
 * `VideoFragment.shouldShowAds()` - `Lcom/viki/android/video/j;->h0()Z` in 26.5.0.
 *
 * The inlined body of `GetShowAdsUseCase`: it returns false for clips and
 * trailers, false for anyone holding the no-ads entitlement, false for an
 * entitled TVOD rental, and true otherwise.
 *
 * It is the real switch for video advertising. Everything downstream sits
 * behind it - the IMA ads loader is only attached when it returns true, and so
 * is the coroutine that fetches the VAST ad tag, which is why forcing it false
 * also stops the ad request and the Amazon header-bidding call from ever
 * leaving the device.
 *
 * Matched on the three string literals its own logic is built from. "clip" and
 * "trailer" are content types that cannot change while the rule exists, and
 * "getShowAdsUseCase" is the Kotlin `lateinit` property name, which R8 keeps
 * because the not-initialised error message needs it.
 */
internal object VideoFragmentShouldShowAdsFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("clip"),
        string("trailer"),
        string("getShowAdsUseCase"),
    ),
)

/**
 * `VideoActivity.updatePanels()` - `g()V` in 26.5.0.
 *
 * The activity's panel-visibility pass. It decides whether the bottom panel
 * (phone layout) and the side panel (tablet layout) are shown, and it is called
 * from `onConfigurationChanged`, so it runs again every time the device is
 * folded or unfolded.
 *
 * `VideoActivity` is named in the app manifest and so cannot be obfuscated,
 * which leaves only the method to identify. It is matched on the two view-name
 * strings its own `checkNotNullExpressionValue` calls carry. One other method
 * in the class carries both, but it takes a boolean - so requiring no
 * parameters picks this one out on its own, which was verified against the dex.
 */
internal object VideoActivityUpdatePanelsFingerprint : Fingerprint(
    definingClass = "Lcom/viki/android/video/VideoActivity;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("bottomPanel"),
        string("rightPanel"),
    ),
)

/**
 * Viki's Application, which declares its own `onCreate`.
 *
 * Used by the shared playback-controls patch to hand the extension a context
 * before any screen exists. The class name is named in the app manifest, so it
 * cannot be obfuscated.
 */
internal object VikiApplicationFingerprint : Fingerprint(
    definingClass = "Lcom/viki/android/VikiApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/**
 * `AdsViewModel$getAdSetting$2.invokeSuspend` - `Le20/a;` in 26.5.0.
 *
 * Builds the VAST ad tag URL for Viki's Google Ad Manager network and returns
 * the `AdProvider` that the player then wires into media3's local ad
 * insertion.
 *
 * This is belt-and-braces only: [VideoFragmentShouldShowAdsFingerprint] already
 * prevents this from being reached. It is matched on the hardcoded GAM ad unit,
 * which is the one piece of data this coroutine cannot exist without, and
 * [removeAdsPatch] treats a miss as a no-op rather than a failure - so if Viki
 * ever changes its ad unit the patch still applies and still removes ads.
 */
internal object AdsViewModelGetAdSettingFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("/50449293/Video.Mobile/Android"),
    ),
)
