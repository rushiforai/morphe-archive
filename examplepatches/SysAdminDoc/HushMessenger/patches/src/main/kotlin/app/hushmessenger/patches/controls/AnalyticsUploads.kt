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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

internal const val ANALYTICS_UPLOADS = "analytics_uploads"

private const val LOGGER = "Lcom/facebook/analytics2/logger"
private const val UPLOADER = "$LOGGER/legacy/uploader"
internal const val ANALYTICS2_UPLOAD_SERVICE = "$UPLOADER/Analytics2UploadService;"
private const val JOB_SERVICE = "Landroid/app/job/JobService;"
internal const val START_COMMAND = "onStartCommand(Landroid/content/Intent;II)I"
internal const val START_JOB = "onStartJob(Landroid/app/job/JobParameters;)Z"
internal const val RECEIVE = "onReceive(Landroid/content/Context;Landroid/content/Intent;)V"

/**
 * The components Messenger's analytics logger uploads through, and the methods Android calls to start each one. They
 * keep their names in every build because the manifest starts them by name.
 */
internal val ANALYTICS_UPLOAD_ENTRIES = mapOf(
    "$UPLOADER/AlarmBasedUploadService;" to setOf(START_COMMAND),
    "$UPLOADER/LollipopUploadService;" to setOf(START_COMMAND, START_JOB),
    "$LOGGER/service/LollipopUploadSafeService;" to setOf(START_COMMAND, START_JOB),
    "$LOGGER/GooglePlayUploadService;" to setOf(START_COMMAND),
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

/** Each entry point starts with a free register, and a service start keeps this and its start ID in invoke range. */
internal fun MutableMethod.validateAnalyticsUpload() {
    val entry = entryPoint()
    if (AccessFlags.STATIC.isSet(accessFlags) || entry !in setOf(START_COMMAND, START_JOB, RECEIVE)) {
        throw PatchException("Messenger controls: ${hookId()} isn't an analytics upload entry point")
    }
    validateScratch()
    if (entry == START_COMMAND && implementation!!.registerCount > 16) {
        throw PatchException("Messenger controls: the start ID in ${hookId()} is out of range")
    }
}

/**
 * While the switch is on, a service start stops that start and asks Android not to restart it, a job reports it has no
 * work and the retry receiver does nothing. Off, Pause and safe mode run Messenger's own code.
 */
internal fun MutableMethod.injectAnalyticsUpload() {
    validateAnalyticsUpload()
    val stop = when (entryPoint()) {
        START_COMMAND -> "invoke-virtual {p0, p3}, Landroid/app/Service;->stopSelf(I)V\nconst/4 v0, 0x2\nreturn v0"
        START_JOB -> "const/4 v0, 0x0\nreturn v0"
        else -> "return-void"
    }
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->stopAnalyticsUploads()Z
        move-result v0
        if-eqz v0, :stock_behavior
    """.trimIndent() + "\n" + stop, ExternalLabel("stock_behavior", getInstruction(0)))
}
