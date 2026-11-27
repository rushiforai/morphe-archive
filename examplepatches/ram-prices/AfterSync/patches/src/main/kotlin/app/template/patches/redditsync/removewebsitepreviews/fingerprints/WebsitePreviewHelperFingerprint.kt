package app.template.patches.redditsync.removewebsitepreviews.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lwc/q;->a(Ljava/lang/String;)Z ("WebsitePreviewHelper.isEligible" per its
 * source-file annotation, v23.06.30-13:39) — the single gate deciding whether a URL in
 * a comment/post gets a website-preview card. Confirmed by hand via apktool: among
 * other checks, it reads SettingsSingleton$Settings.ultra_website_previews directly.
 * Forcing this to always return false disables the feature unconditionally, regardless
 * of whatever value happens to already be stored for that setting.
 */
val websitePreviewHelperFingerprint = fingerprint {
    returns("Z")
    parameters("Ljava/lang/String;")
    custom { method, classDef -> classDef.type == "Lwc/q;" && method.name == "a" }
}
