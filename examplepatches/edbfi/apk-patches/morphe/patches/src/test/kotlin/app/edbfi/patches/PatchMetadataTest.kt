// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches

import java.util.zip.ZipFile
import kotlin.test.Test
import kotlin.test.assertTrue

class PatchMetadataTest {
    private val patches = Bundle.patches

    @Test
    fun `every patch has a description`() {
        val missing = patches.filter { it.description.isNullOrBlank() }.map { it.name }
        assertTrue(missing.isEmpty(), "Patches without a description: $missing")
    }

    @Test
    fun `every patch declares the app versions it was tested on`() {
        val missing =
            patches
                .filter { patch ->
                    patch.compatibility.isNullOrEmpty() ||
                        patch.compatibility!!.any { app ->
                            app.packageName == null || app.name.isNullOrBlank() || app.targets.isEmpty() || app.targets.any { it.version == null }
                        }
                }.map { it.name }
        assertTrue(missing.isEmpty(), "Patches without a Compatibility naming the app, its package and tested versions: $missing")
    }

    @Test
    fun `patch names are unique within each app`() {
        val duplicates =
            patches
                .flatMap { patch -> patch.compatibility.orEmpty().map { it.packageName to patch.name } }
                .groupingBy { it }
                .eachCount()
                .filterValues { it > 1 }
                .keys
        assertTrue(duplicates.isEmpty(), "Patch names used twice for the same app: $duplicates")
    }

    @Test
    fun `every file in the bundle has a name no other bundle uses`() {
        // Bundles loaded together share one class loader, so a file another bundle also has, such as an
        // extensions/rifisfun.mpe, can be read in place of ours.
        val own = listOf("app/edbfi/", "extensions/edbfi/", "edbfi/")
        val shared =
            ZipFile(Bundle.file).use { zip ->
                zip
                    .entries()
                    .asSequence()
                    .filterNot { it.isDirectory }
                    .map { it.name }
                    .filterNot { name ->
                        name.startsWith("META-INF/") || Regex("classes\\d*\\.dex").matches(name) || own.any(name::startsWith)
                    }.toList()
            }
        assertTrue(shared.isEmpty(), "Bundle files outside $own, which another bundle could shadow: $shared")
    }
}
