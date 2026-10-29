package app.markpaul099.patches.shared

import app.morphe.patcher.patch.bytecodePatch

/**
 * Adds the extension classes (GIF search runtime and the GIFs Extended settings screen).
 */
internal val extensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}
