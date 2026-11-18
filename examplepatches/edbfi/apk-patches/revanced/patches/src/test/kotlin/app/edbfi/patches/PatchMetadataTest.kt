// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches

import app.revanced.patcher.patch.Patch
import app.revanced.patcher.patch.loadPatches
import java.io.File
import java.util.zip.ZipFile
import kotlin.test.Test
import kotlin.test.assertTrue

class PatchMetadataTest {
    private val bundle = File(System.getProperty("patches.bundle"))

    // loadPatches swallows load failures by default, which would pass an unloadable bundle as empty.
    private val patches: Set<Patch> =
        loadPatches(bundle) { file, error ->
            throw AssertionError("Couldn't load patches from $file", error)
        }

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
                    patch.compatiblePackages.isNullOrEmpty() ||
                        patch.compatiblePackages!!.any { (_, versions) -> versions.isNullOrEmpty() }
                }.map { it.name }
        assertTrue(missing.isEmpty(), "Patches without compatibleWith packages and versions: $missing")
    }

    @Test
    fun `patch names are unique within each app`() {
        val duplicates =
            patches
                .flatMap { patch -> patch.compatiblePackages.orEmpty().map { (pkg, _) -> pkg to patch.name } }
                .groupingBy { it }
                .eachCount()
                .filterValues { it > 1 }
                .keys
        assertTrue(duplicates.isEmpty(), "Patch names used twice for the same app: $duplicates")
    }

    @Test
    fun `every file in the bundle has a name no other bundle uses`() {
        // ReVanced Manager and the CLI load every bundle through one class loader, so a file another bundle also has,
        // such as ReVanced's extensions/syncforreddit.rve, can be read in place of ours.
        val own = listOf("app/edbfi/", "extensions/edbfi/", "edbfi/")
        val shared =
            ZipFile(bundle).use { zip ->
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
