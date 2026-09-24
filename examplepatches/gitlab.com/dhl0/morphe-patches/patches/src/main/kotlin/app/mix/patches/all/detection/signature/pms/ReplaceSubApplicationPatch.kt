/**
 * Copyright 2026 jkennethcarino, IMXEren.
 * https://github.com/jkennethcarino/adobo
 * https://github.com/IMXEren/mix-patches
 */

package app.mix.patches.all.detection.signature.pms

import app.morphe.patcher.patch.resourcePatch
import app.mix.patches.shared.resource.ANDROID_NAME_ATTR
import app.mix.patches.shared.resource.APPLICATION_NODE
import app.mix.patches.shared.resource.androidManifest
import app.mix.util.get
import app.mix.util.set

private const val EXTENSION_CLASS_NAME =
    "app.mix.extension.all.detection.signature.pms.SignatureHookApp"

val replaceSubApplicationPatch = resourcePatch(
    description = "Sets the sub-application with our SignatureHookApp."
) {
    execute {
        androidManifest {
            val application = this[APPLICATION_NODE]
            val subApplicationName = application[ANDROID_NAME_ATTR]

            if (subApplicationName.isEmpty()) {
                application[ANDROID_NAME_ATTR] = EXTENSION_CLASS_NAME
            }
        }
    }
}