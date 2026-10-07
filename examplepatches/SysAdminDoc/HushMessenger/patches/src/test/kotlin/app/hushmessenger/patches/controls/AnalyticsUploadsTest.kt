package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val ALARM = "Lcom/facebook/analytics2/logger/legacy/uploader/AlarmBasedUploadService;"
private const val LOLLIPOP = "Lcom/facebook/analytics2/logger/legacy/uploader/LollipopUploadService;"
private const val SAFE = "Lcom/facebook/analytics2/logger/service/LollipopUploadSafeService;"
private const val PLAY = "Lcom/facebook/analytics2/logger/GooglePlayUploadService;"
private const val RETRY = "Lcom/facebook/analytics2/logger/legacy/uploader/HighPriUploadRetryReceiver;"
private const val BASE = "LX/0c0;"
private const val SERVICE = "Landroid/app/Service;"
private const val JOBS = "Landroid/app/job/JobService;"

/** An entry point cut down to a body that touches only its own registers, with this build's register count. */
private fun entry(owner: String, entry: String, registers: Int? = null, flags: Int = AccessFlags.PUBLIC.value): MutableMethod {
    val body = when (entry) {
        START_COMMAND -> "const/4 v0, 0x1\nreturn v0"
        START_JOB -> "const/4 v0, 0x1\nreturn v0"
        else -> "const/4 v0, 0x0\nreturn-void"
    }
    val words = when (entry) { START_COMMAND -> 4; START_JOB -> 2; else -> 3 }
    return fixtureMethod("$owner->$entry", body, registers ?: (words + 4), flags)
}

private fun uploadClass(type: String, vararg entries: String, superclass: String = SERVICE, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureClass(type, entries.map { entry(type, it) } +
        fixtureMethod("$type->onCreate()V", "return-void"), superclass = superclass, flags = flags)

/** The six upload components as the 580 base mapping ships them. */
internal fun analyticsUploadFixture(
    base: MutableClass = uploadClass(BASE, START_COMMAND, START_JOB, superclass = JOBS,
        flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
    uploader: MutableClass = fixtureClass(ANALYTICS2_UPLOAD_SERVICE, listOf(fixtureMethod("$ANALYTICS2_UPLOAD_SERVICE-><init>()V", "return-void")), superclass = BASE),
): List<MutableClass> = listOf(
    uploadClass(ALARM, START_COMMAND),
    uploadClass(LOLLIPOP, START_COMMAND, START_JOB, superclass = JOBS),
    uploadClass(SAFE, START_COMMAND, START_JOB, superclass = JOBS),
    uploadClass(PLAY, START_COMMAND, superclass = "LX/QJz;"),
    uploadClass(RETRY, RECEIVE, superclass = "Landroid/content/BroadcastReceiver;"),
    base, uploader,
)

private fun Method.code() = implementation!!.instructions.toList()
private fun reference(at: Int, code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) =
    (code[at] as ReferenceInstruction).reference.toString()

class AnalyticsUploadsTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    private fun found(classes: List<MutableClass>) = findControls(classes).getValue(ANALYTICS_UPLOADS).map { it.hookId() }.toSet()

    @Test fun everyUploadEntryPointIsFoundByItsManifestName() {
        assertEquals(activeProfile.hooks.getValue(ANALYTICS_UPLOADS), found(analyticsUploadFixture()))
        validateControls(findControls(analyticsUploadFixture()), setOf(ANALYTICS_UPLOADS))
        assertEquals(9, found(analyticsUploadFixture()).size)
        // 346013423 names the base differently, and only the base's own name moves.
        activeProfile = PROFILE_346013423
        val renamed = analyticsUploadFixture(
            uploadClass("LX/0bw;", START_COMMAND, START_JOB, superclass = JOBS, flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
            fixtureClass(ANALYTICS2_UPLOAD_SERVICE, superclass = "LX/0bw;"))
        validateControls(findControls(renamed), setOf(ANALYTICS_UPLOADS))
    }

    @Test fun theInheritedBaseCountsOnlyWhileNothingElseCanReachIt() {
        val abstract = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value
        val cases = mapOf(
            "a second subclass" to analyticsUploadFixture() + fixtureClass("LX/Other;", superclass = BASE),
            "a concrete base" to analyticsUploadFixture(uploadClass(BASE, START_COMMAND, START_JOB, superclass = JOBS)),
            "a plain service base" to analyticsUploadFixture(uploadClass(BASE, START_COMMAND, START_JOB, flags = abstract)),
            "an uploader with its own job entry" to analyticsUploadFixture(uploader = fixtureClass(ANALYTICS2_UPLOAD_SERVICE,
                listOf(entry(ANALYTICS2_UPLOAD_SERVICE, START_JOB)), superclass = BASE)),
            "no uploader" to analyticsUploadFixture().filter { it.type != ANALYTICS2_UPLOAD_SERVICE },
            "no base" to analyticsUploadFixture().filter { it.type != BASE },
        )
        for ((case, classes) in cases) {
            val hooks = found(classes)
            assertEquals(7, hooks.size, case)
            assertTrue(hooks.none { it.startsWith(BASE) }, case)
            assertFailsWith<PatchException>(case) { validateControls(findControls(classes), setOf(ANALYTICS_UPLOADS)) }
        }
        // A static method with an entry point's name isn't one.
        val static = analyticsUploadFixture().map {
            if (it.type != ALARM) it else fixtureClass(ALARM, listOf(entry(ALARM, START_COMMAND,
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), superclass = SERVICE)
        }
        assertEquals(8, found(static).size)
    }

    @Test fun aServiceStartStopsItselfWithoutAskingForARestart() {
        val method = entry(ALARM, START_COMMAND)
        val before = method.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, code))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(6, code.branchTarget(2))
        val stop = code[3] as FiveRegisterInstruction
        assertEquals("$SERVICE->stopSelf(I)V", reference(3, code))
        // p0 and p3 of an eight-register (Intent, int, int) method: this and the start ID.
        assertEquals(listOf(4, 7), listOf(stop.registerC, stop.registerD))
        assertEquals(2, (code[4] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[5].opcode)
        assertEquals((code[4] as OneRegisterInstruction).registerA, (code[5] as OneRegisterInstruction).registerA)
        assertEquals(before, code.drop(6))
    }

    @Test fun aJobReportsNoWorkAndTheRetryReceiverDoesNothing() {
        val job = entry(LOLLIPOP, START_JOB)
        val receiver = entry(RETRY, RECEIVE)
        val jobBefore = job.code()
        val receiverBefore = receiver.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(job, receiver)))
        val jobCode = job.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, jobCode))
        assertEquals(0, (jobCode[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, jobCode[4].opcode)
        assertEquals(5, jobCode.branchTarget(2))
        assertEquals(jobBefore, jobCode.drop(5))
        val receiverCode = receiver.code()
        assertEquals(Opcode.RETURN_VOID, receiverCode[3].opcode)
        assertEquals(4, receiverCode.branchTarget(2))
        assertEquals(receiverBefore, receiverCode.drop(4))
    }

    @Test fun anUnusableEntryPointRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "no free register" to entry(ALARM, START_COMMAND, registers = 4),
            "start ID out of invoke range" to entry(ALARM, START_COMMAND, registers = 17),
            "static" to entry(ALARM, START_COMMAND, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "another method" to fixtureMethod("$ALARM->onBind(Landroid/content/Intent;)Landroid/os/IBinder;", "const/4 v0, 0x0\nreturn-object v0"),
        )
        for ((case, bad) in cases) {
            val good = entry(LOLLIPOP, START_JOB)
            val before = good.code()
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) {
                injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(good, bad)))
            }
            assertEquals(before, good.code(), case)
            assertEquals(badBefore, bad.code(), case)
        }
        // Sixteen registers still keep the start ID in range.
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(entry(ALARM, START_COMMAND, registers = 16))))
    }
}
