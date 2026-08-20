/**
 * Copyright 2026 jkennethcarino, IMXEren.
 * https://github.com/jkennethcarino/adobo
 * https://github.com/IMXEren/mix-patches
 */

package app.mix.patches.all.detection.signature.pms

import app.morphe.patcher.patch.resourcePatch
import app.mix.patches.shared.resource.MANIFEST_NODE
import app.mix.patches.shared.resource.androidManifest
import app.mix.util.get

internal lateinit var appPackageName: String
    private set

val packageNamePatch = resourcePatch(
    description = "Extracts the package name of the app."
) {
    execute {
        androidManifest {
            val manifest = this[MANIFEST_NODE]
            appPackageName = manifest["package"]
        }
    }
}