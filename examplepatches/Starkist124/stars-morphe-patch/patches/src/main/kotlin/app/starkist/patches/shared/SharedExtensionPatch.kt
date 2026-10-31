package app.starkist.patches.shared

import app.morphe.patcher.patch.bytecodePatch

/**
 * Adds the compiled extension classes into the app.
 * Every patch that calls extension code depends on this, so it is added only once.
 */
val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}
