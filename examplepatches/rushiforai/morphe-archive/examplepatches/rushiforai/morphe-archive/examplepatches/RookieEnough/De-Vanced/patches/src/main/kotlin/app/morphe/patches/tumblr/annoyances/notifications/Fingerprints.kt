/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/annoyances/notifications/Fingerprints.kt
 */
package app.morphe.patches.tumblr.annoyances.notifications

import app.morphe.patcher.Fingerprint

// The BlogNotifyCtaDialog asks you if you want to enable notifications for a blog.
// It shows whenever you visit a certain blog for the second time and disables itself
// if it was shown a total of 3 times (stored in app storage).
// This targets the BlogNotifyCtaDialog.isEnabled() method to let it always return false.
internal object IsBlogNotifyEnabledFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("isEnabled --> ", "blog_notify_enabled"),
)

