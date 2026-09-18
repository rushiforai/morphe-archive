package app.morphe.patches.shared.layout.branding

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.util.inputStreamFromBundledResource
import java.nio.file.Files

/**
 * Copies the license and branding notice files to the target apk.
 */
internal val addLicensePatch = rawResourcePatch {
    execute {
        arrayOf(
            "MORPHE_BRANDING.TXT",
            "MORPHE_LICENSE.TXT",
            "MORPHE_LICENSE_NOTICE.TXT"
        ).forEach { sourceFileName ->
            val inputFileStream = inputStreamFromBundledResource(
                "license",
                sourceFileName
            )!!

            val targetFile = get(sourceFileName, false).toPath()

            // If the target file already exists (e.g. copied by official Morphe patches source in multi-source setups
            // or when re-patching), skip copying to avoid collisions.
            if (Files.exists(targetFile)) {
                return@forEach
            }

            Files.copy(inputFileStream, targetFile)
        }
    }
}
