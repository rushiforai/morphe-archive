package app.fbpatches.patches.facebook.shared

import app.morphe.patcher.patch.bytecodePatch

/** Merges the extension into the app. Every patch that calls into the extension depends on this. */
internal val extensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}
