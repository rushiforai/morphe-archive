package app.lchanc3.patches.localdream.shared

import app.morphe.patcher.patch.bytecodePatch

/**
 * Merges the extension classes into the app. Has no name on purpose: it is a
 * dependency, not something to pick in Morphe Manager.
 */
internal val extensionHookPatch = bytecodePatch {

    extendWith("extensions/localdream.mpe")
}
