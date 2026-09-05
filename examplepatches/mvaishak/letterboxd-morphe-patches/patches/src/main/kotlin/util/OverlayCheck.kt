package util

import app.template.patches.letterboxd.theme.ACCENT_OVERLAYS
import app.template.patches.letterboxd.theme.buildColorOverlay
import com.reandroid.arsc.chunk.TableBlock
import java.io.File

fun main() {
    val decoded = "/Users/mvaishak/Downloads/letterboxd-decoded"
    val manifest = File("$decoded/AndroidManifest.xml")
    val public = File("$decoded/res/values/public.xml")
    val dir = File("/Users/mvaishak/.claude/jobs/199c96a8/tmp/ovcheck"); dir.mkdirs()

    val oled = mapOf(
        "gray0D1012" to "#FF000000", "gray181C20" to "#FF000000", "windowBackground" to "#FF000000",
        "gray202830" to "#FF121212", "gray334455" to "#FF2E2E2E", "gray445566" to "#FF2E2E2E",
    )
    for ((name, colors) in listOf("oled" to oled) + ACCENT_OVERLAYS.toList()) {
        val out = File(dir, "$name.arsc")
        buildColorOverlay(manifest, public, "com.letterboxd.letterboxd", out, colors)
        val t = TableBlock.load(out)
        println("$name: ${out.length()}B, pkgs=${t.packageArray.size()}, colorAccent name=${t.getResource(0x7f060066)?.name}")
    }
}
