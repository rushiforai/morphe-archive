package app.bookspiko.patches.books.misc.extension

import app.bookspiko.patches.books.shared.Constants.GMS_EXTENSION_CLASS
import app.morphe.patcher.patch.bytecodePatch

/**
 * Merges the Play Books extension (Java helpers compiled from `extensions/playbooks`) into the app.
 */
val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/playbooks.mpe")

    execute {
        // Fail early with a clear message if the extension was not merged.
        classDefBy(GMS_EXTENSION_CLASS)
    }
}
