package semicoloncolonel.mobilestream.patches.viki.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Viki plays video through the AndroidX media3 ExoPlayer IMA extension
// (version 1.11.0 in this build; the ImaAdsLoader/AdTagLoader is obfuscated to
// Lxa;). That extension builds one IMA AdsRequest per content item and calls
// AdsLoader.requestAds(), which loads the VMAP of preroll and midroll ads.
//
// The request is built by media3's ImaUtil.getAdsRequestForAdTagDataSpec
// (obfuscated to Ldh6;->b), the only method in the app that calls IMA's
// AdsRequest.setAdsResponse(String). That method is wrapped in the extension's
// own try/catch for IOException: if building the request throws, media3 marks
// every ad as failed (an AdPlaybackState with no ad groups) and plays the
// content with no breaks. That is the library's designed fallback for an ad
// server that cannot be reached, so making the builder throw removes the ads
// without ever requesting one and without touching any entitlement or Viki
// Pass flag.
//
// IMA renames its internals per SDK version, but AdsRequest.setAdsResponse is
// part of IMA's stable public API (com.google.ads.interactivemedia.v3.api), so
// the builder is matched by the call to it, not by its obfuscated name.
internal object ImaAdsRequestBuilderFingerprint : Fingerprint(
    returnType = "Lcom/google/ads/interactivemedia/v3/api/AdsRequest;",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == "Lcom/google/ads/interactivemedia/v3/api/AdsRequest;" &&
                    ref.name == "setAdsResponse"
            } == true
        } == true
    },
)
