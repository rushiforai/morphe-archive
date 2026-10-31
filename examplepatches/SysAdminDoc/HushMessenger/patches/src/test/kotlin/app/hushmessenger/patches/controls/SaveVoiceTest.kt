package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotEquals

private const val AUDIO_FETCHER = "LX/W81;"
private const val AUDIO_REQUEST = "LX/W85;"

/** The synthetic label for the voice message download, named after the first build it was found in. */
internal const val VOICE_DOWNLOAD = "LX/W81;->A00($FB_USER_SESSION$AUDIO_FETCHER$AUDIO_REQUEST)Landroid/net/Uri;"

/**
 * The download cut down to what every build shares: a cached file goes straight to the one return, and anything else
 * is fetched under "Download audio" and jumps back to it.
 */
private val DOWNLOAD_BODY = """
    if-eqz v4, :fetch
    const/4 v1, 0x0
    :done
    return-object v1
    :fetch
    const-string v0, "$DOWNLOAD_AUDIO"
    const/4 v1, 0x0
    goto :done
""".trimIndent()

private fun download(
    id: String = VOICE_DOWNLOAD,
    body: String = DOWNLOAD_BODY,
    registers: Int = 5,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
): MutableMethod = fixtureMethod(id, body, registers, flags)

/** The fetcher's other step, which plays the same request on a background thread and names no download. */
private fun backgroundPlay() = download("$AUDIO_FETCHER->A02($FB_USER_SESSION$AUDIO_FETCHER$AUDIO_REQUEST)Landroid/net/Uri;", body = """
    invoke-static {v2, v3, v4}, $VOICE_DOWNLOAD
    move-result-object v1
    return-object v1
""".trimIndent())

internal fun saveVoiceFixture(downloadMethod: MutableMethod = download()): List<MutableClass> =
    listOf(fixtureClass(AUDIO_FETCHER, listOf(downloadMethod, backgroundPlay())))

private fun Method.code() = implementation!!.instructions.toList()

class SaveVoiceTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(SAVE_VOICE).map { it.hookId() }

    @Test fun theDownloadIsFoundByItsShape() {
        assertEquals(listOf(VOICE_DOWNLOAD), found(saveVoiceFixture()))
        validateControls(mirroredControls(saveVoiceFixture()), setOf(SAVE_VOICE))
    }

    @Test fun lookalikesAreNotTheDownload() {
        val cases = mapOf(
            "not static" to saveVoiceFixture(download(flags = AccessFlags.PUBLIC.value)),
            "no session" to saveVoiceFixture(download(id = VOICE_DOWNLOAD.replace(FB_USER_SESSION, "Landroid/content/Context;"))),
            "another fetcher" to saveVoiceFixture(download(id = VOICE_DOWNLOAD.replace("$FB_USER_SESSION$AUDIO_FETCHER", "$FB_USER_SESSION$AUDIO_REQUEST"))),
            "a primitive request" to saveVoiceFixture(download(id = VOICE_DOWNLOAD.replace("$AUDIO_REQUEST)", "I)"))),
            "two parameters" to saveVoiceFixture(download(id = VOICE_DOWNLOAD.replace(AUDIO_REQUEST, ""), registers = 4,
                body = DOWNLOAD_BODY.replace("v4", "v3"))),
            "returns a file" to saveVoiceFixture(download(id = VOICE_DOWNLOAD.replace("Landroid/net/Uri;", "Ljava/io/File;"))),
            "another download" to saveVoiceFixture(download(body = DOWNLOAD_BODY.replace(DOWNLOAD_AUDIO, "Download image"))),
            "two returns" to saveVoiceFixture(download(body = DOWNLOAD_BODY.replace("goto :done", "return-object v1"))),
            "only the background step" to listOf(fixtureClass(AUDIO_FETCHER, listOf(backgroundPlay()))),
        )
        for ((case, classes) in cases) {
            assertEquals(emptyList<String>(), found(classes), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(SAVE_VOICE)) }
        }
    }

    @Test fun twoDownloadsAreTooManyToTrust() {
        val second = fixtureClass("LX/W82;", listOf(download(id = VOICE_DOWNLOAD.replace(AUDIO_FETCHER, "LX/W82;"))))
        assertEquals(emptyList<String>(), found(saveVoiceFixture() + second))
    }

    @Test fun theUriGoesPastTheExtensionOnItsWayOut() {
        val method = download()
        val before = method.code()
        injectControl(SAVE_VOICE, mapOf(SAVE_VOICE to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 1, code.size)
        val call = code[2]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(VOICE_PLAYED, (call as ReferenceInstruction).reference.toString())
        assertEquals(1, (call as RegisterRangeInstruction).startRegister)
        assertEquals(1, call.registerCount)
        assertEquals(Opcode.RETURN_OBJECT, code[3].opcode)
        assertEquals(1, (code[3] as OneRegisterInstruction).registerA)
        assertEquals(2, code.branchTarget(code.indexOfFirst { it.opcode == Opcode.GOTO }), "The fetched voice message passes the extension too")
        assertEquals(4, code.branchTarget(0))
        assertEquals(1, code.count { it.opcode == Opcode.RETURN_OBJECT })
        // Everything else is Messenger's own code, unchanged.
        assertEquals(before.map { it.opcode }.filter { it != Opcode.RETURN_OBJECT },
            code.map { it.opcode }.filter { it != Opcode.RETURN_OBJECT && it != Opcode.INVOKE_STATIC_RANGE })
    }

    @Test fun anUnusableDownloadRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "the background step" to backgroundPlay(),
            "another download" to download(body = DOWNLOAD_BODY.replace(DOWNLOAD_AUDIO, "Download image")),
            "two returns" to download(body = DOWNLOAD_BODY.replace("goto :done", "return-object v1")),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(SAVE_VOICE, mapOf(SAVE_VOICE to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksItsOneDownload() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val downloads = findSaveVoice(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(SAVE_VOICE), downloads.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(SAVE_VOICE to downloads), setOf(SAVE_VOICE))
            val method = MutableMethod(downloads.single())
            val before = method.code()
            val ret = before.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            val uri = (before[ret] as OneRegisterInstruction).registerA
            method.injectSaveVoice()
            val after = method.code()
            assertEquals(VOICE_PLAYED, (after[ret] as ReferenceInstruction).reference.toString(), code)
            assertEquals(uri, (after[ret] as RegisterRangeInstruction).startRegister, code)
            assertEquals(Opcode.RETURN_OBJECT, after[ret + 1].opcode, code)
            assertEquals(uri, (after[ret + 1] as OneRegisterInstruction).registerA, code)
            // Every jump that reached the return now reaches the call first.
            for (i in after.indices) assertNotEquals(ret + 1, after.branchTarget(i), "$code jump at $i skips the copy")
        }
    }
}
