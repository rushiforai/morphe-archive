package app.template.patches.redditsync.fixcommentimagedimensions.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lc9/c;->a(Landroid/content/Context;ILorg/json/JSONObject;Ljava/util/ArrayList;IZZLjava/lang/String;)V
 * — the (proguard-obfuscated) mega-method that converts one raw Reddit API JSON object (a
 * post, comment, etc.) into the app's local data model, dispatching on a "kind" discriminator
 * parameter. Its post-selftext branch already scans for bare preview.redd.it URLs missing a
 * real "&height" query parameter and injects one from the JSON's own "media_metadata" object
 * — but its separate comment-body branch never does this. See
 * FixCommentImageDimensionsPatch.kt for why that gap causes comment-embedded images to be
 * treated as forced-square when they're really not.
 */
val parseCommentJsonFingerprint = fingerprint {
    returns("V")
    parameters(
        "Landroid/content/Context;",
        "I",
        "Lorg/json/JSONObject;",
        "Ljava/util/ArrayList;",
        "I",
        "Z",
        "Z",
        "Ljava/lang/String;",
    )
    custom { method, classDef -> classDef.type == "Lc9/c;" && method.name == "a" }
}
