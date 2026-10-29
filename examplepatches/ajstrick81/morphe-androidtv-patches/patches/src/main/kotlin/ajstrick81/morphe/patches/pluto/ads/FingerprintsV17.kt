package ajstrick81.morphe.patches.pluto.ads

import app.morphe.patcher.Fingerprint

// ===========================================================================
// Pluto TV v17.x (Paramount+/AVIA rebuild) — ad-removal fingerprints.
//
// v17 replaced the leanback stack with Paramount's AVIA player (same internals
// as Paramount+ / CBS). media3 and okhttp are R8-minified, but AVIA's OWN classes
// are NOT name-obfuscated, so every anchor below matches AVIA's readable leaf
// class + method name (the hardening pattern proven on the Paramount+ patch).
// See SkipAdsV17Patch.kt for the mechanism and PlutoV17ManifestProbe for the
// manifest surgery. All four confirmed present in 17.2.0 (versionCode 520000962).
// ===========================================================================

// Hook 1 — AviaDAIResourceProvider.shouldPlayAd(AviaAdPod): Z  [required]
//
// The AVIA DAI provider gates each VOD ad pod through shouldPlayAd(); its position
// monitor skips the pod natively when this returns false. Forcing false removes the
// DAI pre-roll while the stream keeps playing. Private, boolean return; matched by
// its (readable, stable) name + Z return + unique leaf class name.
internal object AviaDaiShouldPlayAdFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, _ ->
        method.name == "shouldPlayAd" &&
            method.definingClass.endsWith("/AviaDAIResourceProvider;")
    },
)

// Hook 2 — AviaIMAResourceProvider.shouldPlayAd(AviaAdPod): Z  [optional]
//
// The IMA counterpart of Hook 1. Not all titles route through it, so the patch
// applies it via methodOrNull — a build without this provider simply skips it.
internal object AviaImaShouldPlayAdFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, _ ->
        method.name == "shouldPlayAd" &&
            method.definingClass.endsWith("/AviaIMAResourceProvider;")
    },
)

// Hook 3 — AviaDashParser.parse(Uri, InputStream): <DashManifest>  [required]
//
// The mid-roll ads are stitched into the multi-period DASH manifest (FreeWheel SSAI),
// so emptying ad metadata is not enough — the ad <Period>s must be removed from the
// manifest itself. media3's parser is R8-renamed (can't be hooked by name like
// leanback), so we hook AVIA's OWN un-renamed parse() and swap its InputStream for a
// cleaned one (PlutoV17ManifestProbe.cleanManifestStream) at entry.
//
// parse(Uri, InputStream) is NOT unique — R8 also emits a synthetic bridge with the
// same params returning Ljava/lang/Object;. The custom predicate excludes that bridge
// (returnType != Object) so we anchor the REAL DASH parser (returns the obfuscated
// DashManifest type, whose exact R8 name varies per build and so is never hardcoded).
internal object AviaDashParserParseFingerprint : Fingerprint(
    parameters = listOf(
        "Landroid/net/Uri;",
        "Ljava/io/InputStream;",
    ),
    custom = { method, _ ->
        method.name == "parse" &&
            method.definingClass.endsWith("/AviaDashParser;") &&
            method.returnType != "Ljava/lang/Object;"
    },
)

// Hook 4 — CLID3Processor.processAdPodStartAsync(Map, long): V  [required]
//
// On VOD, the ID3/CLID3 beacon path also fires a CSAI ad call (processAdPodStartAsync),
// which can re-introduce ad fetches independent of the manifest. When Hook 3 has seen a
// static (VOD) manifest, PlutoV17ManifestProbe.shouldSuppressDynamicAdFetch() is true;
// prepending that to the method's early-return guard suppresses the CSAI call on VOD
// while leaving live/linear (dynamic) untouched. Readable AVIA name + Map,long params.
internal object Clid3ProcessAdPodStartFingerprint : Fingerprint(
    parameters = listOf(
        "Ljava/util/Map;",
        "J",
    ),
    returnType = "V",
    custom = { method, _ ->
        method.name == "processAdPodStartAsync" &&
            method.definingClass.endsWith("/CLID3Processor;")
    },
)
