package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.bytecodePatch
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Main "Android Auto" patch — the user-facing entry point that bundles all
 * required sub-patches for injecting Android Auto support into Petal Maps.
 *
 * This patch groups:
 * - [androidAutoManifestPatch]: AndroidManifest.xml edits (service, meta-data, permissions)
 * - [androidAutoResourcesPatch]: automotive_app_desc.xml resource
 *
 * The following patches are NOT included as dependencies (they are recommended
 * but kept separate for easier debugging and optional use):
 * - [antiRepackPatch]: Anti-repack integrity check bypass
 * - [manufacturerCheckBypassPatch]: Non-Huawei device restriction bypass
 *
 * The Android Auto CarAppService extension (dev.petalaa.extension.PetalCarAppService)
 * is bundled via [extendWith].
 */
@Suppress("unused")
val androidAutoPatch = bytecodePatch(
    name = "Android Auto",
    description = "Injects full Android Auto support into Petal Maps, " +
            "including CarAppService, manifest declarations, and required resources. " +
            "Also apply 'Anti-Repack Bypass' and 'Manufacturer Check Bypass' for " +
            "full functionality on non-Huawei devices.",
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    dependsOn(
        androidAutoManifestPatch,
        androidAutoResourcesPatch,
    )

    extendWith("extensions/extension.rve")
}
