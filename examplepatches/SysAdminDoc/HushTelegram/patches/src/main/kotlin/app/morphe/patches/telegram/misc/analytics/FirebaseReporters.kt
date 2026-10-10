/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Crashlytics' own collection switch: what setCrashlyticsCollectionEnabled saves, and what its arbiter reads first. */
internal const val CRASHLYTICS_COLLECTION = "firebase_crashlytics_collection_enabled"
/** The preferences file Crashlytics keeps that switch in. */
internal const val CRASHLYTICS_PREFS = "com.google.firebase.crashlytics"
/** Firebase Sessions' local override, read from the app's manifest metadata ahead of its remote settings. */
internal const val SESSIONS_OVERRIDE = "firebase_sessions_enabled"

private const val ANALYTICS = "$EXTENSION_PACKAGE/misc/Analytics;"
internal const val APPLICATION_LOADER = "Lorg/telegram/messenger/ApplicationLoader;"
internal const val SKIP_CRASH_REPORTER_START = "$ANALYTICS->skipCrashReporterStart()Z"
internal const val SKIP_ERROR_REPORT = "$ANALYTICS->skipErrorReport()Z"
internal const val SESSIONS_ENABLED = "$ANALYTICS->sessionsEnabled(Ljava/lang/Boolean;)Ljava/lang/Boolean;"
private const val EDITOR_PUT_BOOLEAN = "Landroid/content/SharedPreferences\$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences\$Editor;"

/** What an app carries of one Firebase reporter. */
internal sealed interface Carried<out T> {
    /** No trace of the SDK: telegram.org's regular build. Nothing to change and nothing to say. */
    object Absent : Carried<Nothing>
    /** The SDK is there but the place to stop it isn't proven. The patch says so and goes on without it. */
    data class Unproven(val why: String) : Carried<Nothing>
    data class Hookable<T>(val hook: T) : Carried<T>
}

/**
 * Telegram Beta's own Crashlytics start and its caught-error report, both in its ApplicationLoader.
 * [start] runs on every LaunchActivity create: it hands Crashlytics the user ID, username and
 * device details, then turns collection on through the SDK, which saves that choice. [errors]
 * hands a caught error to recordException.
 */
internal class CrashReporterHooks(val start: MutableMethod, val errors: MutableMethod)

/**
 * The Sessions local override reader and the indices of its returns. Its answer, when not null,
 * wins over the remote settings, so false keeps Sessions from collecting and sending.
 */
internal class SessionsHook(val method: MutableMethod, val returns: List<Int>)

private fun Instruction.reporterString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.reporterCall() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.reporterType() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
private fun Method.reporterBody(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
/** A method or a call to it, written the same way. A dexlib2 Method is a MethodReference too. */
private fun MethodReference.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun ClassDef.isOwn() = type.startsWith("Lapp/hushtelegram/")

/**
 * Crashlytics is carried when anything outside the extension names its collection switch. Then it
 * has to be proven: the SDK reads that switch from [CRASHLYTICS_PREFS], an entry class has the
 * no-argument method that saves it on, and Telegram's ApplicationLoader has startAppCenterInternal
 * calling exactly that method and appCenterLogInternal handing the same class a Throwable.
 */
internal fun BytecodePatchContext.resolveCrashReporter(): Carried<CrashReporterHooks> {
    val readers = mutableListOf<Method>()
    classDefForEach { cls ->
        if (cls.isOwn()) return@classDefForEach
        cls.methods.filter { m -> m.reporterBody().any { it.reporterString() == CRASHLYTICS_COLLECTION } }.forEach { readers += it }
    }
    if (readers.isEmpty()) return Carried.Absent
    fun unproven(why: String) = Carried.Unproven("Firebase crash reports are in this app, but $why")
    if (readers.none { m -> m.reporterBody().any { it.reporterString() == CRASHLYTICS_PREFS } }) {
        return unproven("nothing reads their collection switch from $CRASHLYTICS_PREFS")
    }
    // The setter: a public no-argument void method of the entry class that saves the switch.
    val setters = readers.filter { m -> m.parameterTypes.isEmpty() && m.returnType == "V" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
        m.reporterBody().any { it.reporterCall()?.key() == EDITOR_PUT_BOOLEAN } }
    val setter = setters.singleOrNull() ?: return unproven("${setters.size} methods save their collection switch")

    val loaders = mutableListOf<ClassDef>()
    classDefForEach { cls -> if (cls.superclass == APPLICATION_LOADER) loaders += cls }
    val loader = loaders.singleOrNull() ?: return unproven("${loaders.size} classes extend Telegram's ApplicationLoader")
    fun loaderMethod(name: String, parameter: String) = loader.methods.singleOrNull { it.name == name && it.returnType == "V" &&
        it.parameterTypes.map(CharSequence::toString) == listOf(parameter) && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null }
    val start = loaderMethod("startAppCenterInternal", "Landroid/app/Activity;")
        ?: return unproven("Telegram has no startAppCenterInternal of its own")
    val errors = loaderMethod("appCenterLogInternal", "Ljava/lang/Throwable;")
        ?: return unproven("Telegram has no appCenterLogInternal of its own")
    val entry = setter.definingClass
    val startBody = start.reporterBody()
    if (startBody.none { it.opcode == Opcode.CONST_CLASS && it.reporterType() == entry } ||
        startBody.count { it.reporterCall()?.key() == setter.key() } != 1) {
        return unproven("startAppCenterInternal doesn't turn their collection on once")
    }
    val errorBody = errors.reporterBody()
    if (errorBody.none { it.opcode == Opcode.CONST_CLASS && it.reporterType() == entry } ||
        errorBody.none { call -> call.reporterCall()?.let { it.definingClass == entry &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Throwable;") && it.returnType == "V" } == true }) {
        return unproven("appCenterLogInternal doesn't hand them its error")
    }
    for (method in listOf(start, errors)) {
        if (method.localRegisterCount() < 1) return unproven("${method.name} has no register to ask in")
        if (ControlFlow.of(method).normal.any { 0 in it }) return unproven("something jumps back to the start of ${method.name}")
    }
    val mutable = mutableClassDefBy(loader.type)
    return Carried.Hookable(CrashReporterHooks(
        mutable.methods.single { it.key() == start.key() },
        mutable.methods.single { it.key() == errors.key() },
    ))
}

/** Each method asks the extension first, and a yes returns before Crashlytics hears anything. */
internal fun CrashReporterHooks.apply() {
    start.returnEarlyWhen("Disable analytics", SKIP_CRASH_REPORTER_START, "return-void")
    errors.returnEarlyWhen("Disable analytics", SKIP_ERROR_REPORT, "return-void")
}

/**
 * Sessions is carried when anything outside the extension names its override. The reader has to
 * be the one instance method that takes nothing, answers a Boolean, looks the key up in a Bundle
 * with containsKey and getBoolean, and returns from nowhere else than its object returns.
 */
internal fun BytecodePatchContext.resolveSessions(): Carried<SessionsHook> {
    val named = mutableListOf<Method>()
    classDefForEach { cls ->
        if (cls.isOwn()) return@classDefForEach
        cls.methods.filter { m -> m.reporterBody().any { it.reporterString() == SESSIONS_OVERRIDE } }.forEach { named += it }
    }
    if (named.isEmpty()) return Carried.Absent
    fun unproven(why: String) = Carried.Unproven("Firebase session reports are in this app, but $why")
    val readers = named.filter { m -> m.parameterTypes.isEmpty() && m.returnType == "Ljava/lang/Boolean;" &&
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.reporterBody().let { body ->
            body.any { it.reporterCall()?.let { c -> c.name == "containsKey" && c.definingClass.endsWith("Bundle;") } == true } &&
                body.any { it.reporterCall()?.let { c -> c.name == "getBoolean" && c.definingClass.endsWith("Bundle;") &&
                    c.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") } == true }
        } }
    val reader = readers.singleOrNull() ?: return unproven("${readers.size} methods read their local override")
    val body = reader.reporterBody()
    val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty() || body.any { it.opcode in setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_VOID, Opcode.THROW) }) {
        return unproven("their local override doesn't only return an answer")
    }
    if (returns.any { (body[it] as OneRegisterInstruction).registerA > 255 }) return unproven("their local override answers from a register too high to pass on")
    val mutable = mutableClassDefBy(reader.definingClass).methods.single { it.key() == reader.key() }
    return Carried.Hookable(SessionsHook(mutable, returns))
}

/** Every answer the override reader gives passes through the extension on its way out. */
internal fun SessionsHook.apply() {
    for (index in returns.sortedDescending()) {
        val register = (method.getInstruction(index) as OneRegisterInstruction).registerA
        method.addInstructionsAtControlFlowLabel(index, """
            invoke-static/range {v$register .. v$register}, $SESSIONS_ENABLED
            move-result-object v$register
        """)
    }
}
