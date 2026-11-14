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
/** The synthetic mapping's GcmTaskService base and the Runnable it runs each bound task on. */
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

/** The inlined route as the synthetic mapping has it: the task base and its Runnable. */
private fun inlinedTaskFixture() = listOf(taskBase(), taskRunner())

/**
 * GooglePlayUploadService's own task override, as 580's 346013423 shipped it (twelve registers). Two 582 builds and
 * 587's second family (347415280) keep one too.
 */
private fun delegatedTask(task: String = "LX/UTH;", mark: String = BOUND_UPLOAD_MARK) = fixtureMethod("$PLAY->A04($task)I", """
    const/4 v3, 0x2
    const-string v2, "$mark"
    return v3
""".trimIndent(), 12)

private fun abstractTask(owner: String, task: String) = MutableMethod(ImmutableMethod(owner, "A04",
    listOf(ImmutableMethodParameter(task, null, null)), "I", ABSTRACT, null, null, null))

/** The delegating route as 346013423 shipped it: the base declares the task method, the uploader overrides it, run() calls it. */
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

private const val TIMER = "LX/Wq1;"
private const val LOGGER_PROVIDER = "LX/0La;"
private const val LOGGER = "LX/7ew;"

/** Reads the logger from its provider, the way the timer does before each of its two calls. */
private val READ_LOGGER = listOf(
    "invoke-interface {v1}, $LOGGER_PROVIDER->get()Ljava/lang/Object;",
    "move-result-object v0",
    "check-cast v0, $LOGGER",
    "iget-object v0, v0, $LOGGER->A02:Lcom/facebook/xanalytics/XAnalyticsNative;",
)

/** Messenger's XAnalytics timer: flush the native batch, then start its upload. */
private fun timerBody(owner: String = TIMER, first: String = XANALYTICS_FLUSH, second: String = XANALYTICS_UPLOAD, extra: String = "") =
    (listOf("iget-object v0, p0, $owner->A00:LX/2zB;", "iget-object v1, v0, LX/2zB;->A00:$LOGGER_PROVIDER") +
        READ_LOGGER + "invoke-virtual {v0}, $first" + READ_LOGGER + "invoke-virtual {v0}, $second" + extra + "return-void")
        .filter { it.isNotBlank() }.joinToString("\n")

private fun timerRun(owner: String = TIMER, body: String = timerBody(owner)) =
    fixtureMethod("$owner->run()V", body, 3, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

private fun timerClass(owner: String = TIMER, run: MutableMethod = timerRun(owner), interfaces: List<String> = listOf(RUNNABLE)) =
    fixtureClass(owner, listOf(run), interfaces = interfaces)

/** The synthetic mapping's upload logic (584's UploadServiceLogic), its job params and its job callback. */
private const val UPLOAD_LOGIC = "LX/2Hd;"
private const val UPLOAD_PARAMS = "LX/3Pq;"
private const val UPLOAD_CALLBACK = "LX/2Zk;"
private const val UPLOAD_DISPATCH = "$UPLOAD_LOGIC->A01($UPLOAD_PARAMS${UPLOAD_CALLBACK}Ljava/lang/String;)V"
private const val IN_PROCESS_START = "$UPLOAD_LOGIC->A05(${UPLOAD_PARAMS}Ljava/lang/String;)V"

/** The action dispatcher cut down to the strings it's known by. Ten registers, as shipped. */
private fun uploadDispatcher(id: String = UPLOAD_DISPATCH,
                             actions: List<String> = listOf(UPLOAD_NOW_ACTION, USER_LOGOUT_ACTION, UNKNOWN_UPLOAD_ACTION)) =
    fixtureMethod(id, actions.joinToString("") { "const-string v0, \"$it\"\n" } + "return-void", 10)

/** 587's string pool, cut down to the one action it holds under 0x45a. */
private const val ACTION_POOL = "LX/6i7;->A00(I)Ljava/lang/String;"
private fun actionPoolClass(action: String = USER_LOGOUT_ACTION) = fixtureClass("LX/6i7;", listOf(fixtureMethod(ACTION_POOL, """
    packed-switch p0, :keys
    const-string v0, ""
    return-object v0
    :action
    const-string v0, "$action"
    return-object v0
    :keys
    .packed-switch 0x45a
        :action
    .end packed-switch
""".trimIndent(), 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))

/** The dispatcher as 587 ships it, looking USER_LOGOUT up in that pool between its two literals. */
private fun pooledDispatcher() = fixtureMethod(UPLOAD_DISPATCH, """
    const-string v0, "$UPLOAD_NOW_ACTION"
    const/16 v0, 0x45a
    invoke-static {v0}, $ACTION_POOL
    move-result-object v0
    const-string v0, "$UNKNOWN_UPLOAD_ACTION"
    return-void
""".trimIndent(), 10)

private const val IN_PROCESS_START_BODY = "const/4 v0, 0x0\ninvoke-direct {p0, p1, v0, p2}, $UPLOAD_DISPATCH\nreturn-void"

/** The in-process start as 584 ships it: a null callback, the dispatcher, nothing else. Four registers. */
private fun inProcessStart(id: String = IN_PROCESS_START, body: String = IN_PROCESS_START_BODY, registers: Int = 4,
                           flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, registers, flags)

private fun uploadLogic(owner: String = UPLOAD_LOGIC, methods: List<MutableMethod> = listOf(
    uploadDispatcher(UPLOAD_DISPATCH.replace(UPLOAD_LOGIC, owner)),
    inProcessStart(IN_PROCESS_START.replace(UPLOAD_LOGIC, owner), IN_PROCESS_START_BODY.replace(UPLOAD_LOGIC, owner)),
)) = fixtureClass(owner, methods, flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

/** The six upload components as the synthetic mapping has them, with its bound task route, XAnalytics timer and upload logic. */
internal fun analyticsUploadFixture(
    base: MutableClass = uploadClass(BASE, START_COMMAND, START_JOB, superclass = JOBS,
        flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
    uploader: MutableClass = fixtureClass(ANALYTICS2_UPLOAD_SERVICE, listOf(fixtureMethod("$ANALYTICS2_UPLOAD_SERVICE-><init>()V", "return-void")), superclass = BASE),
    play: MutableClass = uploadClass(PLAY, START_COMMAND, superclass = TASK_BASE),
    tasks: List<MutableClass> = inlinedTaskFixture(),
    timers: List<MutableClass> = listOf(timerClass()),
    logic: List<MutableClass> = listOf(uploadLogic()),
): List<MutableClass> = listOf(
    uploadClass(ALARM, START_COMMAND),
    uploadClass(LOLLIPOP, START_COMMAND, START_JOB, superclass = JOBS),
    uploadClass(SAFE, START_COMMAND, START_JOB, superclass = JOBS),
    play,
    uploadClass(RETRY, RECEIVE, superclass = "Landroid/content/BroadcastReceiver;"),
    base, uploader,
) + tasks + timers + logic

private fun Method.code() = implementation!!.instructions.toList()
private fun reference(at: Int, code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) =
    (code[at] as ReferenceInstruction).reference.toString()

class AnalyticsUploadsTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(ANALYTICS_UPLOADS).map { it.hookId() }.toSet()

    @Test fun everyUploadEntryPointIsFoundByItsManifestName() {
        assertEquals(activeProfile.hooks.getValue(ANALYTICS_UPLOADS), found(analyticsUploadFixture()))
        validateControls(mirroredControls(analyticsUploadFixture()), setOf(ANALYTICS_UPLOADS))
        assertEquals(12, found(analyticsUploadFixture()).size)
        // The inherited base, the timer and the upload logic are found under any obfuscated name.
        val renamed = analyticsUploadFixture(
            uploadClass("LX/0bU;", START_COMMAND, START_JOB, superclass = JOBS, flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
            fixtureClass(ANALYTICS2_UPLOAD_SERVICE, superclass = "LX/0bU;"), timers = listOf(timerClass("LX/YjU;")),
            logic = listOf(uploadLogic("LX/4qk;")))
        assertTrue("LX/0bU;->$START_JOB" in found(renamed))
        assertTrue("LX/YjU;->run()V" in found(renamed))
        assertTrue("LX/4qk;->A05(${UPLOAD_PARAMS}Ljava/lang/String;)V" in found(renamed))
        assertEquals(12, found(renamed).size)
    }

    @Test fun theXAnalyticsTimerIsTakenOnlyInItsOwnShape() {
        val withoutTimer = found(analyticsUploadFixture(timers = emptyList()))
        assertEquals(setOf("$TIMER->run()V"), found(analyticsUploadFixture()) - withoutTimer)
        val cases = mapOf(
            "a second timer" to listOf(timerClass(), timerClass("LX/Wq2;")),
            "not a Runnable" to listOf(timerClass(interfaces = emptyList())),
            "uploads before it flushes" to listOf(timerClass(run = timerRun(body = timerBody(first = XANALYTICS_UPLOAD, second = XANALYTICS_FLUSH)))),
            "flushes twice" to listOf(timerClass(run = timerRun(body = timerBody(second = XANALYTICS_FLUSH)))),
            "never uploads" to listOf(timerClass(run = timerRun(body = timerBody(second = "$LOGGER_PROVIDER->get()Ljava/lang/Object;")))),
            "does other work" to listOf(timerClass(run = timerRun(body = timerBody(extra = "invoke-static {}, LX/Q1a;->A00()V")))),
            "asks a getter with an argument" to listOf(timerClass(run = timerRun(body = timerBody(
                extra = "invoke-interface {v1, v0}, $LOGGER_PROVIDER->get(Ljava/lang/Object;)Ljava/lang/Object;")))),
            "returns early" to listOf(timerClass(run = timerRun(body = timerBody(extra = "if-nez v0, :done\nreturn-void\n:done")))),
        )
        for ((case, timers) in cases) assertEquals(withoutTimer, found(analyticsUploadFixture(timers = timers)), case)
    }

    @Test fun theXAnalyticsTimerSkipsThatRunWhileTheSwitchIsOn() {
        val run = timerRun()
        val before = run.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(run)))
        val code = run.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, code))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        assertEquals(4, code.branchTarget(2))
        // The run that goes ahead is Messenger's own, flush and upload untouched.
        assertEquals(before, code.drop(4))
    }

    @Test fun aBoundTaskIsFoundOnlyWhereTheUploaderRunsIt() {
        val inlined = "$TASK_RUNNER->run()V"
        val delegated = "$PLAY->A04(LX/UTH;)I"
        val delegatingPlay = fixtureClass(PLAY, listOf(entry(PLAY, START_COMMAND), delegatedTask()), superclass = "LX/QBX;")
        // 582's route, and 587's second family: the uploader's own task override, which a delegating run() calls.
        val overriding = found(analyticsUploadFixture(play = delegatingPlay, tasks = delegatedTaskFixture()))
        assertEquals(activeProfile.hooks.getValue(ANALYTICS_UPLOADS) - inlined + delegated, overriding)
        assertEquals(12, overriding.size)
        val cases = mapOf(
            "an override without the uploader's message" to analyticsUploadFixture(play = fixtureClass(PLAY,
                listOf(entry(PLAY, START_COMMAND), delegatedTask(mark = "Job with no ID")), superclass = "LX/QBX;"), tasks = delegatedTaskFixture()),
            "an override the base doesn't declare" to analyticsUploadFixture(play = delegatingPlay,
                tasks = delegatedTaskFixture().map { if (it.type == "LX/QBX;") taskBase("LX/QBX;", SERVICE) else it }),
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
        )
        for ((case, classes) in cases) {
            val hooks = found(classes)
            assertEquals(11, hooks.size, case)
            assertTrue(inlined !in hooks && delegated !in hooks, case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(ANALYTICS_UPLOADS)) }
        }
    }

    @Test fun a584TaskIsFoundByItsStaleBuildMessage() {
        // 584 reads the no build ID message from a string table, which leaves the stale build ID one as the mark.
        val classes = analyticsUploadFixture(tasks = listOf(taskBase(), taskRunner(run = inlinedTask(mark = OLD_BUILD_UPLOAD_MARK))))
        assertTrue("$TASK_RUNNER->run()V" in found(classes))
        assertEquals(12, found(classes).size)
    }

    @Test fun anInProcessUploadStartIsFoundOnlyBesideTheOneDispatcher() {
        val withoutLogic = found(analyticsUploadFixture(logic = emptyList()))
        assertEquals(setOf(IN_PROCESS_START), found(analyticsUploadFixture()) - withoutLogic)
        val callback = "const/4 v0, 0x1\ninvoke-direct {p0, p1, v0, p2}, $UPLOAD_DISPATCH\nreturn-void"
        val cases = mapOf(
            "a dispatcher that never names USER_LOGOUT" to listOf(uploadLogic(methods = listOf(
                uploadDispatcher(actions = listOf(UPLOAD_NOW_ACTION, UNKNOWN_UPLOAD_ACTION)), inProcessStart()))),
            "a dispatcher that returns a value" to listOf(uploadLogic(methods = listOf(
                fixtureMethod(UPLOAD_DISPATCH.replace(")V", ")I"), "const-string v0, \"$UPLOAD_NOW_ACTION\"\n" +
                    "const-string v0, \"$USER_LOGOUT_ACTION\"\nconst-string v0, \"$UNKNOWN_UPLOAD_ACTION\"\nconst/4 v0, 0x0\nreturn v0", 10),
                inProcessStart()))),
            "two dispatchers" to listOf(uploadLogic(), uploadLogic("LX/4qk;")),
            "a start that hands over a callback" to listOf(uploadLogic(methods = listOf(uploadDispatcher(), inProcessStart(body = callback)))),
            "a start that does more" to listOf(uploadLogic(methods = listOf(uploadDispatcher(), inProcessStart(
                body = "const/4 v0, 0x0\ninvoke-direct {p0, p1, v0, p2}, $UPLOAD_DISPATCH\ninvoke-virtual {p0}, Ljava/lang/Object;->hashCode()I\nreturn-void")))),
            "a start that swaps the action and the params" to listOf(uploadLogic(methods = listOf(uploadDispatcher(), inProcessStart(
                body = "const/4 v0, 0x0\ninvoke-direct {p0, p2, v0, p1}, $UPLOAD_DISPATCH\nreturn-void")))),
            // Registers laid out so only the static flag tells it apart.
            "a static start" to listOf(uploadLogic(methods = listOf(uploadDispatcher(), inProcessStart(
                body = "const/4 v0, 0x0\ninvoke-direct {v1, p0, v0, p1}, $UPLOAD_DISPATCH\nreturn-void",
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))),
            "a start that takes other params" to listOf(uploadLogic(methods = listOf(uploadDispatcher(),
                inProcessStart(IN_PROCESS_START.replace(UPLOAD_PARAMS, "LX/9zz;"))))),
            "two starts" to listOf(uploadLogic(methods = listOf(uploadDispatcher(), inProcessStart(),
                inProcessStart(IN_PROCESS_START.replace("A05", "A06"))))),
            "a start in another class" to listOf(uploadLogic(methods = listOf(uploadDispatcher())),
                fixtureClass("LX/4qk;", listOf(inProcessStart(IN_PROCESS_START.replace(UPLOAD_LOGIC, "LX/4qk;"))))),
        )
        for ((case, logic) in cases) {
            val classes = analyticsUploadFixture(logic = logic)
            assertEquals(withoutLogic, found(classes), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(ANALYTICS_UPLOADS)) }
        }
    }

    @Test fun a587DispatcherNamesUserLogoutThroughItsStringPool() {
        val withoutLogic = found(analyticsUploadFixture(logic = emptyList()))
        val logic = uploadLogic(methods = listOf(pooledDispatcher(), inProcessStart()))
        assertEquals(setOf(IN_PROCESS_START), found(analyticsUploadFixture(logic = listOf(logic, actionPoolClass()))) - withoutLogic)
        val cases = mapOf(
            "a pool holding another action" to listOf(logic, actionPoolClass("com.facebook.analytics2.logger.OTHER")),
            "no pool" to listOf(logic),
        )
        for ((case, classes) in cases) assertEquals(withoutLogic, found(analyticsUploadFixture(logic = classes)), case)
    }

    @Test fun anInProcessUploadStartReturnsBeforeTheUploadJobExists() {
        val method = inProcessStart()
        val before = method.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, code))
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(Opcode.RETURN_VOID, code[3].opcode)
        assertEquals(4, code.branchTarget(2))
        // Off, the dispatcher gets this start's own params and action with Messenger's null callback.
        assertEquals(before, code.drop(4))
        assertEquals(UPLOAD_DISPATCH, reference(5, code))
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

    @Test fun aTaskOverrideReportsSuccessWithoutUploading() {
        val method = delegatedTask()
        val before = method.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, code))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        // The Runnable hands this 0 to its reporter, which tells Google Play the task succeeded and frees its tag.
        assertEquals(0, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[4].opcode)
        assertEquals(5, code.branchTarget(2))
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
            assertEquals(10, hooks.size, case)
            assertTrue(hooks.none { it.startsWith(BASE) }, case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(ANALYTICS_UPLOADS)) }
        }
        // A static method with an entry point's name isn't one.
        val static = analyticsUploadFixture().map {
            if (it.type != ALARM) it else fixtureClass(ALARM, listOf(entry(ALARM, START_COMMAND,
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), superclass = SERVICE)
        }
        assertEquals(11, found(static).size)
    }

    @Test fun aServiceStartStopsItselfWithoutAskingForARestart() {
        val method = entry(ALARM, START_COMMAND)
        val before = method.code()
        injectControl(ANALYTICS_UPLOADS, mapOf(ANALYTICS_UPLOADS to listOf(method)))
        val code = method.code()
        assertEquals("$SETTINGS->stopAnalyticsUploads()Z", reference(0, code))
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(7, code.branchTarget(2))
        // The starter's wakelock is answered before the start stops, with the start's own Intent (p1, v5).
        val answer = code[3] as FiveRegisterInstruction
        assertEquals("$SETTINGS->releaseUploadStarter(Landroid/content/Intent;)V", reference(3, code))
        assertEquals(listOf(1, 5), listOf(answer.registerCount, answer.registerC))
        val stop = code[4] as FiveRegisterInstruction
        assertEquals("$SERVICE->stopSelf(I)V", reference(4, code))
        // p0 and p3 of an eight-register (Intent, int, int) method: this and the start ID.
        assertEquals(listOf(4, 7), listOf(stop.registerC, stop.registerD))
        assertEquals(2, (code[5] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[6].opcode)
        assertEquals((code[5] as OneRegisterInstruction).registerA, (code[6] as OneRegisterInstruction).registerA)
        assertEquals(before, code.drop(7))
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
            "a task override without the uploader's message" to delegatedTask(mark = "Job with no ID"),
            "a Runnable that uploads before it flushes" to timerRun(body = timerBody(first = XANALYTICS_UPLOAD, second = XANALYTICS_FLUSH)),
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
