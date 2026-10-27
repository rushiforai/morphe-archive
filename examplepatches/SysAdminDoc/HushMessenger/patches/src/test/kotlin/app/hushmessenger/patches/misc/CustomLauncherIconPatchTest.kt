package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.collectLifecycle
import app.hushmessenger.patches.controls.lifecycleManifest
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.StringOption
import java.io.Closeable
import java.io.File
import java.io.StringReader
import java.nio.file.Files
import java.nio.file.Path
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource
import kotlin.test.*

class CustomLauncherIconPatchTest {
    @TempDir lateinit var dir: File

    private fun xml(text: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(InputSource(StringReader(text.trimIndent())))

    /** Messenger 584.1's adaptive launcher icon as it decodes. */
    private fun stockIcon() = xml("""
        <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
          <background android:drawable="@mipmap/launcher_icon_background"/>
          <foreground android:drawable="@mipmap/launcher_icon_foreground"/>
          <monochrome android:drawable="@mipmap/launcher_icon_monochrome"/>
        </adaptive-icon>
    """)

    private fun Element.child(tag: String): Element =
        (0 until childNodes.length).map { childNodes.item(it) }.filterIsInstance<Element>().single { it.tagName == tag }

    private fun Element.only(): Element =
        (0 until childNodes.length).map { childNodes.item(it) }.filterIsInstance<Element>().single()

    private fun assertRestyled(icon: Document, style: LauncherIconStyle, mono: String = "@mipmap/launcher_icon_monochrome", themed: String = mono) {
        val root = icon.documentElement
        val background = root.child("background")
        val foreground = root.child("foreground")
        assertFalse(background.hasAttribute("android:drawable"))
        assertFalse(foreground.hasAttribute("android:drawable"))
        assertEquals("color", background.only().tagName)
        assertEquals(style.background, background.only().getAttribute("android:color"))
        assertEquals("bitmap", foreground.only().tagName)
        assertEquals(mono, foreground.only().getAttribute("android:src"))
        assertEquals(style.glyph, foreground.only().getAttribute("android:tint"))
        // Themed icons keep working.
        assertEquals(themed, root.child("monochrome").getAttribute("android:drawable"))
    }

    @Test fun bothStylesDrawTheThemedLogoInOneColorOnASolidBackground() {
        for (style in LauncherIconStyle.entries) {
            val icon = stockIcon()
            restyleLauncherIcon(icon, style)
            assertRestyled(icon, style)
        }
        assertEquals("#ffffffff" to "#ff000000", LauncherIconStyle.WHITE_ON_BLACK.glyph to LauncherIconStyle.WHITE_ON_BLACK.background)
        assertEquals("#ff000000" to "#ffffffff", LauncherIconStyle.BLACK_ON_WHITE.glyph to LauncherIconStyle.BLACK_ON_WHITE.background)
    }

    @Test fun inlineLayersAndARestyleOfARestyledIconComeOutTheSame() {
        val icon = xml("""
            <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
              <background><color android:color="#ff123456"/></background>
              <foreground><inset android:drawable="@drawable/x"/></foreground>
              <monochrome android:drawable="@com.facebook.orca:drawable/mono"/>
            </adaptive-icon>
        """)
        restyleLauncherIcon(icon, LauncherIconStyle.BLACK_ON_WHITE)
        assertRestyled(icon, LauncherIconStyle.BLACK_ON_WHITE, "@drawable/mono", "@com.facebook.orca:drawable/mono")
        restyleLauncherIcon(icon, LauncherIconStyle.WHITE_ON_BLACK)
        assertRestyled(icon, LauncherIconStyle.WHITE_ON_BLACK, "@drawable/mono", "@com.facebook.orca:drawable/mono")
    }

    @Test fun refusesAnIconItCantRestyleBeforeChangingIt() {
        val cases = mapOf(
            """<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                 <background android:drawable="@mipmap/b"/><foreground android:drawable="@mipmap/f"/></adaptive-icon>""" to "no themed-icon layer",
            """<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                 <background android:drawable="@mipmap/b"/><foreground android:drawable="@mipmap/f"/>
                 <monochrome android:drawable="@android:drawable/sym_def_app_icon"/></adaptive-icon>""" to "no themed-icon layer",
            """<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                 <foreground android:drawable="@mipmap/f"/><monochrome android:drawable="@mipmap/m"/></adaptive-icon>""" to "no background layer",
            """<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                 <background android:drawable="@mipmap/b"/><monochrome android:drawable="@mipmap/m"/></adaptive-icon>""" to "no foreground layer",
            """<vector xmlns:android="http://schemas.android.com/apk/res/android"/>""" to "isn't an adaptive icon",
        )
        for ((text, reason) in cases) {
            val icon = xml(text)
            val before = icon.documentElement.textContent to icon.getElementsByTagName("*").length
            val failure = assertFailsWith<PatchException>(reason) { restyleLauncherIcon(icon, LauncherIconStyle.WHITE_ON_BLACK) }
            assertContains(failure.message.orEmpty(), reason)
            assertTrue(failure.message.orEmpty().startsWith("$LAUNCHER_ICON_PATCH: "))
            assertTrue(failure.message.orEmpty().endsWith("Nothing was changed."))
            assertEquals(before, icon.documentElement.textContent to icon.getElementsByTagName("*").length, reason)
            assertTrue((0 until icon.getElementsByTagName("*").length).none {
                (icon.getElementsByTagName("*").item(it) as Element).tagName in setOf("color", "bitmap")
            }, reason)
        }
    }

    @Test fun findsTheOneAdaptiveConfigurationOfTheAppIcon() {
        val files = mapOf(
            "res/mipmap-anydpi/launcher_icon.xml" to stockIcon(),
            "res/mipmap-anydpi/launcher_icon_background.xml" to xml("""<shape xmlns:android="http://schemas.android.com/apk/res/android"/>"""),
            "res/mipmap-hdpi/launcher_icon.xml" to xml("""<bitmap xmlns:android="http://schemas.android.com/apk/res/android"/>"""),
            "res/mipmapx/launcher_icon.xml" to stockIcon(),
            "res/drawable/launcher_icon.xml" to stockIcon(),
        )
        val icon = "mipmap" to "launcher_icon"
        assertEquals("res/mipmap*/launcher_icon*.xml", launcherIconGlob(icon))
        assertEquals("res/mipmap-anydpi/launcher_icon.xml", adaptiveIconPath(files.keys.toList(), icon) { files.getValue(it) })

        val none = assertFailsWith<PatchException> { adaptiveIconPath(listOf("res/mipmap-hdpi/launcher_icon.xml"), icon) { files.getValue(it) } }
        assertContains(none.message.orEmpty(), "has no adaptive version")
        assertContains(none.message.orEmpty(), MessengerTarget.supportedApks())
        val twice = files + ("res/mipmap-anydpi-v26/launcher_icon.xml" to stockIcon())
        val two = assertFailsWith<PatchException> { adaptiveIconPath(twice.keys.toList(), icon) { twice.getValue(it) } }
        assertContains(two.message.orEmpty(), "2 adaptive versions")
    }

    @Test fun readsTheApplicationIconAndRefusesASeparateRoundOne() {
        fun manifest(attributes: String) = xml("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.facebook.orca">
              <application $attributes/>
            </manifest>
        """)
        assertEquals("@mipmap/launcher_icon", applicationIcon(manifest("""android:icon="@mipmap/launcher_icon"""")))
        assertEquals("@mipmap/c", applicationIcon(manifest("""android:icon="@mipmap/c" android:roundIcon="@mipmap/c"""")))
        assertContains(assertFailsWith<PatchException> { applicationIcon(manifest("")) }.message.orEmpty(), "no icon")
        assertContains(assertFailsWith<PatchException> {
            applicationIcon(manifest("""android:icon="@mipmap/c" android:roundIcon="@mipmap/r""""))
        }.message.orEmpty(), "separate round icon")
        assertEquals("mipmap" to "launcher_icon", appResource("@com.facebook.orca:mipmap/launcher_icon"))
        assertNull(appResource("@android:mipmap/sym_def_app_icon"))
        assertNull(appResource("#ff000000"))
    }

    @Test fun startsUnselectedWithTwoStylesAndWhiteOnBlackFirst() {
        assertEquals(LAUNCHER_ICON_PATCH, customLauncherIconPatch.name)
        assertFalse(customLauncherIconPatch.default)
        assertEquals(setOf(LAUNCHER_ICON_KEY), customLauncherIconPatch.options.keys)
        val option = customLauncherIconPatch.options.getValue(LAUNCHER_ICON_KEY)
        assertIs<StringOption>(option)
        assertTrue(option.required)
        assertEquals("white-on-black", option.default)
        assertEquals(mapOf("White on black" to "white-on-black", "Black on white" to "black-on-white"), option.values)
        for (raw in listOf("white-on-black", " White on black ", "WHITE-ON-BLACK")) assertEquals(LauncherIconStyle.WHITE_ON_BLACK, launcherIconStyle(raw))
        assertEquals(LauncherIconStyle.BLACK_ON_WHITE, launcherIconStyle("Black on white"))
        for (raw in listOf(null, "", "black", "blue")) {
            val failure = assertFailsWith<PatchException>(raw.toString()) { launcherIconStyle(raw) }
            assertContains(failure.message.orEmpty(), "white-on-black, black-on-white")
        }
        val description = customLauncherIconPatch.description.orEmpty()
        assertContains(description, "Expert mode")
        for (text in listOf(description, option.description.orEmpty())) {
            assertFalse(text.contains('—') || text.contains('–'), text)
        }
    }

    private fun stockApks(): List<Path> {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        return apks
    }

    private fun call(target: Any, name: String, vararg arguments: Any?): Any? =
        target.javaClass.methods.single { it.name == name && it.parameterCount == arguments.size }.invoke(target, *arguments)

    /** Every decoded resource file path in [apk], and a reader for its XML ones, through the patcher's own resource library. */
    private fun <T> withDecodedResources(apk: File, action: (List<String>, (String) -> Document) -> T): T {
        val module = Class.forName("com.reandroid.apk.ApkModule").getMethod("loadApkFile", File::class.java).invoke(null, apk)
        return (module as Closeable).use {
            val pkg = call(call(module, "getTableBlock")!!, "getPackageBlockById", 0x7f)!!
            @Suppress("UNCHECKED_CAST")
            val files = (call(module, "listResFiles") as List<Any>).associateBy { call(it, "buildPath") as String }
            action(files.keys.toList()) { path ->
                val document = call(files.getValue(path), "readAsXmlDocument")!!
                call(document, "setPackageBlock", pkg)
                xml(call(document, "serializeToXml") as String)
            }
        }
    }

    /** Each supported build's app icon is one adaptive icon whose themed layer is a PNG, which a bitmap can draw. Density builds carry one size. */
    @Test fun everyStockBuildHasOneAdaptiveAppIconWithAPngThemedLayer() {
        for (apk in stockApks()) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val icon = appResource(applicationIcon(lifecycleManifest(apk.toFile())))
            assertEquals("mipmap" to "launcher_icon", icon, code)
            withDecodedResources(apk.toFile()) { paths, read ->
                val glob = Regex(launcherIconGlob(icon!!).replace(".", "\\.").replace("*", "[^/]*"))
                val path = adaptiveIconPath(paths.filter { glob.matches(it) }, icon, read)
                val document = read(path)
                val (type, name) = monochromeReference(document)
                val pictures = paths.filter { it.startsWith("res/$type") && it.substringAfterLast('/').substringBeforeLast('.') == name }
                assertTrue(pictures.isNotEmpty() && pictures.all { it.endsWith(".png") && !it.endsWith(".9.png") }, "$code $pictures")
                restyleLauncherIcon(document, LauncherIconStyle.BLACK_ON_WHITE)
                assertRestyled(document, LauncherIconStyle.BLACK_ON_WHITE, "@$type/$name")
            }
        }
    }

    /** The real patcher on the first stock build: the decoded icon is restyled and the rebuilt resources carry it. */
    @Test fun patchingAStockBuildRebuildsTheRestyledIcon() {
        val apk = stockApks().first().toFile()
        val option = customLauncherIconPatch.options.getValue(LAUNCHER_ICON_KEY)
        try {
            customLauncherIconPatch.options.set(LAUNCHER_ICON_KEY, LauncherIconStyle.BLACK_ON_WHITE.key)
            Patcher(PatcherConfig(apk, dir.resolve("patcher"))).use { patcher ->
                patcher += setOf(customLauncherIconPatch)
                val results = collectLifecycle(patcher)
                for (result in results) assertNull(result.exception, result.exception?.stackTraceToString())
                val resources = PatcherContext::class.java.getMethod("getResourceContext\$morphe_patcher")
                    .invoke(patcher.context) as ResourcePatchContext
                val path = adaptiveIconPath(resources.decode(launcherIconGlob("mipmap" to "launcher_icon")), "mipmap" to "launcher_icon") {
                    DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(resources.get(it))
                }
                assertRestyled(DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(resources.get(path)), LauncherIconStyle.BLACK_ON_WHITE)
                val output = patcher.get()
                output.dexFiles.forEach { it.stream.close() }
                withDecodedResources(assertNotNull(output.resources.resourcesApk)) { paths, read ->
                    val built = paths.filter { it.substringAfterLast('/') == "launcher_icon.xml" }.map(read)
                        .single { it.documentElement.tagName == "adaptive-icon" }
                    assertRestyled(built, LauncherIconStyle.BLACK_ON_WHITE)
                }
            }
        } finally {
            option.reset()
        }
    }
}
