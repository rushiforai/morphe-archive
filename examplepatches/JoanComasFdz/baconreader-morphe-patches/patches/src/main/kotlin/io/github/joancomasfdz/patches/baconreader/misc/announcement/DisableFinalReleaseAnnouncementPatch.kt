// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.announcement

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.util.returnEarly
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

/** Shows the "What's new" popup, which in the last release is the final release announcement. */
internal object ShowWhatsNewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/ui/main/MainActivity;",
    name = "showWhatsNew",
    returnType = "V",
    filters = listOf(
        string("FINAL RELEASE ANNOUNCEMENT!"),
    ),
)

// BaconReader's last release opens with a "FINAL RELEASE ANNOUNCEMENT!" popup saying the app stops
// working on July 1, 2023. The patches keep it working, and a fresh install of a patched app shows
// the popup again.
@Suppress("unused")
val disableFinalReleaseAnnouncementPatch = bytecodePatch(
    name = "Disable final release announcement",
    description = "Disables the \"FINAL RELEASE ANNOUNCEMENT!\" popup that says goodbye when the app starts.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        ShowWhatsNewFingerprint.method.returnEarly()
    }
}
