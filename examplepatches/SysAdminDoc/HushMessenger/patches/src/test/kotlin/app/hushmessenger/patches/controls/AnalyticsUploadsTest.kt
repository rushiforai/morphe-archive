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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
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

private const val COMPAT = "Lcom/facebook/common/jobscheduler/compat/GcmTaskServiceCompat;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val ABSTRACT = 0x401 // public abstract
/** The 580 base mapping's GcmTaskService base and the Runnable it runs each bound task on. */
private const val TASK_BASE = "LX/QJz;"
private const val TASK_RUNNER = "LX/T7W;"

/**
 * The Runnable's run() where Redex inlined the uploader's task, cut down: a compat task reports and leaves first, the
 * uploader's branch logs the build-ID message and reports through the one (I)V reporter. Thirteen registers, as shipped.
 */
private fun inlinedTask(owner: String = TASK_RUNNER, base: String = TASK_BASE, mark: String = BOUND_UPLOAD_MARK,
                        compat: String = COMPAT, secondReporter: Boolean = false) = fixtureMethod("$owner->run()V", """
    iget-object v8, p0, $owner->A03:$base
    instance-of v0, v8, $compat
    if-eqz v0, :play
    const/4 v0, 0x1
    invoke-direct {p0, v0}, $owner->A00(I)V
    return-void
    :play
    check-cast v8, $PLAY
    const-string v1, "$mark"
    const/4 v0, 0x0
    invoke-direct {p0, v0}, $owner->${if (secondReporter) "A01" else "A00"}(I)V
    return-void
""".trimIndent(), 13, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

private fun reporter(owner: String, name: String = "A00") =
    fixtureMethod("$owner->$name(I)V", "return-void", 2, AccessFlags.PRIVATE.value)

private fun taskRunner(owner: String = TASK_RUNNER, base: String = TASK_BASE, run: MutableMethod = inlinedTask(owner, base)) =
    fixtureClass(owner, listOf(run, reporter(owner), reporter(owner, "A01")), interfaces = listOf(RUNNABLE),
        extraFields = listOf(ImmutableField(owner, "A03", base, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null)))

private fun taskBase(type: String = TASK_BASE, superclass: String = SERVICE, vararg methods: MutableMethod) = fixtureClass(type,
    listOf(fixtureMethod("$type->onBind(Landroid/content/Intent;)Landroid/os/IBinder;", "const/4 v0, 0x0\nreturn-object v0")) +
        methods, superclass = superclass, flags = ABSTRACT)

/** The inlined route as the 580 base mapping ships it: the task base and its Runnable. */
private fun inlinedTaskFixture() = listOf(taskBase(), taskRunner())

/** GooglePlayUploadService's own task override where a build kept it, as 346013423 ships it (twelve registers). */
private fun delegatedTask(task: String = "LX/UTH;", mark: String = BOUND_UPLOAD_MARK) = fixtureMethod("$PLAY->A04($task)I", """
    const/4 v3, 0x2
    const-string v2, "$mark"
    return v3
""".trimIndent(), 12)

private fun abstractTask(owner: String, task: String) = MutableMethod(ImmutableMethod(owner, "A04",
    listOf(ImmutableMethodParameter(task, null, null)), "I", ABSTRACT, null, null, null))

/** The delegating route as 346013423 ships it: the base declares the task method, the uploader overrides it, run() calls it. */
private fun delegatedTaskFixture(base: String = "LX/QBX;", task: String = "LX/UTH;", runner: String = "LX/ScF;") = listOf(
    taskBase(base, SERVICE, abstractTask(base, task)),
    taskRunner(runner, base, fixtureMethod("$runner->run()V", """
        iget-object v3, p0, $runner->A03:$base
        const/4 v1, 0x0
        invoke-virtual {v3, v1}, $base->A04($task)I
        move-result v0
        invoke-direct {p0, v0}, $runner->A00(I)V
        return-void
    """.trimIndent(), 5, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)),
)

/** The six upload components as the 580 base mapping ships them, with its bound task route. */
internal fun analyticsUploadFixture(
    base: MutableClass = uploadClass(BASE, START_COMMAND, START_JOB, superclass = JOBS,
        flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
    uploader: MutableClass = fixtureClass(ANALYTICS2_UPLOAD_SERVICE, listOf(fixtureMethod("$ANALYTICS2_UPLOAD_SERVICE-><init>()V", "return-void")), superclass = BASE),
    play: MutableClass = uploadClass(PLAY, START_COMMAND, superclass = TASK_BASE),
    tasks: List<MutableClass> = inlinedTaskFixture(),
): List<MutableClass> = listOf(
    uploadClass(ALARM, START_COMMAND),
    uploadClass(LOLLIPOP, START_COMMAND, START_JOB, superclass = JOBS),
    uploadClass(SAFE, START_COMMAND, START_JOB, superclass = JOBS),
    play,
    uploadClass(RETRY, RECEIVE, superclass = "Landroid/content/BroadcastReceiver;"),
    base, uploader,
) + tasks

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
        assertEquals(10, found(analyticsUploadFixture()).size)
        // 346013423 names the base differently and keeps the uploader's own task override instead of inlining it.
        activeProfile = PROFILE_346013423
        val renamed = analyticsUploadFixture(
            uploadClass("LX/0bw;", START_COMMAND, START_JOB, superclass = JOBS, flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
            fixtureClass(ANALYTICS2_UPLOAD_SERVICE, superclass = "LX/0bw;"),
            fixtureClass(PLAY, listOf(entry(PLAY, START_COMMAND), delegatedTask()), superclass = "LX/QBX;"),
            delegatedTaskFixture())
        assertTrue("$PLAY->A04(LX/UTH;)I" in found(renamed))
        validateControls(findControls(renamed), setOf(ANALYTICS_UPLOADS))
    }

    @Test fun aBoundTaskIsFoundOnlyWhereTheUploaderRunsIt() {
        val inlined = "$TASK_RUNNER->run()V"
        val delegated = "$PLAY->A04(LX/UTH;)I"
        val delegatingPlay = fixtureClass(PLAY, listOf(entry(PLAY, START_COMMAND), delegatedTask()), superclass = "LX/QBX;")
        val cases = mapOf(
            "a Runnable without the uploader's message" to analyticsUploadFixture(tasks = listOf(taskBase(),
                taskRunner(run = inlinedTask(mark = "Job with old build ID")))),
            "a Runnable that never checks for compat tasks" to analyticsUploadFixture(tasks = listOf(taskBase(),
                taskRunner(run = inlinedTask(compat = "LX/OtherService;")))),
            "two reporters" to analyticsUploadFixture(tasks = listOf(taskBase(), taskRunner(run = inlinedTask(secondReporter = true)))),
            "a base that isn't a service" to analyticsUploadFixture(tasks = listOf(taskBase(superclass = "Ljava/lang/Object;"), taskRunner())),
            "a Runnable that doesn't hold the base" to analyticsUploadFixture(tasks = listOf(taskBase(),
                taskRunner(base = "LX/Elsewhere;", run = inlinedTask(base = "LX/Elsewhere;")))),
            // Its instance-of could then never match, so the switch would quietly do nothing.
            "a Runnable whose first read isn't the service" to analyticsUploadFixture(tasks = listOf(taskBase(),
                taskRunner(run = inlinedTask(base = "Ljava/lang/Object;")))),
            "no task base" to analyticsUploadFixture(tasks = listOf(taskRunner())),
            "an override the base never declared" to analyticsUploadFixture(play = delegatingPlay,
                tasks = listOf(taskBase("LX/QBX;"), delegatedTaskFixture()[1])),
            "an override without the uploader's message" to analyticsUploadFixture(play = fixtureClass(PLAY,
                listOf(entry(PLAY, START_COMMAND), delegatedTask(mark = "Misunderstood job extras: %s")), superclass = "LX/QBX;"),
                tasks = delegatedTaskFixture()),
        )
        for ((case, classes) in cases) {
            val hooks = found(classes)
            assertEquals(9, hooks.size, case)
            assertTrue(inlined !in hooks && delegated !in hooks, case)
            assertFailsWith<PatchException>(case) { validateControls(findControls(classes), setOf(ANALYTICS_UPLOADS)) }
        }
        // The delegating Runnable itself never counts: its run() only calls the task method.
        assertEquals(setOf(delegated), found(analyticsUploadFixture(play = delegatingPlay, tasks = delegatedTaskFixture())) -
            found(analyticsUploadFixture(tasks = emptyList())))
    }

    @Test fun anInlinedTaskReportsSuccessOnceAndLeavesCompatTasksStock() {
        val method = inlinedTask()
        val before = method.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(method)))
        val code = method.code()
        // The service is checked first, so a compat task never reads the switch.
        assertEquals(Opcode.IGET_OBJECT, code[0].opcode)
        assertEquals("$TASK_RUNNER->A03:$TASK_BASE", reference(0, code))
        assertEquals(listOf(0, 12), (code[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(Opcode.INSTANCE_OF, code[1].opcode)
        assertEquals(PLAY, reference(1, code))
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(9, code.branchTarget(2))
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(3, code))
        assertEquals(Opcode.MOVE_RESULT, code[4].opcode)
        assertEquals(9, code.branchTarget(5))
        assertEquals(0, (code[6] as NarrowLiteralInstruction).narrowLiteral)
        // Messenger's own reporter tells Google Play the task succeeded and frees its tag, once.
        assertEquals("$TASK_RUNNER->A00(I)V", reference(7, code))
        assertEquals(listOf(12, 0), (code[7] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(Opcode.RETURN_VOID, code[8].opcode)
        assertEquals(before, code.drop(9))
    }

    @Test fun aDelegatedTaskReturnsSuccessFromTheUploaderOverride() {
        val method = delegatedTask()
        val before = method.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, code))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(5, code.branchTarget(2))
        assertEquals(0, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[4].opcode)
        assertEquals(before, code.drop(5))
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
            assertEquals(8, hooks.size, case)
            assertTrue(hooks.none { it.startsWith(BASE) }, case)
            assertFailsWith<PatchException>(case) { validateControls(findControls(classes), setOf(ANALYTICS_UPLOADS)) }
        }
        // A static method with an entry point's name isn't one.
        val static = analyticsUploadFixture().map {
            if (it.type != ALARM) it else fixtureClass(ALARM, listOf(entry(ALARM, START_COMMAND,
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), superclass = SERVICE)
        }
        assertEquals(9, found(static).size)
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
            "a Runnable that isn't the uploader's task" to inlinedTask(mark = "Job with old build ID"),
            "a task with two reporters" to inlinedTask(secondReporter = true),
            "an uploader method without the task message" to delegatedTask(mark = "GooglePlayUploadService"),
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
