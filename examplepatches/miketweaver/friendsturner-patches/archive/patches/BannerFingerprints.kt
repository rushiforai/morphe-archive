package com.morphe.friendsturner.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fingerprints the lambda that builds the AdMob banner shown at the bottom of the screen.
 *
 * The banner is a Compose `AndroidView` whose factory creates the AdView:
 *
 *     new-instance     v0, Lcom/google/android/gms/ads/AdView;
 *     invoke-direct    {v0, v7}, ...AdView;-><init>(Landroid/content/Context;)V   <-- filter 1
 *     sget-object      v7, ...AdSize;->BANNER:...                                 <-- filter 2
 *     invoke-virtual   {v0, v7}, ...BaseAdView;->setAdSize(...)V
 *     invoke-virtual   {v0, v7}, ...BaseAdView;->setAdUnitId(...)V
 *     ... build an AdRequest ...
 *     invoke-virtual   {v0, v7}, ...BaseAdView;->loadAd(...)V                     <-- filter 3
 *     return-object    v0
 *
 * The enclosing class is an R8-merged lambda with an obfuscated name that changes between
 * builds, so it is matched by content instead. Every name used here belongs to the Google
 * Mobile Ads SDK, whose public API survives the app's obfuscator, so this is stable.
 */
object BannerAdFingerprint : Fingerprint(
    filters = listOf(
        methodCall(smali = "Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V"),
        fieldAccess(smali = "Lcom/google/android/gms/ads/AdSize;->BANNER:Lcom/google/android/gms/ads/AdSize;"),
        methodCall(smali = "Lcom/google/android/gms/ads/BaseAdView;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V"),
    ),
    // The Mobile Ads SDK builds banners the same way internally: in 5.15 these filters also
    // matched Lcom/google/android/gms/internal/ads/tl;->a(). Only the app's own factory is
    // wanted, and patching an SDK internal would be both wrong and version-fragile.
    custom = { _, classDef -> !classDef.type.startsWith("Lcom/google/") },
)

/**
 * Fingerprints the conditional that hides the banner ad for sponsors.
 *
 * The banner is not unconditional. The ad-free flag object is loaded once into a register
 * for the sponsor button label, then read again several hundred instructions later to
 * decide whether to emit the banner:
 *
 *     invoke-virtual/range { vFlag }, <ComposeState>;->getValue()Ljava/lang/Object;
 *     check-cast   Ljava/lang/Boolean;
 *     invoke-virtual { v }, Ljava/lang/Boolean;->booleanValue()Z   <-- filter 1
 *     move-result  v                                               <-- filter 2
 *     if-nez       v, :skip_banner                                 <-- filter 3, forced
 *     ... emit the banner ...
 *     invoke-static ... Landroidx/compose/ui/viewinterop/...        <-- filter 4, the anchor
 *
 * Because a second field read never appears, a scan for reads of the flag field finds only
 * the button-label site and makes the banner look ungated. It is not.
 *
 * The anchor matters. `booleanValue` followed by `if-nez` occurs many times in a UI method
 * of several thousand instructions, so the trio alone is not unique. The app makes exactly
 * one call into `androidx.compose.ui.viewinterop` (the `AndroidView` that hosts the
 * banner), and requiring it shortly after pins the match to the right conditional. The
 * package path survives obfuscation even though the class name does not.
 */
object BannerAdSponsorGateFingerprint : Fingerprint(
    definingClass = "Lcom/peter890331/friendsturner/MainActivity;",
    filters = listOf(
        methodCall(smali = "Ljava/lang/Boolean;->booleanValue()Z"),
        opcode(Opcode.MOVE_RESULT, location = InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, location = InstructionLocation.MatchAfterImmediately()),
        methodCall(
            definingClass = "Landroidx/compose/ui/viewinterop/",
            location = InstructionLocation.MatchAfterWithin(BANNER_ANCHOR_DISTANCE),
        ),
    ),
)

/**
 * How far the `AndroidView` anchor may sit after the conditional. Measured at 66
 * instructions in 5.16 and 67 in 5.15; the margin absorbs small layout changes.
 */
private const val BANNER_ANCHOR_DISTANCE = 120
