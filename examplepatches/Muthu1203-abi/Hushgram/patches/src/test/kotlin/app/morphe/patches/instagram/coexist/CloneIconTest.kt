/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.coexist

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherContext
import app.morphe.patcher.PatcherResult
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

/** Mark the icon (#145): a HushGram badge over the second copy's home screen icons. */
class CloneIconTest {
    @get:Rule val folder = TemporaryFolder()

    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.trimIndent().byteInputStream())

    private fun Document.elements(tag: String): List<Element> =
        documentElement.getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } } +
            listOfNotNull(documentElement.takeIf { it.tagName == tag })

    private fun adaptive(foreground: String, monochrome: String? = null, background: String = "@mipmap/ig_launcher_background") = """
        <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
            <background android:drawable="$background" />
            <foreground android:drawable="$foreground" />
            ${monochrome?.let { "<monochrome android:drawable=\"$it\" />" }.orEmpty()}
        </adaptive-icon>
    """.trimIndent()

    /** A decoded res folder with [files] by their path under it. */
    private fun res(vararg files: Pair<String, String>): File {
        val res = folder.newFolder("res")
        for ((path, text) in files) File(res, path).apply { parentFile.mkdirs() }.writeText(text)
        return res
    }

    @Test fun theIconsAreTheApplicationsTheActivitiesAndTheAliasesEachOnce() {
        val manifest = parse("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.instagram.android">
                <application android:icon="@mipmap/icon" android:roundIcon="@mipmap/icon">
                    <activity android:name=".Main" android:icon="@mipmap/honolulu_shortcut_icon" />
                    <activity-alias android:name=".Launcher" android:icon="@mipmap/internal_icon" />
                    <activity-alias android:name=".Kpop" android:icon="@mipmap/cannes_kpop_icon" />
                    <activity-alias android:name=".Again" android:icon="@mipmap/internal_icon" />
                    <service android:name=".Service" android:icon="@drawable/service_icon" />
                    <activity android:name=".Framework" android:icon="@android:mipmap/sym_def_app_icon" />
                </application>
            </manifest>
        """)
        assertEquals(
            listOf("mipmap/icon", "mipmap/honolulu_shortcut_icon", "mipmap/internal_icon", "mipmap/cannes_kpop_icon"),
            manifestIcons(manifest),
        )
    }

    @Test fun eachIconsAdaptiveVersionIsFoundAndItsBitmapsAreLeftAlone() {
        val res = res(
            "mipmap-anydpi/icon.xml" to adaptive("@mipmap/ig_launcher_foreground", "@drawable/instagram_monochrome"),
            "mipmap-anydpi/internal_icon.xml" to adaptive("@mipmap/ig_launcher_foreground", background = "@android:color/white"),
            "mipmap-xxhdpi/icon.png" to "png",
            "mipmap-xxhdpi/internal_icon.png" to "png",
        )
        val icons = readCloneIcons(res, listOf("mipmap/icon", "mipmap/internal_icon"))
        assertNull(icons.problem)
        assertEquals(listOf("res/mipmap-anydpi/icon.xml", "res/mipmap-anydpi/internal_icon.xml"), icons.files)
    }

    @Test fun anIconTheBadgeCantGoOnIsAProblemAndNothingToChange() {
        val cases = listOf(
            "has no adaptive version" to listOf("mipmap-xxhdpi/icon.png" to "png"),
            "isn't a reference" to listOf("mipmap-anydpi/icon.xml" to """
                <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                    <background android:drawable="@color/white" />
                    <foreground><bitmap android:src="@mipmap/ig_launcher_foreground" /></foreground>
                </adaptive-icon>
            """.trimIndent()),
            "isn't a reference" to listOf("mipmap-anydpi/icon.xml" to adaptive("@mipmap/ig_launcher_foreground", "@android:drawable/star")),
            "already has a $CLONE_BADGE" to listOf(
                "mipmap-anydpi/icon.xml" to adaptive("@mipmap/ig_launcher_foreground"),
                "drawable/$CLONE_BADGE.xml" to "<vector />",
            ),
            "already has a hushgram_foreground_mipmap_ig_launcher_foreground" to listOf(
                "mipmap-anydpi/icon.xml" to adaptive("@mipmap/ig_launcher_foreground"),
                "drawable/hushgram_foreground_mipmap_ig_launcher_foreground.xml" to "<layer-list />",
            ),
            "couldn't be read" to listOf("mipmap-anydpi/icon.xml" to "<adaptive-icon"),
        )
        for ((why, files) in cases) {
            val res = res(*files.toTypedArray())
            val icons = readCloneIcons(res, listOf("mipmap/icon"))
            assertNotNull(why, icons.problem)
            assertTrue("$why: ${icons.problem}", icons.problem!!.contains(why))
            assertEquals(why, emptyList<String>(), icons.files)
            res.deleteRecursively()
        }
    }

    /** The foreground and monochrome layers take the badge over Instagram's art. The background stays. */
    @Test fun theBadgeGoesOverTheForegroundAndTheThemedLayer() {
        val icon = parse(adaptive("@mipmap/ig_launcher_foreground", "@drawable/instagram_monochrome"))

        val added = markAdaptiveIcon(icon)

        assertEquals("@mipmap/ig_launcher_background", icon.elements("background").single().getAttribute("android:drawable"))
        assertEquals("@drawable/hushgram_foreground_mipmap_ig_launcher_foreground", icon.elements("foreground").single().getAttribute("android:drawable"))
        assertEquals("@drawable/hushgram_monochrome_drawable_instagram_monochrome", icon.elements("monochrome").single().getAttribute("android:drawable"))
        assertEquals(
            mapOf(
                "hushgram_foreground_mipmap_ig_launcher_foreground" to listOf("@mipmap/ig_launcher_foreground", "@drawable/$CLONE_BADGE"),
                "hushgram_monochrome_drawable_instagram_monochrome" to listOf("@drawable/instagram_monochrome", "@drawable/$CLONE_BADGE_MONO"),
            ),
            added.mapValues { (_, xml) -> parse(xml).elements("item").map { it.getAttribute("android:drawable") } },
        )
        added.values.forEach { assertEquals("layer-list", parse(it).documentElement.tagName) }
    }

    /**
     * Both badges are vectors the size of an adaptive icon's layer, so they scale with it, and every
     * point of them is inside the 66dp circle each launcher's shape keeps.
     */
    @Test fun theBadgesScaleWithTheLayerAndStayInsideTheSafeCircle() {
        for (xml in listOf(CLONE_BADGE_XML, CLONE_BADGE_MONO_XML)) {
            val vector = parse(xml).documentElement
            assertEquals("vector", vector.tagName)
            assertEquals("108dp", vector.getAttribute("android:width"))
            assertEquals("108", vector.getAttribute("android:viewportWidth"))
            assertEquals("108", vector.getAttribute("android:viewportHeight"))
            // The outermost path is the white edge's circle: its top point and radius.
            val edge = Regex("^M([0-9.]+),([0-9.]+)a([0-9.]+),").find(parse(xml).elements("path").first().getAttribute("android:pathData"))!!
            val (x, top, radius) = edge.destructured.toList().map(String::toDouble)
            val center = top + radius
            assertEquals("a circle", x, center, 0.0)
            assertTrue("${Math.hypot(center - 54, center - 54) + radius} from the middle", Math.hypot(center - 54, center - 54) + radius <= 33.0)
        }
        assertEquals("evenOdd", parse(CLONE_BADGE_MONO_XML).elements("path").single().getAttribute("android:fillType"))
    }

    /**
     * On the declared build, decoded and encoded as Manager does: every home screen icon Instagram
     * declares is adaptive and takes the badge, and the patched app has the badges and keeps every
     * resource it had. The other builds share these resources, so one is enough.
     */
    @Test fun theDeclaredBuildsIconsTakeTheBadgeThroughTheEncoder() {
        val build = CloneFixtures.builds().values.single { it.extension == "apks" }
        val work = folder.newFolder("work")
        val apk = File(work, "base.apk").also { base ->
            ZipFile(build).use { bundle -> bundle.getInputStream(bundle.getEntry("base.apk")).use { input -> base.outputStream().use(input::copyTo) } }
        }
        val patched = File(work, "patched.apk")
        var before = emptySet<String>()
        val marked = decoded(apk, File(work, "patch")) { context ->
            val manifest = parse(context.get("AndroidManifest.xml").readText())
            val names = manifestIcons(manifest)
            assertTrue("Instagram's icon and its launcher's, $names", names.containsAll(listOf("mipmap/icon", "mipmap/internal_icon")))
            assertEquals("Instagram's sixteen icons: $names", 16, names.size)
            val icons = readCloneIcons(context.get("res"), names)
            assertNull(icons.problem)
            assertEquals(icons.files.toString(), 16, icons.files.size)
            before = ids(context.get("res"))
            context.markCloneIcons(icons.files)
            val added = File(context.get("res"), "drawable").list()!!.filter { it.startsWith("hushgram_") }.toSet()
            encoded(context).copyTo(patched)
            added
        }
        assertTrue(marked.toString(), marked.containsAll(setOf("$CLONE_BADGE.xml", "$CLONE_BADGE_MONO.xml")))
        decoded(patched, File(work, "check")) { context ->
            val res = context.get("res")
            val lost = before - ids(res)
            assertTrue("numbers gone, ${lost.take(5)}", lost.isEmpty())
            val icon = File(res, "mipmap-anydpi").takeIf { it.isDirectory } ?: res.listFiles()!!.single { it.name.startsWith("mipmap-anydpi") }
            val layers = parse(File(icon, "icon.xml").readText())
            assertEquals("@drawable/hushgram_foreground_mipmap_ig_launcher_foreground", layers.elements("foreground").single().getAttribute("android:drawable"))
            assertTrue(layers.elements("monochrome").single().getAttribute("android:drawable").startsWith("@drawable/hushgram_monochrome_"))
            val wrapped = parse(File(res, "drawable/hushgram_foreground_mipmap_ig_launcher_foreground.xml").readText())
            assertEquals(listOf("@mipmap/ig_launcher_foreground", "@drawable/$CLONE_BADGE"), wrapped.elements("item").map { it.getAttribute("android:drawable") })
            assertEquals("vector", parse(File(res, "drawable/$CLONE_BADGE.xml").readText()).documentElement.tagName)
            assertEquals(marked, File(res, "drawable").list()!!.filter { it.startsWith("hushgram_") }.toSet())
        }
    }

    /** [apk]'s resources decoded in full into [workspace], as LaunchScreenPatchTest reaches them, pinned to morphe-patcher 1.15.1. */
    private fun <T> decoded(apk: File, workspace: File, block: (ResourcePatchContext) -> T): T {
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = workspace)
        PatcherConfig::class.java.getMethod("setResourceMode\$morphe_patcher", ResourceMode::class.java)
            .invoke(config, ResourceMode.FULL)
        return Patcher(config).use { patcher ->
            val context = PatcherContext::class.java.getMethod("getResourceContext\$morphe_patcher")
                .invoke(patcher.context) as ResourcePatchContext
            ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                .invoke(context, ResourceMode.FULL)
            block(context)
        }
    }

    /** Every resource's type and number, from the decoded public.xml. */
    private fun ids(res: File): Set<String> =
        parse(File(res, "values/public.xml").readText()).elements("public").mapTo(HashSet()) { "${it.getAttribute("type")}@${it.getAttribute("id")}" }

    private fun encoded(context: ResourcePatchContext): File {
        val result = ResourcePatchContext::class.java.getMethod("get").invoke(context) as PatcherResult.PatchedResources
        return requireNotNull(result.resourcesApk) { "the patcher encoded no resources APK" }
    }
}
