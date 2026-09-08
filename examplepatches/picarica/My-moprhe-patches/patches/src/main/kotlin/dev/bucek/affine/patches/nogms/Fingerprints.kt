package dev.bucek.affine.patches.nogms

import app.morphe.patcher.Fingerprint

/**
 * AFFiNE's explicit Crashlytics custom-key setup is the last block in onCreate().
 * The semantic key is stable and unique in the 0.27.4 target.
 */
internal object CrashlyticsCustomKeysFingerprint : Fingerprint(
    definingClass = "Lapp/affine/pro/AFFiNEApp;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("affine_version"),
)

/** Crashlytics-backed Timber tree in the minified 0.27.4 release. */
internal object CrashlyticsTreeConstructorFingerprint : Fingerprint(
    definingClass = "Lx5/a;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
)

internal object CrashlyticsTreeLogFingerprint : Fingerprint(
    definingClass = "Lx5/a;",
    name = "e",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Throwable;"),
    strings = listOf("[info]", "[assert]", "[error]", "[warn]"),
)

/** Firebase Storage upload used only for sending old local log files. */
internal object OldLogUploadFingerprint : Fingerprint(
    definingClass = "Lx5/g;",
    name = "i",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    strings = listOf("android_log/", "FirebaseApp was not initialized with a bucket name."),
)

/** Cookie persistence coroutine; only its Crashlytics user-ID block is skipped. */
internal object SaveCookiesCoroutineFingerprint : Fingerprint(
    definingClass = "Lb7/f;",
    name = "v",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("Update user id [", "affine_csrf_token"),
)

/** Logout coroutine; only its final Crashlytics user-ID reset is skipped. */
internal object ClearAuthCookiesCoroutineFingerprint : Fingerprint(
    definingClass = "Lu5/b;",
    name = "p",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("affine_user_id", "affine_csrf_token"),
)