package dev.supperelias2.sbs.qol

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

@Suppress("unused")
val bingeProfilePatch = bytecodePatch(
    name = "Experimental: binge-watching preset",
    description = "Adds an opt-in preset button for automatic intros/recaps, uninterrupted watching and a shorter next-episode delay. Individual switches remain available.",
    default = true
) {
    category("Experimental")
    compatibleWith(Compatibility(
        name = "SBS On Demand", packageName = "com.sbs.ondemand.android",
        apkFileType = ApkFileType.APKM, appIconColor = 0xDCBD1D,
        targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
    ))
    dependsOn(settingsPatch, autoSkipPatch, stillWatchingPatch, nextEpisodeCountdownPatch)
    execute { registerFeature("binge_profile") }
}
