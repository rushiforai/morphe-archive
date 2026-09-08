/**
 * Derived from the Morphe shared-extension helper used by Hoo-dles.
 *
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.soundcloud.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

private val rootActivityOnCreateFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    custom = { method, classDef ->
        method.name == "onCreate" && classDef.type.endsWith("/RootActivity;")
    },
)

/** Injects the single SoundCloud extension module shared by all SoundCloud patches. */
internal val soundcloudExtensionPatch = sharedExtensionPatch(
    listOf("soundcloud"),
    ExtensionHook(rootActivityOnCreateFingerprint),
)
