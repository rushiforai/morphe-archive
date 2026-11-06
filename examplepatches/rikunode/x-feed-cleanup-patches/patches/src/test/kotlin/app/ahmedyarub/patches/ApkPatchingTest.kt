package app.ahmedyarub.patches

import app.ahmedyarub.patches.harness.ApkPatching
import app.ahmedyarub.patches.harness.Bundle
import app.ahmedyarub.patches.harness.FingerprintAudit
import app.ahmedyarub.patches.harness.TargetApk
import app.morphe.patcher.patch.Patch
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.DynamicTest
import org.junit.jupiter.api.DynamicTest.dynamicTest
import org.junit.jupiter.api.Tag
import org.junit.jupiter.api.TestFactory
import kotlin.test.assertTrue
import kotlin.test.fail

/**
 * Applies the bundle to the real apps it targets. Run with the `apkTest` task, which passes the
 * APKs in; without them there is nothing to test and every case is skipped.
 */
@Tag("apk")
class ApkPatchingTest {
    private val targets = TargetApk.configured()

    /**
     * All of an app's patches together, as Manager applies them with everything selected. The
     * patched APK is kept under build/patched for a verifier run on a device.
     */
    @TestFactory
    fun `all patches apply together`(): List<DynamicTest> {
        assumeTrue(targets.isNotEmpty(), "No APKs configured")

        return targets.map { target ->
            dynamicTest(target.app) {
                val apk = ApkPatching.baseApk(target.file)
                val (packageName, versionName) = ApkPatching.metadata(apk)
                val patches = Bundle.patchesFor(packageName)
                assertTrue(patches.isNotEmpty(), "The bundle has no patches for $packageName")

                val outcome = ApkPatching.patch(apk, patches.mapNotNull { it.name }, target.app)
                assertNoFailures(outcome)
                ApkPatching.sign(outcome.patchedApk!!)

                // Checked last so a version mismatch still reports how the patches fared.
                assertSupports(patches, packageName, versionName)
            }
        }
    }

    /**
     * Each patch alone, with only what it declares it depends on. A patch that only works because
     * another selected patch happened to set something up fails here, which is what a user who
     * deselects that other patch would hit.
     */
    @TestFactory
    fun `each patch applies on its own`(): List<DynamicTest> {
        assumeTrue(targets.isNotEmpty(), "No APKs configured")
        assumeTrue(System.getProperty("morphe.isolated") == "true", "Run with -Pmorphe.isolated=true")

        return targets.flatMap { target ->
            val apk = ApkPatching.baseApk(target.file)
            val (packageName, _) = ApkPatching.metadata(apk)

            Bundle.patchesFor(packageName).mapNotNull { it.name }.sorted().map { name ->
                dynamicTest("${target.app}: $name") {
                    val label = "${target.app}-" + name.replace(Regex("[^A-Za-z0-9]+"), "-")
                    assertNoFailures(ApkPatching.patch(apk, listOf(name), label))
                }
            }
        }
    }

    /**
     * Every fingerprint matches exactly one method of the unpatched app. See [FingerprintAudit] for
     * why more than one is as bad as none.
     */
    @TestFactory
    fun `every fingerprint matches exactly one method`(): List<DynamicTest> {
        assumeTrue(targets.isNotEmpty(), "No APKs configured")

        return targets.map { target ->
            dynamicTest(target.app) {
                val apk = ApkPatching.baseApk(target.file)
                val resultFile = ApkPatching.workDirectory("audit-${target.app}").resolveSibling("audit-${target.app}.result")
                resultFile.parentFile.mkdirs()
                ApkPatching.runInFreshJvm(FingerprintAudit::class.java.name, listOf(apk.path, resultFile.path))

                val problems =
                    resultFile.readLines().filter { line ->
                        val (id, count) = line.split('\t')
                        id !in MULTIPLE_MATCHES_EXPECTED && count != "1"
                    }
                assertTrue(problems.isEmpty(), "Fingerprints not matching exactly one method:\n" + problems.joinToString("\n"))
            }
        }
    }

    private fun assertSupports(
        patches: Set<Patch<*>>,
        packageName: String,
        versionName: String,
    ) {
        val unsupported =
            patches.filter { patch ->
                patch.compatibility!!
                    .filter { it.packageName == packageName }
                    .none { compatibility -> compatibility.targets.any { it.version == versionName } }
            }.map { it.name }

        assertTrue(unsupported.isEmpty(), "Patches that do not declare $packageName $versionName: $unsupported")
    }

    private fun assertNoFailures(outcome: ApkPatching.Outcome) {
        if (outcome.failures.isNotEmpty()) {
            fail(outcome.failures.entries.joinToString(separator = "\n\n") { (name, failure) -> "$name: $failure" })
        }
        assertTrue(
            outcome.unresolved.isEmpty(),
            "Patched code references members that do not exist:\n" + outcome.unresolved.joinToString("\n"),
        )
    }

    private companion object {
        /** Fingerprints a patch deliberately applies to every method they match. */
        val MULTIPLE_MATCHES_EXPECTED = emptySet<String>()
    }
}
