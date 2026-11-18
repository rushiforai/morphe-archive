package me.toidicakhia.patches.wedj

import app.morphe.patcher.Fingerprint

/**
 * `M.j()` returns the cached result of the one-time "Unlock Unlimited Playback"
 * purchase. The free build calls it before loading a new track and in the browser
 * menu to decide whether to show the purchase entry.
 */
val UnlimitedPlaybackPurchasedFingerprint = Fingerprint(
    definingClass = "Lcom/pioneerdj/WeDJ/M;",
    name = "j",
    parameters = emptyList(),
    returnType = "Z"
)

/**
 * WeDJ 1.1.1.3 equivalent of [UnlimitedPlaybackPurchasedFingerprint]. The
 * purchase flag lives in the settings class `c.c.a.g1` and is exposed by the
 * no-argument `g()` accessor (`g(I)Z` is a different, indexed getter).
 */
val LegacyUnlimitedPlaybackPurchasedFingerprint = Fingerprint(
    definingClass = "Lc/c/a/g1;",
    name = "g",
    parameters = emptyList(),
    returnType = "Z"
)

/**
 * Mobylog uploader used by the tracking client. Every event is serialized first
 * and then sent through this single HttpURLConnection helper, including the
 * startup `appchk.php` request.
 */
val MobylogUploadFingerprint = Fingerprint(
    definingClass = "Ld2/c;",
    name = "q",
    parameters = listOf("Ljava/lang/String;", "Ld2/b;"),
    returnType = "V"
)
