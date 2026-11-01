/*
 * Ported from ajstrick81's Disney+ Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/disney
 * which was forked from RookieEnough's ReVanced patch:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/disneyplus/ads/Fingerprints.kt
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO RookieEnough AND ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.disney.ads

import app.morphe.patcher.Fingerprint

// Disney+ phone build 26.20.0+rc1-2026.10.22 (versionCode 179270794).
// Every class below keeps its source name in this build (Moshi models and
// SDK types are kept from R8), so these match without re-pinning.

// ---------------------------------------------------------------------------
// Pre-roll and mid-roll ads: the ad-cue lists of both insertion containers,
// unchanged from the TV patch. Emptying getPoints()/getRanges() leaves the
// player with zero ad cues, so no SGAI/SSAI break is ever scheduled.
// ---------------------------------------------------------------------------

// Legacy DSS-SDK insertion container.
internal object InsertionGetPointsFingerprint : Fingerprint(
    returnType = "Ljava/util/List",
    custom = { method, _ ->
        method.name == "getPoints" &&
            method.definingClass == "Lcom/dss/sdk/internal/media/Insertion;"
    },
)

internal object InsertionGetRangesFingerprint : Fingerprint(
    returnType = "Ljava/util/List",
    custom = { method, _ ->
        method.name == "getRanges" &&
            method.definingClass == "Lcom/dss/sdk/internal/media/Insertion;"
    },
)

// Disney Media Platform ("dmp") playback-orchestration insertion container,
// the pipeline the player uses since v26.9.2.
internal object DmpInsertionGetPointsFingerprint : Fingerprint(
    returnType = "Ljava/util/List",
    custom = { method, _ ->
        method.name == "getPoints" &&
            method.definingClass == "Lcom/disney/dmp/internal/pbo/Insertion;"
    },
)

internal object DmpInsertionGetRangesFingerprint : Fingerprint(
    returnType = "Ljava/util/List",
    custom = { method, _ ->
        method.name == "getRanges" &&
            method.definingClass == "Lcom/disney/dmp/internal/pbo/Insertion;"
    },
)

// ---------------------------------------------------------------------------
// Pause ads: AdSession.getGetPauseUrl(), new for the phone port.
//
// The TV patch's pause-ad seam (MediaXPauseSession.started) was obfuscated
// away in v26.16.0 (TV project issue #167). The phone build requests pause
// ads from the URL in the playback session's AdSession. The DMP getter's
// only consumer copies it into playio.AdSession, whose pause-ad requester
// (d7b in 26.20.0) checks the URL with `if-eqz` and skips the request when
// it is null, which is also what happens for a session without ads. So a
// null URL means no pause-ad request, no creative fetch, and no impression
// beacon. The getter is a Moshi-model accessor, so its name is stable.
// ---------------------------------------------------------------------------

internal object DmpAdSessionGetPauseUrlFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    custom = { method, _ ->
        method.name == "getGetPauseUrl" &&
            method.definingClass == "Lcom/disney/dmp/internal/pbo/AdSession;"
    },
)

// Legacy DSS-SDK twin. In 26.20.0 only its JSON adapter reads it, so it is
// patched opportunistically in case an older code path uses it again.
internal object LegacyAdSessionGetPauseUrlFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    custom = { method, _ ->
        method.name == "getGetPauseUrl" &&
            method.definingClass == "Lcom/dss/sdk/internal/media/AdSession;"
    },
)
