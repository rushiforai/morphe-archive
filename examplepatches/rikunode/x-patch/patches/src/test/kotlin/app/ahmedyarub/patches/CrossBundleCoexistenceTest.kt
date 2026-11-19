package app.ahmedyarub.patches

import app.ahmedyarub.patches.harness.ApkPatching
import app.morphe.patcher.patch.loadPatchesFromJar
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.DynamicTest
import org.junit.jupiter.api.Tag
import org.junit.jupiter.api.TestFactory
import java.io.File
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import kotlin.test.fail

/**
 * Reproduces the intended Manager setup: Ahmed's normal X patches plus this unified add-on source.
 *
 * Run with:
 *   -Pmorphe.cross.x31=<base.apk>
 *   -Pmorphe.cross.ahmed11=<patches-1.11.0.mpp>
 *   -Pmorphe.cross.x32=<base.apk>
 *   -Pmorphe.cross.ahmed12=<patches-1.12.0.mpp>
 */
@Tag("crossBundle")
class CrossBundleCoexistenceTest {
    @TestFactory
    fun `the unified add-on patches coexist with Ahmed`(): List<DynamicTest> {
        val currentBundle = File(System.getProperty("morphe.bundle"))
        val keys =
            listOf(
                "morphe.cross.x31",
                "morphe.cross.ahmed11",
                "morphe.cross.x32",
                "morphe.cross.ahmed12",
            )
        val configured = keys.associateWith { System.getProperty(it).orEmpty().trim() }

        assumeTrue(configured.values.any { it.isNotEmpty() }, "Cross-bundle verification was not requested")
        // JUnit aborts the factory above only when none are configured. Once release verification is
        // requested, require the full 12.31/1.11 + 12.32/1.12 matrix instead of silently testing half.
        val missingProperties = configured.filterValues { it.isEmpty() }.keys
        require(missingProperties.isEmpty()) { "Missing cross-bundle properties: $missingProperties" }

        val cases =
            listOf(
                case("x31", configured.getValue("morphe.cross.x31"), configured.getValue("morphe.cross.ahmed11"), currentBundle),
                case("x32", configured.getValue("morphe.cross.x32"), configured.getValue("morphe.cross.ahmed12"), currentBundle),
            )

        return cases.map { case ->
            DynamicTest.dynamicTest(case.label) {
                val result = File(ApkPatching.buildDirectory, "tmp/cross-bundle-${case.label}.result")
                ApkPatching.runInFreshJvm(
                    CrossBundleRunner::class.java.name,
                    listOf(case.apk.path, case.ahmedBundle.path, case.addonBundle.path, case.label, result.path),
                )

                val lines = result.readLines()
                val missing = lines.filter { it.startsWith("MISSING\t") }
                val collisions = lines.filter { it.startsWith("COLLISION\t") }
                val failures = lines.filter { it.startsWith("FAIL\t") }
                val unresolved = lines.filter { it.startsWith("UNRESOLVED\t") }
                val loaded = lines.firstOrNull { it.startsWith("SELECTED\t") }
                    ?.substringAfter('\t')?.toIntOrNull()

                assertEquals(25, loaded, "Expected Ahmed 20 + X Patch 5 selected patches")
                assertTrue(missing.isEmpty(), missing.joinToString("\n"))
                assertTrue(collisions.isEmpty(), collisions.joinToString("\n"))
                assertTrue(failures.isEmpty(), failures.joinToString("\n"))
                assertTrue(unresolved.isEmpty(), unresolved.joinToString("\n"))
            }
        }
    }

    private fun case(label: String, apkPath: String, ahmedPath: String, currentBundle: File): Case {
        val apk = File(apkPath)
        val ahmed = File(ahmedPath)
        require(apk.isFile) { "Missing test APK: $apk" }
        require(ahmed.isFile) { "Missing Ahmed bundle: $ahmed" }
        require(currentBundle.isFile) { "Missing add-on bundle: $currentBundle" }
        return Case(label, apk, ahmed, currentBundle)
    }

    private data class Case(
        val label: String,
        val apk: File,
        val ahmedBundle: File,
        val addonBundle: File,
    )
}

/** Fresh JVM runner so fingerprint caches cannot leak between X versions. */
object CrossBundleRunner {
    private val AHMED_PATCHES =
        setOf(
            "Add ability to copy media link",
            "Customize side bar items",
            "Customize timeline top bar",
            "Delete from database",
            "Disable auto timeline scroll on launch",
            "Force enable translate",
            "Handle custom twitter links",
            "Hide Banner",
            "Hide badges from navigation bar icons",
            "Hide promote button",
            "Import/Export login token",
            "Legacy share links",
            "Native downloader",
            "Native reader mode",
            "Native translator",
            "No shortened URL",
            "Remove Ads",
            "Remove premium upsell",
            "Share Tweet as Image",
            "Show sensitive media",
        )

    private val ADDON_PATCHES = setOf("Hide Who to follow", "Hide Find more", "Copy media URL", "Hide sports scores", "Hide search relevance prompt")
    private val SELECTED = AHMED_PATCHES + ADDON_PATCHES

    @JvmStatic
    fun main(args: Array<String>) {
        val (apkPath, ahmedPath, addonPath, label, resultPath) = args
        val apk = File(apkPath)
        val bundles = setOf(File(ahmedPath), File(addonPath))
        val loaded = loadPatchesFromJar(bundles)
        val providers =
            loaded.mapNotNull { patch -> patch.name?.let { it to patch } }
                .groupBy({ it.first }, { it.second })

        val missing = SELECTED - providers.keys
        val collisions = SELECTED.mapNotNull { name ->
            providers[name]?.takeIf { it.size != 1 }?.let { matches ->
                "$name => " + matches.joinToString { it.javaClass.name }
            }
        }
        val selected = SELECTED.mapNotNull { name -> providers[name]?.singleOrNull() }.toSet()
        val result = File(resultPath).apply { parentFile.mkdirs() }

        if (missing.isNotEmpty() || collisions.isNotEmpty()) {
            val lines =
                missing.map { "MISSING\t$it" } +
                    collisions.map { "COLLISION\t$it" }
            result.writeText(lines.joinToString("\n"))
            return
        }

        ApkPatching.patchHere(apk, selected, "cross-$label", result)

        // patchHere writes its own result file. Prefix the selected count without losing its evidence.
        val original = result.readText()
        result.writeText("SELECTED\t${selected.size}\n" + original)
    }
}
