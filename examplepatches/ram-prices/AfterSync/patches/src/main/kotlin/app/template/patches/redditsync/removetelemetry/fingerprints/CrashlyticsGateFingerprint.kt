package app.template.patches.redditsync.removetelemetry.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lt7/k;->a()Z ("CrashlyticsHelper.isEnabled" per its "CrashlyticsHelper.java"
 * source annotation, v23.06.30-13:39) — the single choke point every Crashlytics call
 * in the app routes through: RedditApplication's startup collection-enable/disable
 * call, and CrashlyticsHelper's own event/exception logging helpers (b(), c()) all
 * check this method first. Confirmed by hand from real smali (via apktool): it's a
 * static, no-arg method returning Z that (ignoring the Robolectric test-detection
 * branch) simply reads SettingsSingleton$Settings.analyticsFabric.
 *
 * Matched by exact defining class + method name rather than structurally, since the
 * method itself has no distinguishing strings/parameters to anchor on. This is safe
 * because this patch bundle is pinned to this exact app version and package name, and
 * the app is abandoned (no future obfuscation shuffle to survive).
 */
val crashlyticsGateFingerprint = fingerprint {
    returns("Z")
    parameters()
    custom { method, classDef -> classDef.type == "Lt7/k;" && method.name == "a" }
}
