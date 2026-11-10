package app.zdrgon.patches.rainviewer.integrity

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// RainViewer 8.4.1 (44084) — verified against the real dexes on 2026-11-02.
//
// The "App Blocked" screen is a server verdict delivered through the app's
// signed API layer, in two steps:
//  1. At startup the app fetches a Play Integrity token (the "Raindrop"
//     flow, Ljz5;) and POSTs it to mobile/verify/android/raindrop/. The
//     server decodes Google's verdict; a re-signed build fails app
//     recognition, so the server flags the install's API key.
//  2. Every signed API response is validated by Lsl;->d/e: a JSON body
//     carrying "code" (or "statusCode") "81" makes Lsl;->e throw Lez5;,
//     which the data layer (Lo21;) maps to the BLOCKED error state the UI
//     renders as the App Blocked dialog, with all weather data failing.

/**
 * Ljz5;->b(ILft0;)Ljava/lang/Object; — the Raindrop token fetch with
 * retries. Its only caller is the authorization repository, which posts the
 * returned token to the server; a null token aborts the post. Returning null
 * up front means no verdict is ever sent for this install. The
 * "Raindrop 2" log tag is emitted from this method's failure path.
 *
 * Access flags verified from the dex: 0x11 = public final (Kotlin suspend
 * function). Morphe compares access flags by exact equality.
 */
internal object RaindropTokenFingerprint : Fingerprint(
    definingClass = "Ljz5;",
    name = "b",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("I", "Lft0;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("Raindrop 2"),
)

/**
 * Lsl;->e(Ljava/lang/String;Ljava/lang/String;)Z — the API response code
 * checker. It reads a code field out of the response JSON: "0"/empty is OK,
 * "81" throws Lez5; (blocked), "88" throws Lss;, "400"/"5001"/"5002"/
 * "5009"/"11404" throw their own error types, anything else returns true.
 *
 * Access flags verified from the dex: 0x9 = public static (no FINAL).
 */
internal object ApiResponseCodeFingerprint : Fingerprint(
    definingClass = "Lsl;",
    name = "e",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("81", "88", "5001", "11404"),
)
