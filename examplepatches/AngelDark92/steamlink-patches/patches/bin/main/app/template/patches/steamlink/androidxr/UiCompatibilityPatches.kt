package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch

internal val androidXrUiExtensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}
