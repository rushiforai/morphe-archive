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
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val WORKER_CLASS = "LX/7je;"

/** The worker as 585 ships it: an instance method on an obfuscated class, taking the context, a request and the session. */
internal const val ATTRIBUTION_WORKER = "$WORKER_CLASS->A02(Landroid/content/Context;LX/7jf;${FB_USER_SESSION}IJZ)V"

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The worker cut down to what every build shares: the Binder fallback's interface name, then the send's failure text. */
private val WORKER_BODY = """
    const-string v0, "$AD_ID_SERVICE"
    const-string v1, "$ATTRIBUTION_SEND_MARK"
    return-void
""".trimIndent()

// this, Context, the request, the session, I, J (two words) and Z are eight parameter words.
private fun worker(
    id: String = ATTRIBUTION_WORKER,
    body: String = WORKER_BODY,
    registers: Int = 10,
    flags: Int = AccessFlags.PUBLIC.value,
): MutableMethod = fixtureMethod(id, body, registers, flags)

/** The worker beside the job's own step that calls it and a helper that names only the send. Neither gets a hook. */
internal fun attributionUploadFixture(workerMethod: MutableMethod = worker()): List<MutableClass> = listOf(
    fixtureClass(workerMethod.definingClass, listOf(
        workerMethod,
        fixtureMethod("${workerMethod.definingClass}->A01($FB_USER_SESSION)V",
            "const-string v0, \"$ATTRIBUTION_SEND_MARK\"\nreturn-void", registers = 3),
    )),
    fixtureClass(LAT_STATUS_JOB, listOf(
        fixtureMethod("$LAT_STATUS_JOB->A00($LAT_STATUS_JOB$FB_USER_SESSION)V", "return-void", flags = STATIC),
    )),
)

private fun Method.code() = implementation!!.instructions.toList()

class AttributionUploadsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(ATTRIBUTION_UPLOADS).map { it.hookId() }

    @Test fun theWorkerIsFoundByTheSessionAndBothRoutesItNames() {
        assertEquals(listOf(ATTRIBUTION_WORKER), found(attributionUploadFixture()))
        validateControls(mirroredControls(attributionUploadFixture()), setOf(ATTRIBUTION_UPLOADS))
    }

    @Test fun aStaticWorkerOnAnyClassIsFoundToo() {
        val id = "LX/Other;->A00($LAT_STATUS_JOB$FB_USER_SESSION)V"
        assertEquals(listOf(id), found(attributionUploadFixture(worker(id = id, registers = 4, flags = STATIC))))
    }

    @Test fun everyProfileHooksOneWorkerOfTheSameShape() {
        // 585 names the worker's class differently per family (7je, 7nN, 7hg), so the method's shape is what every build shares.
        val shape = Regex("""LX/\w+;->A02\(Landroid/content/Context;LX/\w+;${Regex.escape(FB_USER_SESSION)}IJZ\)V""")
        for ((code, profile) in controlProfiles) {
            val hooks = profile.hooks.getValue(ATTRIBUTION_UPLOADS)
            assertEquals(1, hooks.size, "$code")
            assertTrue(shape.matches(hooks.single()), "$code hooks ${hooks.single()}")
        }
        for (profile in listOf(SYNTHETIC_PROFILE, BASE_PROFILE)) {
            assertEquals(setOf(ATTRIBUTION_WORKER), profile.hooks.getValue(ATTRIBUTION_UPLOADS))
            activeProfile = profile
            validateControls(mirroredControls(attributionUploadFixture()), setOf(ATTRIBUTION_UPLOADS))
        }
    }

    @Test fun lookalikesAreNotTheWorker() {
        val cases = mapOf(
            "no Binder fallback" to attributionUploadFixture(worker(body = "const-string v1, \"$ATTRIBUTION_SEND_MARK\"\nreturn-void")),
            "no send" to attributionUploadFixture(worker(body = "const-string v0, \"$AD_ID_SERVICE\"\nreturn-void")),
            "no session" to attributionUploadFixture(worker(id = "$WORKER_CLASS->A02(Landroid/content/Context;LX/7jf;IJZ)V", registers = 9)),
            "returns a value" to attributionUploadFixture(worker(id = ATTRIBUTION_WORKER.dropLast(1) + "Z",
                body = WORKER_BODY.replace("return-void", "const/4 v0, 0x0\nreturn v0"))),
            "two workers" to attributionUploadFixture() + listOf(fixtureClass("LX/Other;", listOf(worker(id = ATTRIBUTION_WORKER.replace(WORKER_CLASS, "LX/Other;"))))),
            "no job" to listOf(fixtureClass("LX/Unrelated;")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(ATTRIBUTION_UPLOADS)) }
        }
    }

    @Test fun theSwitchSkipsTheWholeRunBeforeEitherAdvertisingIdRoute() {
        val method = worker()
        val before = method.code()
        injectControl(ATTRIBUTION_UPLOADS, mapOf(ATTRIBUTION_UPLOADS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAttributionUploads()Z", ((code[0] as ReferenceInstruction).reference).toString())
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(4, code.branchTarget(2))
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        // Off, Pause and safe mode fall through to Messenger's own worker, unchanged.
        assertEquals(before, code.drop(4))
    }

    @Test fun anUnusableWorkerRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            // Eight registers are exactly the parameter words, so v0 would be this.
            "no free register" to worker(registers = 8),
            "no send" to worker(body = "const-string v0, \"$AD_ID_SERVICE\"\nreturn-void"),
            "send helper" to fixtureMethod("$WORKER_CLASS->A01($FB_USER_SESSION)V",
                "const-string v0, \"$ATTRIBUTION_SEND_MARK\"\nreturn-void", registers = 3),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) {
                injectControl(ATTRIBUTION_UPLOADS, mapOf(ATTRIBUTION_UPLOADS to listOf(bad)))
            }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildSkipsTheJobFromItsOneWorker() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val workers = findAttributionUploads(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(ATTRIBUTION_UPLOADS), workers.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(ATTRIBUTION_UPLOADS to workers), setOf(ATTRIBUTION_UPLOADS))
            val method = MutableMethod(workers.single())
            val before = method.code()
            method.injectAttributionUpload()
            val after = method.code()
            assertEquals("$SETTINGS->stopAttributionUploads()Z", ((after[0] as ReferenceInstruction).reference).toString(), code)
            assertEquals(4, after.branchTarget(2), code)
            assertEquals(Opcode.RETURN_VOID, after[3].opcode, code)
            assertEquals(before.map { it.opcode }, after.drop(4).map { it.opcode }, code)
        }
    }
}
