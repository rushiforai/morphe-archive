package io.github.jordanwoodson.patches.twitch.counts

import app.morphe.patcher.Fingerprint

// NumberFormatUtil (the class keeps its name) shortens a count to "24.2K" with a CompactDecimalFormat; the
// German thousands form it writes by hand is its only format string.
internal object CompactCountFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/util/NumberFormatUtil;",
    returnType = "Ljava/lang/String;", parameters = listOf("J", "Z"),
    strings = listOf("%.1f Tsd."),
)
