/*
 * Based on "Fix notifications" from hoomans-morphe-patches by arandomhooman (GPLv3).
 * https://github.com/arandomhooman/hoomans-morphe-patches
 */

package io.github.bakwudo.uyu.patches.twitch.notifications

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Firebase Installations connection builder. It sends X-Android-Cert, computed from the installed
 * signer. Found by its two header names, which are not obfuscated.
 */
internal object FirebaseInstallationsConnectionFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("X-Android-Cert", "x-goog-api-key"),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/net/HttpURLConnection;",
    parameters = listOf("Ljava/net/URL;", "Ljava/lang/String;"),
)
