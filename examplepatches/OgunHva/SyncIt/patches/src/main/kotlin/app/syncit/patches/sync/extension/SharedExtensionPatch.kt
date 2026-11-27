package app.syncit.patches.sync.extension

import app.morphe.patcher.patch.patch

/**
 * The extension shared by the SyncIt patches. Internal: not shown in Manager or the CLI patch
 * list, but required by the patches that use it.
 */
val sharedExtensionPatch = patch {
    extendWith("extensions/syncit.mpe")
}
