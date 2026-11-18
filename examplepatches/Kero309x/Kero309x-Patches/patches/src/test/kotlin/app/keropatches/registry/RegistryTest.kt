// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.registry

import app.keropatches.anghami.rating.disableRatingPromptPatch
import app.morphe.patcher.patch.Patch
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Guards the three-way agreement between the patch set, the catalogue and the
 * behaviour specs.
 *
 * None of these checks needs an APK: they only read our own declarations. They
 * exist because the failure they catch — a patch written, compiled, and then
 * forgotten in one of the lists — is invisible until a user notices a missing
 * feature.
 *
 * The specs are read relative to the repository root, found by walking up from
 * this module's build directory.
 */
class RegistryTest {
    private val repositoryRoot = findRepositoryRoot()

    private val specIds: Map<String, List<String>> by lazy {
        AppRegistry.applications
            .flatMap { definition ->
                File(repositoryRoot, definition.specDirectory)
                    .listFiles { file -> file.extension == "md" && file.name != "README.md" }
                    .orEmpty()
                    .map { file -> file.relativeTo(repositoryRoot).invariantSeparatorsPath }
            }
            .associateWith { specPath -> declaredIds(File(repositoryRoot, specPath)) }
    }

    private fun declaredStatus(specPath: String): String =
        STATUS_LINE.find(File(repositoryRoot, specPath).readText())
            ?.groupValues?.get(1)
            ?: error("'$specPath' has no status line")

    @Test
    fun everyRegisteredPatchHasACatalogueEntry() {
        val described = Catalogue.entries.map { it.patch }.toSet()
        val missing = PatchRegistry.all - described

        assertTrue(missing.isEmpty(), "Registered but not in the catalogue: ${missing.names()}")
    }

    @Test
    fun everyCatalogueEntryIsRegistered() {
        val registered = PatchRegistry.all
        val orphaned = Catalogue.entries.map { it.patch }.filterNot { it in registered }

        assertTrue(orphaned.isEmpty(), "Catalogued but not registered: ${orphaned.names()}")
    }

    @Test
    fun catalogueAndRegistryListPatchesInTheSameOrder() {
        assertEquals(
            PatchRegistry.all.toList(),
            Catalogue.entries.map { it.patch },
            "The catalogue order is the order the manager shows; it must match the registry.",
        )
    }

    @Test
    fun everyPatchIsDeclaredForAKnownApplication() {
        Catalogue.entries.forEach { entry ->
            assertEquals(
                entry.application,
                PatchRegistry.applicationOf(entry.patch),
                "Catalogue entry '${entry.behaviourId}' and the registry disagree about its application.",
            )
            assertNotNull(
                AppRegistry.applications.firstOrNull { it.id == entry.application },
                "Catalogue entry '${entry.behaviourId}' names unknown application '${entry.application}'.",
            )
        }
    }

    @Test
    fun everyPatchIsNamedDescribedAndDefaultsToEnabled() {
        Catalogue.entries.forEach { entry ->
            val patch = entry.patch
            assertTrue(patch.name.isNullOrBlank().not(), "Patch '${entry.behaviourId}' has no name.")
            assertTrue(
                patch.description.isNullOrBlank().not(),
                "Patch '${entry.behaviourId}' has no description.",
            )
            assertEquals(
                true,
                patch.default,
                "Patch '${entry.behaviourId}' must default to enabled (decision 0004).",
            )
        }
    }

    @Test
    fun everyEntryPointsAtASpecThatDeclaresItsId() {
        Catalogue.entries.forEach { entry ->
            val spec = File(repositoryRoot, entry.specPath)
            assertTrue(spec.isFile, "Spec '${entry.specPath}' for '${entry.behaviourId}' does not exist.")
            assertTrue(
                entry.behaviourId in declaredIds(spec),
                "'${entry.specPath}' does not declare the id '${entry.behaviourId}'.",
            )
        }
    }

    @Test
    fun everySpecIsImplementedOrExplicitlyPending() {
        val implemented = Catalogue.entries.map { it.behaviourId }.toSet()

        specIds.forEach { (file, ids) ->
            assertEquals(1, ids.size, "'$file' should declare exactly one behaviour id, found $ids.")
            val id = ids.single()

            // A spec that is not implemented yet must say so in its status line,
            // so an unfinished behaviour can never look finished in the docs.
            val status = declaredStatus(file)
            if (id in implemented) {
                assertTrue(
                    status == "derived" || status == "verified",
                    "'$file' has a patch but its status is '$status'.",
                )
            } else {
                assertTrue(
                    status == "draft",
                    "'$file' has no patch but claims status '$status'.",
                )
            }
        }

        val implementedWithoutSpec = implemented - specIds.values.flatten().toSet()
        assertTrue(
            implementedWithoutSpec.isEmpty(),
            "Patches claim behaviours with no spec: $implementedWithoutSpec",
        )
    }

    @Test
    fun everyEntryPointsAtAnExistingSourceFile() {
        Catalogue.entries.forEach { entry ->
            assertTrue(
                File(repositoryRoot, "patches/${entry.sourceFile}").isFile,
                "Source file '${entry.sourceFile}' for '${entry.behaviourId}' does not exist.",
            )
        }
    }

    @Test
    fun everyEntryLivesInTheSpecDirectoryOfItsApplication() {
        Catalogue.entries.forEach { entry ->
            val definition = AppRegistry.requireById(entry.application)
            assertTrue(
                entry.specPath.startsWith("${definition.specDirectory}/"),
                "${entry.specPath} is not inside ${definition.specDirectory}.",
            )
        }
    }

    @Test
    fun dependenciesNameRealBehaviourIds() {
        val known = Catalogue.entries.map { it.behaviourId }.toSet()

        Catalogue.entries.forEach { entry ->
            entry.dependsOn.forEach { dependency ->
                assertTrue(
                    dependency != entry.behaviourId,
                    "'${entry.behaviourId}' declares a dependency on itself.",
                )
                assertTrue(
                    dependency in known,
                    "'${entry.behaviourId}' depends on '$dependency', which no entry declares.",
                )
            }
        }
    }

    @Test
    fun readmeCatalogueMatchesTheRegistry() {
        val readme = File(repositoryRoot, "README.md").readLines()
        val header = readme.indexOfFirst { it == "| # | Patch | Category | Default | Spec |" }
        assertTrue(header >= 0, "README.md has no catalogue table.")

        val listed = readme.drop(header + 2)
            .takeWhile { it.startsWith("|") }
            .map { row -> row.split('|')[2].trim() }

        assertEquals(
            Catalogue.entries.map { it.patch.name },
            listed,
            "README.md catalogue does not match the ordered Catalogue.entries list.",
        )
    }

    @Test
    fun everyRegisteredApplicationHasAtLeastOnePatch() {
        assertEquals(
            AppRegistry.applications.map { it.id }.toSet(),
            Catalogue.entries.map { it.application }.toSet(),
            "Every registered application must have catalogue entries, and every catalogue application must be registered.",
        )
    }

    private fun declaredIds(spec: File): List<String> =
        ID_LINE.findAll(spec.readText()).map { it.groupValues[1] }.toList()

    private fun Collection<Patch<*>>.names(): String =
        joinToString { it.name ?: it.toString() }

    private companion object {
        val ID_LINE = Regex("""(?m)^\s*-\s+\*\*Id:\*\*\s+`([^`]+)`""")
        val STATUS_LINE = Regex("""(?m)^\s*-\s+\*\*Status:\*\*\s+(\S+)""")

        fun findRepositoryRoot(): File {
            val start = File(System.getProperty("user.dir")).absoluteFile
            return generateSequence(start) { it.parentFile }
                .firstOrNull { File(it, "settings.gradle.kts").isFile }
                ?: error("Could not find the repository root above $start")
        }
    }
}
