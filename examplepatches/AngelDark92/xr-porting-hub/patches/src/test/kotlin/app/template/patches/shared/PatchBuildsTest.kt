package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class PatchBuildsTest {
    private fun compat(version: String, code: Int) = Compatibility(
        name = "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(
            version = version,
            versionCodes = SupportedAbi.entries.associateWith { code },
            description = "test",
        )),
    )

    private val all = listOf(
        "2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968, "2.0.22" to 5002244,
        "2.0.23" to 5002363, "2.0.24" to 5002395, "2.0.24" to 5002527,
    )

    @Test
    fun `short lists keep the version grouped format`() {
        assertEquals("Build: 2.0.23/5002363.", buildLabel(listOf(compat("2.0.23", 5002363))))
        assertEquals(
            "Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395.",
            buildLabel(all.take(6).map { (v, c) -> compat(v, c) }),
        )
    }

    @Test
    fun `lists over the line budget fall back to every exact code`() {
        val label = buildLabel(all.map { (v, c) -> compat(v, c) })
        assertEquals("Builds: 5001712, 5001812, 5001968, 5002244, 5002363, 5002395, 5002527.", label)
        assertTrue(label.length <= 99, "${label.length}")
        // Same code set as the compatibility source: nothing dropped, nothing invented.
        assertEquals(all.map { it.second }.toSet(), Regex("\\d{4,}").findAll(label).map { it.value.toInt() }.toSet())
    }

    @Test
    fun `fallback is chosen only when the verbose label exceeds the limit`() {
        val verbose = "Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, " +
            "2.0.23/5002363, 2.0.24 (5002395, 5002527)."
        assertTrue(verbose.length > MAX_VERBOSE_BUILD_LABEL)
        assertTrue(buildLabel(all.map { (v, c) -> compat(v, c) }) != verbose)
    }
}
