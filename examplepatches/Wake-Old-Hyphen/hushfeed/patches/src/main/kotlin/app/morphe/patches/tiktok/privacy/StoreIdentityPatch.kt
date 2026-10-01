/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.shared.requireLocals
import app.morphe.util.addInstruction
import app.morphe.util.addInstructionsWithLabels

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/StoreIdentity;"
private const val GET_INSTALLER =
    "Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;"

@Suppress("unused")
val storeIdentityPatch = bytecodePatch(
    name = "Look like the store app",
    description = "Answers TikTok's own checks of how it was signed and installed the way the " +
        "Play Store app would. Its signature hash reads as TikTok's certificate and its installer " +
        "reads as the Play Store. For a follow or a like that undoes itself on a refresh on a " +
        "patched build. TikTok can also read the APK from native code, which no patch reaches, so " +
        "it may not be enough on its own. Off by default. Switch: Hushfeed settings > Privacy.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableStoreIdentity()V",
        )

        // TikTok's own cached self-package lookup. When the extension answers with a package that
        // carries TikTok's certificate, return it; otherwise the wrapper runs as it always did.
        // The result lands in v0, a local the wrapper already has (it caches into v0 itself).
        val wrapper = SelfPackageInfoCacheFingerprint.method
        wrapper.requireLocals("Look like the store app", 1)
        wrapper.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1, p2 }, $EXTENSION->packageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                move-result-object v0
                if-eqz v0, :run_wrapper
                return-object v0
                :run_wrapper
                nop
            """,
        )

        // Every getInstallerPackageName call: the extension answers the Play Store for TikTok's own
        // package and the real installer for anything else. Both invoke forms, any build with none.
        val sites = invokeSitesOf(setOf(GET_INSTALLER))
        replaceSites(
            sites,
            sites.associate {
                it.target to "$EXTENSION->installerFor(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;"
            },
        )
    }
}
