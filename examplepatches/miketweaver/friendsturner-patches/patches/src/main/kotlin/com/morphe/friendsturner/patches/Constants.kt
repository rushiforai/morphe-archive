package com.morphe.friendsturner.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FRIENDSTURNER = Compatibility(
        name = "FriendsTurner",
        // The application id is "...friendsturner.app". Only the *class* package is
        // "com.peter890331.friendsturner" (see MainActivity), which is easy to confuse.
        packageName = "com.peter890331.friendsturner.app",
        // The base APK declares android:requiredSplitTypes="base__abi,base__density", so a
        // base-only APK cannot install. Morphe merges a split bundle before patching.
        apkFileType = ApkFileType.XAPK_REQUIRED,
        appIconColor = 0xFF1E88,
        targets = listOf(
            AppTarget(
                version = "5.16"
            ),
            AppTarget(
                version = "5.15"
            ),
            // Keep these explicit. v1.1.1/v1.1.2 replaced them with a null "any version"
            // target, on a wrong diagnosis of why one phone did not offer the installed
            // app (it was a different menu path, not version filtering). Declaring real
            // versions is what gives Morphe a version to recommend.
            //
            // Still true if "any version" is ever genuinely wanted: a null target only
            // counts when it is the ONLY target, because the manager builds its version
            // list with targets.mapNotNull { it.version } (PatchInfo.kt) and drops a null
            // listed beside real ones. Check with CompatKt in verify-harness.
        )
     )
}
