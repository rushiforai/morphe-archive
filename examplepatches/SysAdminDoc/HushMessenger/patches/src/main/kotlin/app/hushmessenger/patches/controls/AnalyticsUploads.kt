/*
 * The upload services follow C10udburst/MessengerEx at e79cff80c1fa3b22902c88630558ed6846905e0a (Analytics.kt), MIT.
 * See NOTICE.
 */
package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val ANALYTICS_UPLOADS = "analytics_uploads"

private const val LOGGER = "Lcom/facebook/analytics2/logger"
private const val UPLOADER = "$LOGGER/legacy/uploader"
internal const val ANALYTICS2_UPLOAD_SERVICE = "$UPLOADER/Analytics2UploadService;"
internal const val GOOGLE_PLAY_UPLOAD_SERVICE = "$LOGGER/GooglePlayUploadService;"
private const val JOB_SERVICE = "Landroid/app/job/JobService;"
private const val SERVICE = "Landroid/app/Service;"
private const val TASK_SERVICE_COMPAT = "Lcom/facebook/common/jobscheduler/compat/GcmTaskServiceCompat;"
internal const val START_COMMAND = "onStartCommand(Landroid/content/Intent;II)I"
internal const val START_JOB = "onStartJob(Landroid/app/job/JobParameters;)Z"
internal const val RECEIVE = "onReceive(Landroid/content/Context;Landroid/content/Intent;)V"
internal const val RUN = "run()V"

/** GooglePlayUploadService's own task code logs this when a task carries no build ID, in every build family. */
internal const val BOUND_UPLOAD_MARK = "Job with no build ID, cancelling job"

/** And this when its build ID is stale. 584 moved the first message into a string table, so either one marks it. */
internal const val OLD_BUILD_UPLOAD_MARK = "Job with old build ID: %d, cancelling job, expected: %d"

/**
 * The components Messenger's analytics logger uploads through, and the methods Android calls to start each one. They
 * keep their names in every build because the manifest starts them by name.
 */
internal val ANALYTICS_UPLOAD_ENTRIES = mapOf(
    "$UPLOADER/AlarmBasedUploadService;" to setOf(START_COMMAND),
    "$UPLOADER/LollipopUploadService;" to setOf(START_COMMAND, START_JOB),
    "$LOGGER/service/LollipopUploadSafeService;" to setOf(START_COMMAND, START_JOB),
    GOOGLE_PLAY_UPLOAD_SERVICE to setOf(START_COMMAND),
    "$UPLOADER/HighPriUploadRetryReceiver;" to setOf(RECEIVE),
)

internal fun Method.entryPoint() = "$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.startsUploads(entries: Set<String>) =
    entryPoint() in entries && !AccessFlags.STATIC.isSet(accessFlags) && implementation != null

/**
 * Every upload entry point. Analytics2UploadService declares none of its own and inherits them from an obfuscated job
 * service base, so that base counts only while it's abstract, extends JobService directly and has no other subclass.
 * Then its entry points can't start anything but this upload.
 */
internal fun findAnalyticsUploads(classes: Iterable<ClassDef>): List<Method> {
    val found = mutableListOf<Method>()
    var uploader: ClassDef? = null
    for (cls in classes) {
        ANALYTICS_UPLOAD_ENTRIES[cls.type]?.let { entries -> found += cls.methods.filter { it.startsUploads(entries) } }
        if (cls.type == ANALYTICS2_UPLOAD_SERVICE) uploader = cls
    }
    val service = uploader ?: return found
    val base = service.superclass ?: return found
    val jobs = setOf(START_COMMAND, START_JOB)
    if (service.methods.any { it.entryPoint() in jobs }) return found
    val baseClass = classes.singleOrNull { it.type == base } ?: return found
    if (!AccessFlags.ABSTRACT.isSet(baseClass.accessFlags) || baseClass.superclass != JOB_SERVICE ||
        classes.count { it.superclass == base } != 1) return found
    return found + baseClass.methods.filter { it.startsUploads(jobs) }
}

private fun Method.references() =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }.orEmpty()

private fun Method.holdsBoundUploadMark() = references().any {
    (it as? StringReference)?.string.let { mark -> mark == BOUND_UPLOAD_MARK || mark == OLD_BUILD_UPLOAD_MARK }
}

private fun Method.typeChecks(opcode: Opcode) = implementation?.instructions
    ?.filter { it.opcode == opcode }?.map { (it as ReferenceInstruction).reference.toString() }.orEmpty()

/** The task's service, which the Runnable reads from its own field as its first instruction. */
private fun Method.taskServiceField(): FieldReference? {
    val code = implementation ?: return null
    val first = code.instructions.firstOrNull() ?: return null
    val field = (first as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    // p0 of an instance method without parameters is its last register.
    if (first.opcode != Opcode.IGET_OBJECT || (first as TwoRegisterInstruction).registerB != code.registerCount - 1 ||
        field.definingClass != definingClass) return null
    return field
}

/** The Runnable's one result reporter: it tells Google Play how the task ended, then frees the task's tag. */
private fun Method.taskReporter(): MethodReference? = implementation?.instructions
    ?.filter { it.opcode == Opcode.INVOKE_DIRECT }
    ?.mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
    ?.filter { it.definingClass == definingClass && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("I") }
    ?.distinctBy { it.toString() }?.singleOrNull()

/**
 * A bound task in builds where Redex inlined the uploader's task into the GcmTaskService Runnable: its run() checks for
 * GcmTaskServiceCompat first, and only the GooglePlayUploadService branch holds the uploader's build-ID message.
 */
internal fun Method.isInlinedUploadTask() =
    entryPoint() == RUN && !AccessFlags.STATIC.isSet(accessFlags) && holdsBoundUploadMark() &&
        TASK_SERVICE_COMPAT in typeChecks(Opcode.INSTANCE_OF) && GOOGLE_PLAY_UPLOAD_SERVICE in typeChecks(Opcode.CHECK_CAST) &&
        taskServiceField() != null && taskReporter() != null

/**
 * A bound task in builds that kept GooglePlayUploadService's override of the base's abstract (task)I method, which the
 * Runnable calls and reports the answer of: 582's builds, and 587's second Redex family (347415280, 281, 284 and 285).
 */
internal fun Method.isDelegatedUploadTask() =
    definingClass == GOOGLE_PLAY_UPLOAD_SERVICE && returnType == "I" && parameterTypes.size == 1 &&
        !AccessFlags.STATIC.isSet(accessFlags) && !AccessFlags.ABSTRACT.isSet(accessFlags) && implementation != null &&
        holdsBoundUploadMark()

/**
 * Google Play can also bind GooglePlayUploadService and hand it a task through the binder its obfuscated GcmTaskService
 * base returns from onBind, so the task never passes onStartCommand. The base runs each task on a Runnable that reports
 * the result and frees the tag. The hook is that Runnable's run() where the upload is inlined into it (583 to 587's main
 * builds), or else the uploader's own task override, which run() calls. Unrelated GcmTaskServiceCompat tasks share the
 * Runnable and stay stock.
 */
internal fun findBoundUploadTasks(classes: Iterable<ClassDef>): List<Method> {
    val play = classes.singleOrNull { it.type == GOOGLE_PLAY_UPLOAD_SERVICE } ?: return emptyList()
    val base = play.superclass ?: return emptyList()
    val baseClass = classes.singleOrNull { it.type == base } ?: return emptyList()
    if (baseClass.superclass != SERVICE) return emptyList()
    val abstractTasks = baseClass.methods
        .filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == "I" && it.parameterTypes.size == 1 }
        .map { it.entryPoint() }.toSet()
    val delegated = play.methods.filter { it.entryPoint() in abstractTasks && it.isDelegatedUploadTask() }
    val inlined = classes.filter { cls ->
        "Ljava/lang/Runnable;" in cls.interfaces && cls.fields.any { it.type == base && !AccessFlags.STATIC.isSet(it.accessFlags) }
    }.flatMap { it.methods }.filter { it.isInlinedUploadTask() && it.taskServiceField()?.type == base }
    return delegated + inlined
}

internal const val XANALYTICS_FLUSH = "Lcom/facebook/xanalytics/XAnalyticsHolder;->flush()V"
internal const val XANALYTICS_UPLOAD = "Lcom/facebook/xanalytics/XAnalyticsNative;->kickOffUpload()V"

/**
 * The timer Messenger's startup jobs schedule with a fixed delay to send the native XAnalytics batch: a Runnable whose
 * run() flushes the batch, then starts its upload, and does nothing else but read the logger from a provider. Both calls
 * return nothing, so nothing waits on them, and a run that returns early leaves the schedule in place.
 */
internal fun Method.isXAnalyticsUploadTimer(): Boolean {
    if (entryPoint() != RUN || AccessFlags.STATIC.isSet(accessFlags)) return false
    val code = implementation?.instructions?.toList() ?: return false
    val calls = code.filter { it.opcode.name.startsWith("invoke") }
        .map { (it as ReferenceInstruction).reference as? MethodReference ?: return false }
    val named = calls.map { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
    val flush = named.indexOf(XANALYTICS_FLUSH)
    val upload = named.indexOf(XANALYTICS_UPLOAD)
    val providers = calls.filterIndexed { i, call -> i != flush && i != upload }
    return named.count { it == XANALYTICS_FLUSH } == 1 && named.count { it == XANALYTICS_UPLOAD } == 1 && flush < upload &&
        providers.all { it.name == "get" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" } &&
        code.last().opcode == Opcode.RETURN_VOID && code.count { it.opcode == Opcode.RETURN_VOID } == 1
}

/** The one XAnalytics upload timer. Two would mean Messenger moved the upload, so neither is taken. */
internal fun findXAnalyticsUploadTimers(classes: Iterable<ClassDef>): List<Method> = classes
    .filter { "Ljava/lang/Runnable;" in it.interfaces }
    .flatMap { it.methods }.filter { it.isXAnalyticsUploadTimer() }
    .let { if (it.size == 1) it else emptyList() }

/** The logger's two upload actions, and the error its uploader throws for any other. */
internal const val UPLOAD_NOW_ACTION = "com.facebook.analytics2.logger.UPLOAD_NOW"
internal const val USER_LOGOUT_ACTION = "com.facebook.analytics2.logger.USER_LOGOUT"
internal const val UNKNOWN_UPLOAD_ACTION = "Unknown action="

/**
 * The uploader's action dispatcher, (params, callback, action)V: it starts the upload job for either action. 587 looks
 * USER_LOGOUT up in a string table, so a table lookup names an action as well as a literal does.
 */
private fun Method.isUploadActionDispatcher(tables: Map<String, Map<Int, String>>): Boolean {
    if (returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 3 ||
        parameterTypes[2].toString() != "Ljava/lang/String;") return false
    val literals = references().mapNotNull { (it as? StringReference)?.string }
    if (UNKNOWN_UPLOAD_ACTION !in literals) return false
    return (literals + tableStrings(tables)).containsAll(listOf(UPLOAD_NOW_ACTION, USER_LOGOUT_ACTION, UNKNOWN_UPLOAD_ACTION))
}

/**
 * What an in-process upload start hands its action to: a method of its own class taking (params, callback, action),
 * called with this, its params, a null callback and its action, and nothing else.
 */
private fun Method.inProcessUploadTarget(): MethodReference? {
    if (returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 2 ||
        parameterTypes[1].toString() != "Ljava/lang/String;") return null
    val body = implementation ?: return null
    val code = body.instructions.toList()
    if (code.size != 3 || code[0].opcode != Opcode.CONST_4 || (code[0] as NarrowLiteralInstruction).narrowLiteral != 0 ||
        code[1].opcode != Opcode.INVOKE_DIRECT || code[2].opcode != Opcode.RETURN_VOID) return null
    val target = (code[1] as ReferenceInstruction).reference as? MethodReference ?: return null
    if (target.definingClass != definingClass || target.returnType != "V" || target.parameterTypes.size != 3 ||
        target.parameterTypes[0].toString() != parameterTypes[0].toString() ||
        target.parameterTypes[2].toString() != "Ljava/lang/String;") return null
    val call = code[1] as FiveRegisterInstruction
    val self = body.registerCount - 3
    val callback = (code[0] as OneRegisterInstruction).registerA
    val passed = listOf(call.registerC, call.registerD, call.registerE, call.registerF)
    return target.takeIf { callback < self && call.registerCount == 4 && passed == listOf(self, self + 1, callback, self + 2) }
}

internal fun Method.isInProcessUploadStart() = inProcessUploadTarget() != null

/**
 * Where the logger's schedulers start an upload themselves. When the upload service runs in Messenger's own process,
 * as 584's manifest has it, an UPLOAD_NOW or USER_LOGOUT goes straight to this method instead of starting the service,
 * so none of the service entry points runs. It's taken only beside the one dispatcher, and only when it's the one.
 */
internal fun findInProcessUploadStarts(classes: Iterable<ClassDef>, tables: Map<String, Map<Int, String>> = activeStringTables): List<Method> {
    val dispatcher = classes.flatMap { cls -> cls.methods.filter { it.isUploadActionDispatcher(tables) } }.singleOrNull()
        ?: return emptyList()
    val starts = classes.filter { it.type == dispatcher.definingClass }.flatMap { it.methods }.filter { method ->
        method.inProcessUploadTarget()
            ?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" } == dispatcher.hookId()
    }
    return if (starts.size == 1) starts else emptyList()
}

/** Each entry point starts with a free register, and a service start keeps this and its start ID in invoke range. */
internal fun MutableMethod.validateAnalyticsUpload() {
    val entry = entryPoint()
    val inlined = isInlinedUploadTask()
    if (!inlined && !isDelegatedUploadTask() && !isXAnalyticsUploadTimer() && !isInProcessUploadStart() &&
        (AccessFlags.STATIC.isSet(accessFlags) || entry !in setOf(START_COMMAND, START_JOB, RECEIVE))) {
        throw PatchException("Messenger controls: ${hookId()} isn't an analytics upload entry point")
    }
    validateScratch()
    if (entry == START_COMMAND && implementation!!.registerCount > 16) {
        throw PatchException("Messenger controls: the start ID in ${hookId()} is out of range")
    }
    if (inlined && implementation!!.registerCount > 16) {
        throw PatchException("Messenger controls: the task in ${hookId()} is out of invoke range")
    }
}

/**
 * While the switch is on, a service start first answers the logger that started it, so its 90 second wakelock is
 * released right away as Messenger's own service would (#37), then stops that start and asks Android not to restart
 * it. A job reports it has no work and the retry receiver does nothing. A bound task reports success to Google Play
 * (0, so it isn't retried) and frees its tag through Messenger's own reporter, once. The XAnalytics timer skips that
 * run's flush and upload, and an in-process upload start returns before the upload job exists. Off, Pause and safe mode
 * run Messenger's own code.
 */
internal fun MutableMethod.injectAnalyticsUpload() {
    validateAnalyticsUpload()
    if (isInlinedUploadTask()) {
        val service = taskServiceField()!!
        val reporter = taskReporter()!!
        // The service check comes first, so a GcmTaskServiceCompat task never reads the switch or marks it used.
        addInstructionsWithLabels(0, """
            iget-object v0, p0, $service
            instance-of v0, v0, $GOOGLE_PLAY_UPLOAD_SERVICE
            if-eqz v0, :stock_behavior
            invoke-static {}, $SETTINGS->stopAnalyticsUploads()Z
            move-result v0
            if-eqz v0, :stock_behavior
            const/4 v0, 0x0
            invoke-direct {p0, v0}, $reporter
            return-void
        """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
        return
    }
    val stop = when {
        // The Runnable reports this answer: 0, success, so Google Play doesn't retry the task.
        isDelegatedUploadTask() -> "const/4 v0, 0x0\nreturn v0"
        entryPoint() == START_COMMAND -> "invoke-static {p1}, $SETTINGS->releaseUploadStarter(Landroid/content/Intent;)V\n" +
            "invoke-virtual {p0, p3}, Landroid/app/Service;->stopSelf(I)V\nconst/4 v0, 0x2\nreturn v0"
        entryPoint() == START_JOB -> "const/4 v0, 0x0\nreturn v0"
        else -> "return-void"
    }
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->stopAnalyticsUploads()Z
        move-result v0
        if-eqz v0, :stock_behavior
    """.trimIndent() + "\n" + stop, ExternalLabel("stock_behavior", getInstruction(0)))
}
