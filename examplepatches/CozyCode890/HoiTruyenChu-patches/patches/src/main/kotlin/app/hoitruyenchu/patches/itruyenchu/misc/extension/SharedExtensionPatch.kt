package app.hoitruyenchu.patches.itruyenchu.misc.extension

import app.morphe.patcher.patch.patch

/** Merges the extension classes (extensions/itruyenchu) into the app. */
val sharedExtensionPatch = patch {
    extendWith("extensions/itruyenchu.mpe")
}
