/*
 * Ported from ajstrick81's Pluto TV Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/pluto/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.pluto.ads

import app.morphe.patcher.Fingerprint

// Pluto TV phone build 17.2.0 (versionCode 420000962). This is a separate
// codebase from the 5.66.0-leanback TV app, and R8 renames almost all of
// it, media3 included. The seams below are the TV patch's seams, found
// again through names that survive here: the Avia player library (kept
// un-obfuscated) and Kotlin toString() labels.

// The ad video: AviaDashParser.parse(Uri, InputStream) is where Avia hands
// the downloaded MPD to media3's (obfuscated) DashManifestParser. The patch
// filters the raw XML here instead of the parsed manifest. Matches the real
// method, not its bridge (which returns Object).
internal object AviaDashParserParseFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/paramount/android/avia/player/player/core/parser/AviaDashParser;" &&
            method.name == "parse" &&
            method.returnType != "Ljava/lang/Object;" &&
            method.parameterTypes.map { it.toString() } ==
            listOf("Landroid/net/Uri;", "Ljava/io/InputStream;")
    }
)

// The ad-break timeline: StitcherSession (t7i in 17.2.0). The TV patch
// empties its getAdBreaks() getter. Here R8 inlined the getter and every
// consumer reads the field, so the patch empties the field when the session
// is constructed. toString() names the field (", adBreaks=").
internal object StitcherSessionToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("StitcherSession(id=", ", adBreaks="),
    custom = { method, _ -> method.name == "toString" }
)

// Pause ads (new for the phone port): the Paramount pause-ads SDK's
// PauseAdsResponse (ftd in 17.2.0). Its ads list is returned as-is to the
// pause-ad controller, so an empty list behaves like a server with no pause
// ad to show.
internal object PauseAdsResponseToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("PauseAdsResponse(ads="),
    custom = { method, _ -> method.name == "toString" }
)

// The resume seek (TV project issue #147): AviaPlayer.startExoplayer reads
// AbstractAviaMediaAsset.getStartPosition() and seeks the ExoPlayer to it.
internal object AviaStartExoplayerFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/paramount/android/avia/player/player/core/AviaPlayer;" &&
            method.name == "startExoplayer" &&
            method.parameterTypes.size == 1
    }
)
