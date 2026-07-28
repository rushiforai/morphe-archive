package io.github.hiosdra.patches

import app.morphe.patcher.patch.bytecodePatch

/**
 * A build-only example for validating the Morphe patch project setup.
 *
 * This patch intentionally makes no APK changes and declares no target app.
 * Replace it only with modifications for an app you own or are authorized to
 * test.
 */
@Suppress("unused")
val compileOnlyExamplePatch = bytecodePatch(
    name = "Compile-only example",
    description = "Provides a no-op patch for validating the project build.",
    default = false,
) {
    execute {
        // Intentionally empty: this patch is only a project/build smoke test.
    }
}
