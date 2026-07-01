/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/privacy/Fingerprints.kt
 */
package app.morphe.patches.strava.privacy

import app.morphe.patcher.Fingerprint

// https://github.com/snowplow/snowplow-android-tracker/blob/2.2.0/snowplow-tracker/src/main/java/com/snowplowanalytics/snowplow/internal/emitter/storage/SQLiteEventStore.java#L130
// Not the exact same code (e.g. returns void instead of long), even though the version number matches.
internal object InsertEventFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Added event to database: %s"),
)

