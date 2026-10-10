/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450, 449 and 448 (2026-10-06). Hushfacebook's Block screenshot detection was
 * the behavior reference.
 */
package app.morphe.patches.threads.misc.screenshot

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireFreeAt
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.sendToStandIn
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.extendsClass
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Disable screenshot detection"
internal const val SCREENSHOT_DETECTION = "$EXTENSION_PACKAGE/misc/ScreenshotDetection;"
internal const val IGNORES_CHANGE = "$SCREENSHOT_DETECTION->ignoresChange()Z"
internal const val IGNORES_FILE = "$SCREENSHOT_DETECTION->ignoresScreenshotFile()Z"

internal const val ACTIVITY = "Landroid/app/Activity;"
private const val EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val CAPTURE_CALLBACK = "Landroid/app/Activity\$ScreenCaptureCallback;"
internal const val REGISTER_CAPTURE = "$SCREENSHOT_DETECTION->registerScreenCaptureCallback($ACTIVITY$EXECUTOR$CAPTURE_CALLBACK)V"

private const val CONTENT_OBSERVER = "Landroid/database/ContentObserver;"

/** The photo library watcher's query for a new picture: its file name has "screenshot" in it. */
internal const val SCREENSHOT_SELECTION = "'%screenshot%'"

/** What the screenshot folder watcher's report logs as it tells Threads' screens of a screenshot. */
internal const val REPORTING = "Reporting screenshot: %s -> %s"

/** What the same report logs when a file's name doesn't read as a screenshot's date. Only that method says it. */
internal const val PATH_PARSE_FAIL = "ig_android_screenshot_path_parse_fail"

/**
 * Keeps Threads from learning that you took a screenshot.
 *
 * Threads runs one of two screenshot detectors, both from Instagram's shared code. One is a
 * ContentObserver on the phone's photo library: on each change it queries MediaStore for a new
 * picture named like a screenshot and passes it on. The other watches the screenshot folders with
 * FileObservers, and its report method reads the date out of a new file's name and tells each
 * screen that asked. The extension is asked first thing in the observer's onChange and in that
 * report, and on a yes both return before they look at the picture. On Android 14 and newer the
 * feed also asks Android to report screenshots of it (`Activity.registerScreenCaptureCallback`);
 * each such call goes to the extension, which makes it or doesn't.
 *
 * The in-app browser asks for the same report through reflection, only for ads, and isn't
 * touched.
 *
 * Every anchor is a string or a framework signature, so a renamed build still finds them, and the
 * patch refuses rather than guessing when one of them isn't there exactly once.
 */
@Suppress("unused")
val disableScreenshotDetectionPatch = bytecodePatch(
    name = PATCH,
    description = "Threads isn't told when you take a screenshot. It stops watching your photos for new " +
        "screenshots. Good if you want to screenshot without Threads noticing. Starts off. Turn it on in " +
        "HushThreads settings > Privacy.",
) {
    category("Privacy")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("disableScreenshotDetection")
        // Everything is found before anything changes, so a refusal leaves the app as it was.
        val observer = libraryObserver()
        val report = folderReport()
        val captures = captureCalls()
        if (captures.isEmpty()) throw PatchException("$PATCH: Threads never asks Android to report screenshots")

        mutableClassDefBy(observer.definingClass).findMutableMethodOf(observer).returnFirstWhen(IGNORES_CHANGE)
        mutableClassDefBy(report.definingClass).findMutableMethodOf(report).returnFirstWhen(IGNORES_FILE)
        captures.groupBy({ it.first }, { it.second }).forEach { (type, methods) ->
            val classDef = mutableClassDefBy(type)
            for (reference in methods.distinctBy { it.toString() }) {
                val method = classDef.findMutableMethodOf(reference)
                captureIndices(method) { extendsActivity(it) }.asReversed().forEach { method.sendToStandIn(it, REGISTER_CAPTURE) }
            }
        }
        enableStatus("disableScreenshotDetection")
    }
}

internal fun Method.holdsString(value: String): Boolean = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string == value
} == true

/** Whether [this] is a ContentObserver's onChange(boolean, Uri), by its shape. */
internal fun Method.isObserverChange(): Boolean =
    name == "onChange" && returnType == "V" && !AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.map { it.toString() } == listOf("Z", "Landroid/net/Uri;")

/** Whether [this] is the folder watcher's report: static, void, taking its own detector, the file's path and its sources. */
internal fun Method.isFolderReport(): Boolean =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
        parameterTypes.map { it.toString() } == listOf(definingClass, "Ljava/lang/String;", "Ljava/util/List;")

/** The photo library watcher's onChange: a direct ContentObserver whose onChange queries for screenshot names. */
internal fun BytecodePatchContext.libraryObserver(): Method {
    val found = classDefByStrings(SCREENSHOT_SELECTION, StringComparisonType.EQUALS)
        .filter { it.superclass == CONTENT_OBSERVER }
        .flatMap { it.methods }
        .filter { it.isObserverChange() && it.holdsString(SCREENSHOT_SELECTION) }
        .distinctBy { it.definingClass }
    return found.singleOrNull()
        ?: throw PatchException("$PATCH: expected one photo library observer querying $SCREENSHOT_SELECTION, found ${found.size}")
}

/** The folder watcher's report: the one method that logs both [REPORTING] and [PATH_PARSE_FAIL]. */
internal fun BytecodePatchContext.folderReport(): Method {
    val found = classDefByStrings(PATH_PARSE_FAIL, StringComparisonType.EQUALS)
        .flatMap { it.methods }
        .filter { it.holdsString(PATH_PARSE_FAIL) && it.holdsString(REPORTING) }
        .distinctBy { "${it.definingClass}->${it.name}" }
    val report = found.singleOrNull()
        ?: throw PatchException("$PATCH: expected one screenshot folder report logging \"$REPORTING\", found ${found.size}")
    if (!report.isFolderReport()) {
        throw PatchException("$PATCH: the screenshot folder report ${report.definingClass}->${report.name} has another shape")
    }
    return report
}

/** Whether [instruction] asks Android to report screenshots of an activity, with [isActivity] saying which types are activities. */
internal fun isCaptureCall(instruction: Instruction, isActivity: (String) -> Boolean): Boolean {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = instruction.getReference<MethodReference>() ?: return false
    return call.name == "registerScreenCaptureCallback" && call.returnType == "V" &&
        call.parameterTypes.joinToString("") == "$EXECUTOR$CAPTURE_CALLBACK" && isActivity(call.definingClass)
}

/** The indices in [method] that make a capture call. */
internal fun captureIndices(method: Method, isActivity: (String) -> Boolean): List<Int> =
    method.implementation?.instructions?.withIndex()?.filter { isCaptureCall(it.value, isActivity) }?.map { it.index }.orEmpty()

/** Whether [type] is Activity or one of its subclasses, as far as the app's own classes say. */
private fun BytecodePatchContext.extendsActivity(type: String): Boolean = extendsClass(type, ACTIVITY)

/** Every method outside the extension that asks Android to report screenshots, by its class. */
internal fun BytecodePatchContext.captureCalls(): List<Pair<String, Method>> {
    val activities = HashMap<String, Boolean>()
    val isActivity = { type: String -> activities.getOrPut(type) { extendsActivity(type) } }
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.filter { captureIndices(it, isActivity).isNotEmpty() }.forEach { found += classDef.type to it }
    }
    return found
}

/**
 * Puts a check of [check] first in this void method, returning on a yes. It borrows v0, which
 * holds nothing before the method's own first instruction runs.
 */
internal fun MutableMethod.returnFirstWhen(check: String) {
    requireLocals(PATCH, 1)
    requireFreeAt(PATCH, 0, listOf(0))
    if (returnType != "V") throw PatchException("$PATCH: $definingClass->$name returns $returnType, not void")
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $check
            move-result v0
            if-eqz v0, :threads
            return-void
        """,
        ExternalLabel("threads", getInstruction(0)),
    )
}
