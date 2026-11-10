package dev.utaa.linimal.patches.features.theme

import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class AmoledThemeResourcePatchTest {
    private val defaults = mapOf(
        "linegray870" to "#ff1a1a1a",
        "linegray900" to "#ff111111",
        "lineblack" to "#ff000000",
    )

    private fun lineNight(): MutableMap<String, String> = linkedMapOf(
        "primaryBackground" to "@color/linegray900",
        "primarySurface" to "@color/linegray900",
        "secondaryAltBackground" to "@color/linegray900",
        "tertiaryAltBackground" to "@color/linegray900",
        "splashBackground" to "@color/linegray900",
        "statusbarBackground" to "@color/linegray900",
        "chatBackground" to "@color/linegray870",
    )

    @Test
    fun `LINE 26_16_0 の夜間の背景色をすべて確認できる`() {
        val check = checkAmoledThemeTargets(defaults, lineNight())
        assertEquals(AMOLED_THEME_TARGETS.size, check.found)
        assertEquals(emptyList(), check.mismatched)
    }

    @Test
    fun `直書きの値や夜間設定内の参照もたどる`() {
        val night = lineNight()
        night["primaryBackground"] = "#111111"
        night["statusbarBackground"] = "@color/primaryBackground"
        val check = checkAmoledThemeTargets(defaults, night)
        assertEquals(AMOLED_THEME_TARGETS.size, check.found)
        assertEquals(emptyList(), check.mismatched)
    }

    @Test
    fun `欠けた色は件数に数えず、想定と違う値は不一致にする`() {
        val night = lineNight()
        night.remove("chatBackground")
        night["linegray900"] = "#ff222222"
        night["primaryBackground"] = "#ff111111"
        night["primarySurface"] = "@color/lineblack"
        night["splashBackground"] = "@color/missing"
        val check = checkAmoledThemeTargets(defaults, night)
        assertEquals(AMOLED_THEME_TARGETS.size - 1, check.found)
        assertEquals(
            listOf("primarySurface", "secondaryAltBackground", "tertiaryAltBackground", "splashBackground",
                "statusbarBackground", "linegray900"),
            check.mismatched,
        )
    }

    @Test
    fun `参照が循環しても止まり、不一致にする`() {
        val night = lineNight()
        night["primaryBackground"] = "@color/primarySurface"
        night["primarySurface"] = "@color/primaryBackground"
        val check = checkAmoledThemeTargets(defaults, night)
        assertEquals(listOf("primaryBackground", "primarySurface"), check.mismatched)
    }

    @Test
    fun `colors xml から名前と値を読む`() {
        val xml = """<resources><color name="a">#ff000000</color><color name="b"> @color/a </color><dimen name="c">1dp</dimen></resources>"""
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
            .parse(xml.byteInputStream())
        assertEquals(mapOf("a" to "#ff000000", "b" to "@color/a"), colorValues(document.documentElement))
    }

    @Test
    fun `drawable は画像ファイルがあるものだけ数える`() {
        val res = kotlin.io.path.createTempDirectory("amoled-res").toFile()
        try {
            File(res, "drawable-xxhdpi").mkdirs()
            File(res, "drawable-xxhdpi/navi_bottom_bg.webp").writeText("")
            File(res, "drawable").mkdirs()
            File(res, "drawable/navi_bottom_bg_dark.xml").writeText("")
            File(res, "layout").mkdirs()
            File(res, "layout/navi_bottom_bg_dark.png").writeText("")
            assertEquals(0, countAmoledThemeDrawables(res))

            File(res, "drawable-xxhdpi/navi_bottom_bg_dark.webp").writeText("")
            assertEquals(1, countAmoledThemeDrawables(res))

            File(res, "drawable-xhdpi").mkdirs()
            File(res, "drawable-xhdpi/navi_bottom_bg_dark.9.png").writeText("")
            assertEquals(1, countAmoledThemeDrawables(res))
        } finally {
            res.deleteRecursively()
        }
    }

    /** runtime が黒にする resource と、ここで確認する resource が同じ一覧であることを、Java ソースを読んで確かめます。 */
    @Test
    fun `runtime の対象の一覧と一致する`() {
        val source = extensionSource(RUNTIME_COLORS_PATH).readText()
        assertEquals(AMOLED_THEME_TARGETS.keys.toList(), runtimeList(source, "List<String> NAMES = "))
        assertEquals(AMOLED_THEME_DRAWABLES, runtimeList(source, "List<String> DRAWABLE_NAMES = "))
    }

    private fun runtimeList(source: String, declaration: String): List<String> {
        assertTrue(declaration in source, declaration)
        val block = source.substringAfter(declaration).substringBefore(");")
        return Regex("\"([A-Za-z0-9_]+)\"").findAll(block).map { it.groupValues[1] }.toList()
    }

    private fun extensionSource(relative: String): File {
        var directory: File? = File(".").absoluteFile
        while (directory != null) {
            val candidate = File(directory, relative)
            if (candidate.isFile) return candidate
            directory = directory.parentFile
        }
        error("$relative が見つかりませんでした。")
    }

    private companion object {
        const val RUNTIME_COLORS_PATH = "extensions/linimal/src/main/java/dev/utaa/linimal/extension/" +
            "features/theme/AmoledThemeColors.java"
    }
}
