package app.ytvr.patches

import app.ytvr.extension.VerboseLog
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.PrintStream
import java.nio.charset.StandardCharsets
import java.nio.file.Files

/**
 * The log gate: the one thing the whole "quiet release" promise rests on. Ported from the
 * build/probe `VerboseLogCheck` harness so it runs on every build.
 *
 * The gate cannot be opened through its real entry points here -- `init` and
 * `setDefaultEnabled` both need an app context and a preference file, and a fake `Context`
 * cannot be built against `android.jar` (its `ContextWrapper` constructor is a stub) -- so this
 * pins the decisions that need no device:
 *
 *  1. a fresh process prints nothing through the helper (a build nobody has touched is silent);
 *  2. the build's own default alone does *not* open the gate: until the preference file has been
 *     read there is no answer to "did the viewer turn this off?", and the documented failure mode
 *     is that a gate which cannot be read stays closed;
 *  3. with the gate open the helper prints exactly `<tag>: <message>`, and closing it silences
 *     the same call again;
 *  4. the row's own toggle path opens it immediately, with no preference file involved.
 */
class VerboseLogGateTest {

    private fun capture(): String {
        val saved = System.out
        val buffer = ByteArrayOutputStream()
        System.setOut(PrintStream(buffer, true))
        try {
            VerboseLog.log("SponsorBlock", "effective: sponsor=skip-once")
        } finally {
            System.setOut(saved)
        }
        return buffer.toString().replace("\r\n", "\n")
    }

    private fun setGate(value: Boolean) {
        val field = VerboseLog::class.java.getDeclaredField("enabled")
        field.isAccessible = true
        field.setBoolean(null, value)
    }

    private fun expectSilent(what: String, printed: String) {
        assertEquals("", printed, "$what -- but it wrote \"${printed.replace("\n", "\\n")}\"")
    }

    @Test
    fun `the gate lifecycle`() {
        // 1. A fresh process prints nothing.
        expectSilent("a fresh process prints nothing", capture())

        // 2. The build's own default does not open it.
        VerboseLog.setDefaultEnabled(true)
        expectSilent("the build's own default keeps the gate shut until the row is read", capture())

        // 3. Open, print, close.
        setGate(true)
        assertEquals(
            "SponsorBlock: effective: sponsor=skip-once\n",
            capture(),
            "an open gate must print exactly '<tag>: <message>'",
        )
        setGate(false)
        expectSilent("closing the gate silences the same call again", capture())

        // 4. The row's own path: the in-app switch calls this, so the gate must follow
        //    immediately, with no preference file involved (the row persists separately).
        VerboseLog.setEnabled(true)
        assertTrue(capture().isNotEmpty(), "the row's toggle must open the gate")
        VerboseLog.setEnabled(false)
        expectSilent("the row's toggle closes it again", capture())
    }

    /**
     * The literal two languages have to agree on: the row's key in `VerboseLog` is the key
     * `SettingsXml.kt` writes into the hub's XML. A drift there is silent -- the row would
     * toggle nothing -- so the Kotlin file is read and checked.
     */
    @Test
    fun `SettingsXml declares the key VerboseLog reads`() {
        val relative = "src/main/kotlin/app/ytvr/patches/sponsorblock/SettingsXml.kt"
        val fromProject = File(relative)
        val fromRepo = File("patches/$relative")
        val file = when {
            fromProject.isFile -> fromProject

            fromRepo.isFile -> fromRepo

            else -> error(
                "cannot read SettingsXml.kt from ${fromProject.absolutePath} " +
                    "or ${fromRepo.absolutePath}",
            )
        }
        val declaration = "private const val VERBOSE_LOGGING_KEY = \"${VerboseLog.KEY_VERBOSE_LOGGING}\""
        val xml = String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8)
        assertTrue(
            xml.contains(declaration),
            "SettingsXml.kt does not declare '$declaration' -- the verbose row would toggle nothing",
        )
    }
}
