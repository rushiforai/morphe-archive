/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.InternalApi
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.TableBlock
import com.reandroid.arsc.chunk.xml.ResXmlDocument
import com.reandroid.arsc.value.DataType
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.experimental.categories.Category
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

/** The launch screen theme and pictures added to each declared APK's resources, encoded and read back. */
@Category(FixtureTests::class)
class CustomSplashLogoFixtureTest {
    @Rule
    @JvmField
    val temporary = TemporaryFolder()

    @Test
    fun `each declared APK's launcher wears the launch theme the logo theme builds on`() {
        for (build in Fixtures.declaredBuilds()) {
            val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                .parse(ByteArrayInputStream(Fixtures.manifest(build).toByteArray())).documentElement
            fun components(tag: String) = manifest.getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
            val activities = components("activity").associateBy { it.getAttribute("android:name") }
            val launchers = (components("activity") + components("activity-alias")).filter { component ->
                val categories = component.getElementsByTagName("category")
                (0 until categories.length).any {
                    (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                }
            }
            assertTrue("${build.name}: a launcher", launchers.isNotEmpty())
            for (launcher in launchers) {
                val target = launcher.getAttribute("android:targetActivity").ifEmpty { null }?.let { activities[it] } ?: launcher
                val theme = launcher.getAttribute("android:theme").ifEmpty { target.getAttribute("android:theme") }
                assertTrue("${build.name}: ${launcher.getAttribute("android:name")} wears $theme", theme.endsWith("style/$PINTEREST_LAUNCH_THEME"))
            }
        }
    }

    @Test
    fun `the patch switches its status on`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        customSplashLogoPatch.execute(context)
        assertEquals(1, flag(context, "customSplashLogo"))
    }

    /** Reads the encoded resources back the way the patcher hands them on, through its internal [ResourcePatchContext.get]. */
    @OptIn(InternalApi::class)
    @Test
    fun `each declared APK takes the theme, the mark and HushPinterest's logo and keeps every resource id`() {
        for (build in Fixtures.declaredBuilds()) {
            val base = Fixtures.baseApk(build)
            val stock = ApkModule.loadApkFile(base).use { names(it.tableBlock) }
            val work = temporary.newFolder()
            val config = PatcherConfig(apkFile = base, temporaryFilesPath = File(work, "patcher"))
            // The patcher sets this when a patch reads resources; get() encodes only in FULL mode.
            PatcherConfig::class.java.getMethod("setResourceMode\$morphe_patcher", ResourceMode::class.java)
                .invoke(config, ResourceMode.FULL)
            ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
                ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                    .invoke(context, ResourceMode.FULL)
                context.addSplashLogo(null)
                val patched = context.get()
                ApkModule.loadApkFile(patched.resourcesApk).use { module ->
                    val table = module.tableBlock
                    val after = names(table)
                    val added = (after.keys - stock.keys).sorted()
                    assertEquals(
                        "${build.name}: the three added, ${added.joinToString { "0x%08x %s".format(it, after[it]) }}",
                        setOf("style/$SPLASH_LOGO_THEME", "drawable/$SPLASH_MARK", "drawable/$SPLASH_LOGO"),
                        added.map { after.getValue(it) }.toSet(),
                    )
                    assertEquals("${build.name}: nothing lost", emptySet<Int>(), stock.keys - after.keys)
                    // Any full decode gives Pinterest's over-long token names (integer, id, color) a
                    // generated one like integer/integer_0x7f0b00b1; that's the patcher's, with or without this patch.
                    val changed = stock.filter { (id, name) -> after[id] != name && after[id] != generatedName(name, id) }
                    assertTrue("${build.name}: renamed: ${changed.entries.take(5)}", changed.isEmpty())

                    val stockIds = stock.entries.associate { (id, name) -> name to id }
                    val afterIds = after.entries.associate { (id, name) -> name to id }
                    val mark = afterIds.getValue("drawable/$SPLASH_MARK")
                    val theme = table.getLocalResource("style", SPLASH_LOGO_THEME).get().resTableMapEntry
                    assertEquals("${build.name}: built on Pinterest's launch theme", stockIds.getValue("style/$PINTEREST_LAUNCH_THEME"), theme.parentId)
                    val items = theme.listResValueMap()
                    assertEquals(
                        "${build.name}: both icon attributes",
                        setOf(stockIds.getValue("attr/$SPLASH_ICON"), ANDROID_SPLASH_ICON_ID),
                        items.map { it.nameId }.toSet(),
                    )
                    for (item in items) {
                        assertEquals(build.name, DataType.REFERENCE, item.dataType)
                        assertEquals(build.name, mark, item.data)
                    }

                    val markFile = table.getLocalResource("drawable", SPLASH_MARK).get().resValue.dataAsString
                    val inset = ResXmlDocument().apply { readBytes(module.getInputSource(markFile).openStream()) }.documentElement
                    assertEquals("inset", inset.name)
                    val values = inset.attributes.asSequence().associate { it.name to it }
                    assertEquals(DataType.REFERENCE, values.getValue("drawable").dataType)
                    assertEquals(afterIds.getValue("drawable/$SPLASH_LOGO"), values.getValue("drawable").data)
                    for (side in listOf("insetLeft", "insetRight", "insetTop", "insetBottom")) {
                        val value = values.getValue(side)
                        assertEquals("${build.name}: $side", DataType.FRACTION, value.dataType)
                        assertEquals("${build.name}: $side is a fraction of the icon, not of its parent", 0, value.data and 0xF)
                        assertEquals("${build.name}: $side", 1.0 / 6, complexToFloat(value.data), 1e-4)
                    }

                    val logoFile = table.getLocalResource("drawable", SPLASH_LOGO).get().resValue.dataAsString
                    val logo = module.getInputSource(logoFile)?.openStream()?.use { it.readBytes() }
                        ?: File(patched.otherResources, logoFile).readBytes()
                    assertArrayEquals("${build.name}: the bundled mark as it is", bundledLogo(), logo)
                }
            }
        }
    }

    /**
     * Each resource id that holds an entry, with its type/name. The patcher's id allocator leaves
     * empty slots (no name, no value) around the ids it hands out, which Android treats as absent.
     */
    private fun names(table: TableBlock): Map<Int, String> {
        val names = HashMap<Int, String>()
        for (entry in table.resources) if (!entry.isEmpty) names[entry.resourceId] = "${entry.type}/${entry.name}"
        return names
    }

    private fun generatedName(name: String, id: Int): String {
        val type = name.substringBefore('/')
        return "$type/${type}_0x%08x".format(id)
    }

    /** TypedValue.complexToFloat, from Android's own source. */
    private fun complexToFloat(data: Int): Double =
        (data and 0xFFFFFF00.toInt()).toDouble() * RADIX_MULTS[(data shr 4) and 3]

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** android.R.attr.windowSplashScreenAnimatedIcon. */
        const val ANDROID_SPLASH_ICON_ID = 0x0101062d
        val RADIX_MULTS = doubleArrayOf(1.0 / (1 shl 8), 1.0 / (1 shl 15), 1.0 / (1 shl 23), 1.0 / (1L shl 31))
    }
}
