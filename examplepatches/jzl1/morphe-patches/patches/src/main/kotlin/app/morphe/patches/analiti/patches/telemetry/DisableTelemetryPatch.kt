package lab.analiti.patches.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import lab.analiti.patches.shared.COMPATIBILITY_ANALITI

private const val ANALYTICS_PREF = "pref_key_privacy_analytics"
private const val CRASHLYTICS_OVERRIDE_FIELD = "i"
private const val CRASHLYTICS_OVERRIDE_TYPE = "Ljava/lang/Object;"
private const val SESSION_UPLOADER_EVENT = "FIREBASE_APPQUALITY_SESSION"

/**
 * Pins both Google telemetry switches to "off" at their single enforcement point.
 *
 * analiti already ships with telemetry disabled by default — the manifest declares
 * `firebase_analytics_collection_enabled=false` and
 * `firebase_crashlytics_collection_enabled=false` — and the privacy screen exposes
 * separate toggles for usage analytics and diagnostics. Both of those toggles are
 * read in one dispatcher method, so the consent path cannot be re-enabled from the
 * UI, a restored backup, or a future app update that flips a default.
 *
 * Two instructions are rewritten inside that dispatcher:
 *
 *  1. The Crashlytics override. The SDK's config object holds a tri-state
 *     (`Object i`): null falls back to the manifest flag, non-null wins. The
 *     dispatcher unconditionally stores a Boolean there, so rewriting the constant
 *     it loads makes it store `FALSE` instead. That leaves the manifest flag
 *     untouched but forces the winning value to "disabled". If the store already
 *     receives `FALSE` (e.g. on an already-patched build), this step is a no-op.
 *
 *  2. Usage analytics. The dispatcher reads the privacy preference with a default
 *     of `true` and hands the result straight to
 *     `setAnalyticsCollectionEnabled`. Replacing the `move-result-object` that
 *     carries that value forces the call to receive `false`.
 *
 *  3. App Quality session reporting. Firebase Sessions is a separate uploader from
 *     Crashlytics and does *not* consult the crash-reporting flag, so switching that
 *     flag off is not enough: the process still POSTs a session payload to
 *     `firebaselogging.googleapis.com`. The producer that enqueues
 *     `FIREBASE_APPQUALITY_SESSION` has exactly one call site and emits exactly that
 *     one event, so returning early from it suppresses the upload without affecting
 *     any other transport traffic.
 *
 * Deliberately does not touch Firebase Installations, Sessions, or the account /
 * subscription flows that share the same component graph: those still initialise,
 * they simply have no consent to report anything.
 *
 * All targets are resolved structurally (field type + method signature + string
 * literal), because the obfuscated class names differ between app versions:
 *  - 2026.10.98554: Crashlytics config `Lbb0;`, pref reader `Lpa1;->m`,
 *    session uploader `Lum0;`
 *  - 2026.10.98884: Crashlytics config `Leb0;`, pref reader `Lsa1;->o`,
 *    session uploader `Lan0;`
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Forces Firebase analytics and crash reporting off, ignoring the " +
            "in-app privacy toggles and their defaults.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANALITI)

    execute {
        val method = TelemetryDispatcherFingerprint.method

        forceCrashlyticsOff(method)
        forceAnalyticsOff(method)
        suppressSessionUploads(this)
    }
}

/**
 * The startup dispatcher that applies privacy settings to the Firebase SDKs.
 *
 * Anchored on two literals that only occur together here, so it survives both
 * obfuscation and the class being renamed.
 */
internal object TelemetryDispatcherFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("UsageAnalytics"),
        string(ANALYTICS_PREF),
    ),
)

/**
 * Rewrite the Boolean constant that the dispatcher stores into the Crashlytics
 * config's override field, so the field ends up holding `Boolean.FALSE`.
 *
 * The store is located by its field shape (name `i`, type `Ljava/lang/Object;`)
 * rather than by its obfuscated defining class, and the constant is then found by
 * walking backwards for the load that targets the same register. An existing
 * `Boolean.FALSE` store is treated as success so the patch is idempotent and also
 * accepts builds where the SDK already defaults to disabled.
 */
private fun forceCrashlyticsOff(method: MutableMethod) {
    val storeIndex = method.indexOfInstruction { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        instruction.opcode == Opcode.IPUT_OBJECT &&
                reference is FieldReference &&
                reference.name == CRASHLYTICS_OVERRIDE_FIELD &&
                reference.type == CRASHLYTICS_OVERRIDE_TYPE
    }
    if (storeIndex < 0) {
        throw PatchException("Could not locate the Crashlytics override store.")
    }

    val valueRegister = method.getInstruction<TwoRegisterInstruction>(storeIndex).registerA

    // Walk back to the load that feeds this store. Nothing may write the register in
    // between, otherwise the assumption behind the rewrite would not hold.
    for (index in storeIndex - 1 downTo 0) {
        val instruction = method.getInstruction<Instruction>(index)
        val reference = (instruction as? ReferenceInstruction)?.reference

        if (instruction.opcode == Opcode.SGET_OBJECT &&
            reference is FieldReference &&
            reference.definingClass == "Ljava/lang/Boolean;" &&
            (reference.name == "TRUE" || reference.name == "FALSE")
        ) {
            if (method.getInstruction<OneRegisterInstruction>(index).registerA != valueRegister) {
                continue
            }
            // Already forced off — nothing to rewrite.
            if (reference.name == "FALSE") return
            method.replaceInstruction(
                index,
                "sget-object v$valueRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
            )
            return
        }

        // A write to the value register means the constant we are looking for is
        // not the one that reaches the store.
        val written = when (instruction) {
            is OneRegisterInstruction -> instruction.registerA
            else -> -1
        }
        if (written == valueRegister) {
            throw PatchException(
                "Found the Crashlytics override store, but the value in v$valueRegister " +
                        "is not a Boolean constant.",
            )
        }
    }

    throw PatchException("Could not find the Boolean constant feeding the Crashlytics override.")
}

/**
 * Force the usage-analytics consent value to `false`.
 *
 * Locates the privacy preference read, then rewrites the `move-result-object` that
 * captures its return value. The reader class/method name is obfuscated differently
 * per version, so it is matched by its signature
 * `(String, Boolean) -> Boolean` instead.
 */
private fun forceAnalyticsOff(method: MutableMethod) {
    val prefStringIndex = method.indexOfInstruction { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is StringReference && reference.string == ANALYTICS_PREF
    }
    if (prefStringIndex < 0) {
        throw PatchException("Could not locate the analytics privacy preference read.")
    }

    val readIndex = method.indexOfInstruction(startIndex = prefStringIndex) { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        instruction.opcode == Opcode.INVOKE_STATIC &&
                reference is MethodReference &&
                reference.returnType == "Ljava/lang/Boolean;" &&
                reference.parameterTypes.map { it.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/lang/Boolean;")
    }
    if (readIndex < 0) {
        throw PatchException("Could not locate the analytics preference reader call.")
    }

    val resultIndex = readIndex + 1
    val result = method.getInstruction<Instruction>(resultIndex)
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException(
            "Expected a move-result-object after the analytics preference read, found " +
                    result.opcode.name,
        )
    }

    val resultRegister = method.getInstruction<OneRegisterInstruction>(resultIndex).registerA
    method.replaceInstruction(
        resultIndex,
        "sget-object v$resultRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
    )
}

/** Index of the first instruction at or after [startIndex] matching [predicate], or -1. */
private fun MutableMethod.indexOfInstruction(
    startIndex: Int = 0,
    predicate: (Instruction) -> Boolean,
): Int {
    val instructions = implementation?.instructions ?: return -1
    instructions.forEachIndexed { index, instruction ->
        if (index >= startIndex && predicate(instruction)) return index
    }
    return -1
}

/**
 * Stop Firebase Sessions from reporting app-quality sessions.
 *
 * The producer is located by the event name it enqueues, and verified to be the
 * uploader by checking that it also builds a transport message with the `json`
 * encoding that Firebase Sessions uses.
 */
private fun suppressSessionUploads(patchContext: BytecodePatchContext) {
    val method = with(patchContext) { SessionUploaderFingerprint.method }

    val eventIndex = method.indexOfInstruction { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is StringReference && reference.string == SESSION_UPLOADER_EVENT
    }
    if (eventIndex < 0) {
        throw PatchException("Could not locate the Firebase Sessions uploader.")
    }

    // Guard against matching an unrelated method that merely mentions the event name:
    // the real uploader also configures the `json` transport encoding.
    val hasJsonEncoding = method.indexOfInstruction { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is StringReference && reference.string == "json"
    } >= 0
    if (!hasJsonEncoding) {
        throw PatchException(
            "Found $SESSION_UPLOADER_EVENT but not the expected json transport encoding; " +
                    "refusing to patch an unrecognised method.",
        )
    }

    method.replaceInstruction(0, "return-void")
}

/**
 * The Firebase Sessions transport producer.
 *
 * A tiny method whose only job is to enqueue a `FIREBASE_APPQUALITY_SESSION` message.
 * Matched on the event literal plus the single-Object parameter shape; the defining
 * class is deliberately not constrained because its obfuscated name differs between
 * 2026.10.98554 (`Lum0;`) and 2026.10.98884 (`Lan0;`).
 */
internal object SessionUploaderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string(SESSION_UPLOADER_EVENT),
    ),
)
