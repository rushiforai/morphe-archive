package app.kecerim24.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    /**
     * dream Player, the free Android phone/tablet Enigma2 client by CyberDream.
     *
     * Not to be confused with "dream Player TV" (de.cyberdream.dreamepg.tv.player),
     * which is a separate app with its own obfuscation mapping.
     */
    val COMPATIBILITY_DREAM_PLAYER = Compatibility(
        name = "dream Player",
        packageName = "de.cyberdream.dreamepg.player",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x2C5C80,
        // The app uses APK signature scheme v3.1 key rotation, so a Play delivered build
        // carries two signers: the original CyberDream key for SDK 24-32, and the rotated
        // Google Play app signing key for SDK 33 and above. Both are part of the same
        // lineage and either may be reported depending on which scheme is inspected.
        signatures = setOf(
            // O=CyberDream, L=Karlsruhe (minSdkVersion 24-32)
            "ff84631633d9b99afc1fdc5e21bfaa69a0ea285c440cf3f542ab58964fe91f97",
            // Rotated Play app signing key (minSdkVersion 33+)
            "600d4c2fd24a9cd98bdc8aec255e537a47a2f5b0537cd10c67c9fb79ac088812"
        ),
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Developed and confirmed working against 14.1.0 (version code 51098).
            AppTarget(
                version = "14.1.0"
            )
        )
    )
}
