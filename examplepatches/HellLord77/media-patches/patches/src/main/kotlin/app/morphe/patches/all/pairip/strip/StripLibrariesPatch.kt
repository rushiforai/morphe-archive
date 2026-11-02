package app.morphe.patches.all.pairip.strip

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import kotlin.io.path.deleteIfExists

internal val stripLibrariesPatch =
    rawResourcePatch {
        finalize {
            get(NATIVE_LIBRARY_DIRECTORY).listFiles()?.forEach { dir ->
                dir.resolve("libpairipcore.so").toPath().deleteIfExists()
            }
        }
    }
