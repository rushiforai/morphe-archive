package app.ytvr.patches

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import java.io.File

/**
 * The supported-version policy, enforced mechanically rather than remembered: at most two normal
 * `AppTarget`s (the latest two), each with a `// Kept: <reason>` comment directly above it, and
 * `SUPPORTED_APP_VERSION` pointing at the newest of them. The test reads `Constants.kt` the same
 * way `scripts/check-upstream-version.mjs` does, so a change that would blind that parser also
 * fails here.
 *
 * The pruning rule exists because the two name-pinned fingerprints (the ad-slot accessors and the
 * seek-bar ids) grow one branch per supported version; an unbounded list makes them unbounded too,
 * and each branch adds cross-version collision risk. The same discipline as Morphe's own target
 * list, which keeps every kept version annotated with why.
 */
class SupportedVersionsPolicyTest {

    private fun constantsKt(): String {
        val relative = "src/main/kotlin/app/ytvr/patches/shared/Constants.kt"
        val fromProject = File(relative)
        val fromRepo = File("patches/$relative")
        val file = when {
            fromProject.isFile -> fromProject

            fromRepo.isFile -> fromRepo

            else -> error(
                "cannot read Constants.kt from ${fromProject.absolutePath} " +
                    "or ${fromRepo.absolutePath}",
            )
        }
        return file.readText()
    }

    /**
     * The `AppTarget(` blocks as a checker sees them: full-line comments stripped first, so the
     * commented-out example in the policy block cannot be parsed as a target. Returns each
     * target's body plus the comment lines immediately above it.
     */
    private fun targets(text: String): List<Pair<String, List<String>>> {
        val lines = text.lines()
        val result = mutableListOf<Pair<String, List<String>>>()
        lines.forEachIndexed { index, line ->
            val trimmed = line.trim()
            if (trimmed.startsWith("AppTarget(")) {
                // Collect the body up to the closing `),`.
                val body = StringBuilder(trimmed)
                var cursor = index + 1
                while (cursor < lines.size && !body.contains(Regex("\\),\\s*$"))) {
                    body.append('\n').append(lines[cursor])
                    cursor++
                }
                // Collect the comment lines directly above (no blank line between).
                val why = mutableListOf<String>()
                var above = index - 1
                while (above >= 0 && lines[above].trim().startsWith("//")) {
                    why.add(lines[above].trim())
                    above--
                }
                result.add(body.toString() to why)
            }
        }
        return result
    }

    private fun isExperimental(body: String) = body.contains("isExperimental")

    private fun versionOf(body: String): String {
        val match = Regex("version\\s*=\\s*\"([^\"]+)\"").find(body)
        return match?.groupValues?.get(1)
            ?: error("an AppTarget without a parseable version: $body")
    }

    @Test
    fun `at most two normal targets are listed`() {
        val normal = targets(constantsKt()).filterNot { isExperimental(it.first) }
        assertTrue(
            normal.size <= 2,
            "${normal.size} normal targets listed: ${normal.map { versionOf(it.first) }} -- the " +
                "policy is the latest two; when a third version is added, drop the oldest in the " +
                "same change",
        )
    }

    @Test
    fun `every normal target says why it is kept`() {
        val withoutReason = targets(constantsKt())
            .filterNot { isExperimental(it.first) }
            .filter { (_, why) -> why.none { it.contains("Kept:") } }
            .map { (body, _) -> versionOf(body) }
        assertTrue(
            withoutReason.isEmpty(),
            "normal target(s) without a '// Kept: <reason>' comment directly above the AppTarget(" +
                "(inside the parens is too late -- the upstream checker's regex cannot cross a " +
                "comment line): $withoutReason",
        )
    }

    @Test
    fun `SUPPORTED_APP_VERSION is the newest normal target`() {
        val text = constantsKt()
        val constant = Regex("const\\s+val\\s+SUPPORTED_APP_VERSION\\s*=\\s*\"([^\"]+)\"")
            .find(text)?.groupValues?.get(1)
            ?: error("SUPPORTED_APP_VERSION not found")
        val newest = targets(text)
            .filterNot { isExperimental(it.first) }
            .map { (body, _) -> versionOf(body) }
            .maxOrNull()
        assertEquals(
            newest,
            constant,
            "SUPPORTED_APP_VERSION drifted from the newest normal AppTarget -- the spoof-app-" +
                "version default and the support pinning must stay single-sourced",
        )
    }
}
