package app.template.patches.redditsync.centerpostmedia.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lnc/a;->e(Lxa/d;)Lnc/a; ("Options.java") — the builder-style setter that attaches
 * a post/comment reference to the render-options object. Used only to reach Lnc/a;'s classDef
 * so CenterPostMediaPatch.kt can add a new field + setter to it (whether this options object
 * is for a post, so H() knows whether to center its media).
 */
val optionsSetPostFingerprint = fingerprint {
    returns("Lnc/a;")
    parameters("Lxa/d;")
    custom { method, classDef -> classDef.type == "Lnc/a;" && method.name == "e" }
}
