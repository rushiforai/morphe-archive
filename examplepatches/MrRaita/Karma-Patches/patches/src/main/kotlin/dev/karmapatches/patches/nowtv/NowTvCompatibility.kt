package dev.karmapatches.patches.nowtv

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** NOW (Türkiye) uygulaması ve yamaların doğrulandığı sürümler. */
internal val NOW_TV_COMPATIBILITY = Compatibility(
    name = "NOW TV",
    packageName = "tr.com.nowtv.android",
    targets = listOf(
        AppTarget(version = "7.6.258"),
        AppTarget(version = "7.0.305"),
    ),
)
