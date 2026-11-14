package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The button base, a built button, the bar's call wrapper and its callback, as Redex names them in 587 (354 family). */
private const val BASE = "LX/5cC;"
private const val BUTTON = "LX/5TW;"
private const val WRAPPER = "LX/9qK;"
private const val CALLBACK = "LX/6eW;"
private const val FB_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
internal const val SYNTHETIC_AUDIO_BUILDER = "LX/5Ro;->A00(LX/4wC;$THREAD_KEY_TYPE$MIG_SCHEME$CALLBACK" + "Z)$WRAPPER"
internal const val SYNTHETIC_VIDEO_BUILDER = "LX/5mw;->A00($FB_SESSION$THREAD_KEY_TYPE$MIG_SCHEME$CALLBACK)$WRAPPER"
private const val TABLE = "LX/189;->A00(I)Ljava/lang/String;"
private val ABSTRACT =AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value

/** A builder as 587 has it, cut down: eight registers, the callback in p3, the button built, wrapped and returned. */
private fun body(tag: String, wrapper: String = WRAPPER) = """
    new-instance v1, $BUTTON
    const-string v2, "$tag"
    invoke-direct {v1, v2}, $BUTTON-><init>(Ljava/lang/String;)V
    new-instance v0, $wrapper
    invoke-direct {v0, v1, p3}, $wrapper-><init>($BASE$CALLBACK)V
    return-object v0
""".trimIndent()

private fun builder(id: String, body: String) = fixtureMethod(id, body, 8, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
private fun audio(body: String = body("audio_call_button"), id: String = SYNTHETIC_AUDIO_BUILDER) = builder(id, body)
private fun video(body: String = body("video_call_button"), id: String = SYNTHETIC_VIDEO_BUILDER) = builder(id, body)

private fun classes(
    audio: MutableMethod? = audio(),
    video: MutableMethod? = video(),
    baseFlags: Int = ABSTRACT,
    wrapperBase: String = BASE,
    wrapper: Boolean = true,
    extra: List<MutableClass> = emptyList(),
): List<MutableClass> = listOfNotNull(audio, video).map { fixtureClass(it.definingClass, listOf(it)) } + extra +
    listOf(fixtureClass(BASE, flags = baseFlags), fixtureClass(BUTTON, superclass = BASE)) +
    listOfNotNull(fixtureClass(WRAPPER, superclass = wrapperBase).takeIf { wrapper })

/** Both builders, the base, a button and the wrapper, for the complete discovery fixture. */
internal fun callButtonBuiltFixture(): List<MutableClass> = classes()

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class CallButtonBuiltTest {
    @BeforeTest @AfterTest fun synthetic() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun findsBothBuilders() {
        val both = listOf(SYNTHETIC_AUDIO_BUILDER, SYNTHETIC_VIDEO_BUILDER)
        assertEquals(both, findCallButtonBuilt(callButtonBuiltFixture(), emptyMap()).map { it.hookId() })
        assertEquals(both, mirroredControls(callButtonBuiltFixture()).getValue(CALL_BUTTON_BUILT).map { it.hookId() })
        validateControls(mirroredControls(callButtonBuiltFixture()), setOf(CALL_BUTTON_BUILT))
        assertEquals(both.toSet(), SYNTHETIC_PROFILE.hooks.getValue(CALL_BUTTON_BUILT))
        assertEquals(0, audio().callButtonReturn())
    }

    /** 280 looks the video tag up in a string table instead of loading it as a literal. */
    @Test fun aTagFromAStringTableCounts() {
        val tabled = video(body("video_call_button").replace("const-string v2, \"video_call_button\"",
            "const/16 v2, 0xf7\ninvoke-static {v2}, $TABLE\nmove-result-object v2"))
        val tables = mapOf(TABLE to mapOf(0xf7 to "video_call_button"))
        assertEquals(listOf(SYNTHETIC_AUDIO_BUILDER, SYNTHETIC_VIDEO_BUILDER),
            findCallButtonBuilt(classes(video = tabled), tables).map { it.hookId() })
        assertTrue(findCallButtonBuilt(classes(video = tabled), emptyMap()).isEmpty(), "no table, no video tag")
        assertTrue(findCallButtonBuilt(classes(video = tabled), mapOf(TABLE to mapOf(0xf8 to "video_call_button"))).isEmpty(), "another key")
    }

    @Test fun lookalikesAreNotFound() {
        val otherWrapper = "LX/9qL;"
        val returnAt = "return-object v0"
        val cases = mapOf(
            "no audio tag" to classes(audio(body("audio_call_button").replace("const-string v2, \"audio_call_button\"", "const/4 v2, 0x0"))),
            "no video builder" to classes(video = null),
            "both tags in one builder" to classes(audio(body("audio_call_button").replace("new-instance v0",
                "const-string v2, \"video_call_button\"\nnew-instance v0"))),
            "two audio builders" to classes(extra = listOf(fixtureClass("LX/5Rp;", listOf(audio(id = SYNTHETIC_AUDIO_BUILDER.replace("LX/5Ro;", "LX/5Rp;")))))),
            "a branch to the return" to classes(audio("if-eqz p3, :done\n" + body("audio_call_button").replace(returnAt, ":done\n$returnAt"))),
            "two returns" to classes(audio("if-eqz p3, :other\n" + body("audio_call_button") + "\n:other\nconst/4 v0, 0x0\n$returnAt")),
            "something between the wrapper and the return" to classes(audio(body("audio_call_button").replace(returnAt, "const/4 v2, 0x0\n$returnAt"))),
            "the button returned bare" to classes(audio(body("audio_call_button").replace(returnAt, "return-object v1"))),
            "no thread key" to classes(audio(id = SYNTHETIC_AUDIO_BUILDER.replace(THREAD_KEY_TYPE, "Ljava/lang/Object;"))),
            "no Mig scheme" to classes(video = video(id = SYNTHETIC_VIDEO_BUILDER.replace(MIG_SCHEME, "Ljava/lang/Object;"))),
            "different wrappers" to classes(video = video(body("video_call_button", otherWrapper), SYNTHETIC_VIDEO_BUILDER.replace(")$WRAPPER", ")$otherWrapper")),
                extra = listOf(fixtureClass(otherWrapper, superclass = BASE))),
            "a base that isn't abstract" to classes(baseFlags = AccessFlags.PUBLIC.value),
            "an interface base" to classes(baseFlags = ABSTRACT or AccessFlags.INTERFACE.value),
            "a wrapper outside the base" to classes(wrapperBase = "Ljava/lang/Object;"),
            "no wrapper class" to classes(wrapper = false),
        )
        for ((case, classes) in cases) {
            assertTrue(findCallButtonBuilt(classes, emptyMap()).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CALL_BUTTON_BUILT)) }
        }
    }

    @Test fun aChangedBuilderIsRefusedAndLeftAsItWas() {
        val method = audio(body("audio_call_button").replace("return-object v0", "const/4 v2, 0x0\nreturn-object v0"))
        val before = method.code()
        assertFailsWith<PatchException> { method.validateCallButtonBuilt() }
        assertFailsWith<PatchException> { method.injectCallButtonBuilt() }
        assertEquals(before, method.code())
    }

    @Test fun theWrapperGoesToTheExtensionRightBeforeTheReturn() {
        for (method in listOf(audio(), video())) {
            val before = method.code()
            method.injectCallButtonBuilt()
            assertHook(before, method.code(), method.name)
        }
    }

    /** Every build at once, so one run names every build whose builders moved. */
    @Test fun everySupportedBuildHooksBothCallButtonBuilders() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val wrong = mutableListOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            activeProfile = controlProfileFor(code)
            val hooks = findCallButtonBuilt(classes, redexStringTables(classes))
            if (hooks.map { it.hookId() }.toSet() != activeProfile.hooks.getValue(CALL_BUTTON_BUILT)) {
                wrong += "$code: ${hooks.map { it.hookId() }}"
                continue
            }
            validateControls(mapOf(CALL_BUTTON_BUILT to hooks), setOf(CALL_BUTTON_BUILT))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                method.injectCallButtonBuilt()
                assertHook(before, method.code(), "$code ${hook.hookId()}")
            }
        }
        assertTrue(wrong.isEmpty(), wrong.joinToString("\n"))
    }

    /** One range call hands the returned wrapper to the extension right before the return, and nothing stock changes. */
    private fun assertHook(before: List<Instruction>, after: List<Instruction>, label: String) {
        val at = before.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
        val returned = (before[at] as OneRegisterInstruction).registerA
        assertEquals(before.size + 1, after.size, label)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode, label)
        assertEquals(CALL_CONFIRM_BUILT, after[at].reference(), label)
        val call = after[at] as RegisterRangeInstruction
        assertEquals(listOf(returned, 1), listOf(call.startRegister, call.registerCount), label)
        assertStockKept(before, after.take(at) + after.drop(at + 1), label)
    }
}
