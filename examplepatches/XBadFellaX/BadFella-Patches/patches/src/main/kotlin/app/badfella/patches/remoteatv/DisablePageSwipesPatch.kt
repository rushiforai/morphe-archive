package app.badfella.patches.remoteatv

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val remoteAtvDisablePageSwipesPatch = resourcePatch(
    name = "Disable remote page swipes",
    description = "Disables swiping between the D-pad or touchpad and number pad. Keeps the switch button and setup page swipes. Requires Remote ATV ad-free. Supports version 6.1.0, build 45.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Remote for Android TV", packageName = "tech.simha.androidtvremote",
        apkFileType = ApkFileType.APKM, appIconColor = 0x127AFF,
        targets = listOf(AppTarget(version = "6.1.0", versionCode = 45,
            description = "Version 6.1.0, build 45.")),
    ))
    dependsOn(remoteAtvAdFreePatch)

    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        check(libraries.isNotEmpty()) { "Remote ATV has no Dart snapshot" }
        libraries.forEach { name ->
            val abi = name.split('/')[1]
            val file = get(name)
            file.writeBytes(applyRemoteAtvNativeEdits(
                file.readBytes(), "/remoteatv/swipes-6.1.0-$abi.tsv", "swipe",
            ))
        }
    }
}
