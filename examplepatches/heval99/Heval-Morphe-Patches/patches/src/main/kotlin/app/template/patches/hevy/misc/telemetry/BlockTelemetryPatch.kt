// Ported from kveld9/kveld-morphe-patches (GPL-3.0), patches/hevy/HevyBlockTelemetryPatch.kt: the
// bytecode targets and the Sentry provider part of its manifest purge. Its permission stripping,
// WearOS service and Adjust receiver changes are not ported. getLegacyEvents now resolves an empty
// array (what the method itself returns on error) instead of null.
package app.template.patches.hevy.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_HEVY
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import java.util.logging.Logger

// Push (Firebase Messaging) and purchases (RevenueCat) must keep working; nothing here touches them.

// React Native looks the bridge modules and their @ReactMethods up by name, so R8 keeps them;
// Adjust ships keep rules for its com.adjust.sdk classes.
private const val SENTRY_MODULE = "Lio/sentry/react/RNSentryModule;"
private const val ADJUST_PACKAGE_HANDLER = "Lcom/adjust/sdk/PackageHandler;"
private const val AMPLITUDE_MODULE = "Lcom/amplitude/reactnative/AmplitudeReactNativeModule;"
private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"

// Sentry's auto-init is already off in the manifest (React Native starts it); these providers
// still run at process start.
private val SENTRY_PROVIDERS = setOf(
    "io.sentry.android.core.SentryInitProvider",
    "io.sentry.android.core.SentryPerformanceProvider",
)

private val disableSentryProvidersPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_HEVY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            val disabled = (0 until providers.length)
                .map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") in SENTRY_PROVIDERS }
                .onEach { it.setAttribute("android:enabled", "false") }
            if (disabled.isEmpty()) throw PatchException("No Sentry providers in AndroidManifest.xml")
        }
    }
}

/**
 * Every concrete method [name] of [type] (all overloads, or only the one taking [parameters]);
 * throws when there is none.
 */
private fun BytecodePatchContext.methods(
    type: String,
    name: String,
    parameters: List<String>? = null,
): List<MutableMethod> =
    mutableClassDefBy(type).methods
        .filter { it.name == name && it.implementation != null }
        .filter { parameters == null || it.parameterTypes.map(CharSequence::toString) == parameters }
        .ifEmpty { throw PatchException("$type.$name(${parameters?.joinToString().orEmpty()}) not found") }

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry & trackers",
    description = "Disables analytics, tracking and crash reporting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEVY)

    dependsOn(disableSentryProvidersPatch)

    execute {
        // 1. Sentry: initNativeSdk(ReadableMap, Promise) resolves true, as it does after a
        // successful init, without calling SentryAndroid.init. Since 3.2.2 RNSentryModuleImpl is
        // renamed, so the bridge method that delegates to it (its only caller) is hooked instead.
        methods(SENTRY_MODULE, "initNativeSdk", listOf("Lcom/facebook/react/bridge/ReadableMap;", PROMISE)).forEach {
            it.addInstructionsChecked(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-interface {p2, v0}, $PROMISE->resolve(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
        }

        // 2. Adjust: nothing is queued and the queue is never sent.
        methods(ADJUST_PACKAGE_HANDLER, "addPackage").forEach { it.returnEarly() }
        methods(ADJUST_PACKAGE_HANDLER, "sendFirstPackage").forEach { it.returnEarly() }

        // 3. Facebook: the app event queue never flushes. AppEventQueue is renamed since 3.2.2, so
        // flushAndWait, where every flush ends up, is hooked instead of flush.
        FacebookFlushAndWaitFingerprint.method.returnEarly()

        // 4. Amplitude: the ad ID is never read and no ad ID reaches JS; the legacy-database
        // migration finds no events to upload.
        // Since 3.2.7 both ad-ID readers are inlined into the CachedInfo constructor, which skips
        // them when its "advertising ID enabled" flag (a boolean of the outer provider class, tested
        // by the first conditional branch after the read) is false: force that flag to 0.
        AmplitudeCachedInfoFingerprint.method.apply {
            val outer = parameterTypes.firstOrNull()?.toString()
                ?: throw PatchException("Amplitude CachedInfo constructor has no outer-class parameter")
            val instructions = implementation!!.instructions.toList()
            val flagIndex = instructions.indices.firstOrNull { i ->
                val insn = instructions[i]
                if (insn.opcode != Opcode.IGET_BOOLEAN) return@firstOrNull false
                val field = (insn as ReferenceInstruction).reference as FieldReference
                if (field.type != "Z" || field.definingClass != outer) return@firstOrNull false
                val branch = instructions.drop(i + 1).firstOrNull { it.opcode.name.lowercase().replace('_', '-').startsWith("if-") }
                    ?: return@firstOrNull false
                (branch as OneRegisterInstruction).registerA == (insn as TwoRegisterInstruction).registerA
            } ?: throw PatchException("Amplitude CachedInfo advertising-ID flag read not found")
            val flagRegister = (instructions[flagIndex] as TwoRegisterInstruction).registerA
            addInstructionsChecked(
                flagIndex + 1,
                "${if (flagRegister < 16) "const/4" else "const/16"} v$flagRegister, 0x0",
            )
        }
        methods(AMPLITUDE_MODULE, "getLegacyEvents", listOf("Ljava/lang/String;", "Ljava/lang/String;", PROMISE)).forEach {
            it.addInstructionsChecked(
                0,
                """
                    new-instance v0, Lcom/facebook/react/bridge/WritableNativeArray;
                    invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeArray;-><init>()V
                    invoke-interface {p3, v0}, $PROMISE->resolve(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
        }

        // 5. Branch: tracking reads as disabled. Branch is renamed since 3.2.2.
        // Since 3.2.7 there is no isTrackingDisabled()Z method any more: the RN bridge, the SDK and
        // the activity-lifecycle callbacks (R8 inlined updateTrackingState into onActivityStopped)
        // read the tracking-state object's boolean field directly, and that field is reloaded from
        // the "bnc_tracking_state" preference or written by disableTracking(Context, Z). So the
        // field is resolved from the Branch constructor's load of the preference, and every read of
        // it, wherever it happens, is replaced by true.
        val trackingField = BranchTrackingStateFingerprint.method.let { ctor ->
            val instructions = ctor.implementation!!.instructions.toList()
            val keyIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "bnc_tracking_state"
            }
            if (keyIndex < 0) throw PatchException("Branch tracking-state key not found")
            val resultIndex = (keyIndex + 1 until instructions.size).firstOrNull {
                instructions[it].opcode == Opcode.MOVE_RESULT
            } ?: throw PatchException("Branch tracking-state preference read has no result")
            val resultRegister = (instructions[resultIndex] as OneRegisterInstruction).registerA
            val put = instructions.drop(resultIndex + 1).firstOrNull {
                it.opcode == Opcode.IPUT_BOOLEAN && (it as TwoRegisterInstruction).registerA == resultRegister &&
                    ((it as ReferenceInstruction).reference as FieldReference).type == "Z"
            } ?: throw PatchException("Branch tracking-state field store not found")
            (put as ReferenceInstruction).reference as FieldReference
        }

        // Collect first, read-only, then rewrite in the mutable classes.
        val readers = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { m -> m.implementation?.instructions?.any { it.isRead(trackingField) } == true }) {
                readers += classDef
            }
        }
        var forced = 0
        for (classDef in readers) {
            for (method in mutableClassDefBy(classDef).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                for ((index, insn) in instructions.withIndex()) {
                    if (!insn.isRead(trackingField)) continue
                    val register = (insn as TwoRegisterInstruction).registerA
                    method.replaceInstruction(index, "${if (register < 16) "const/4" else "const/16"} v$register, 0x1")
                    forced++
                }
            }
        }
        if (forced < MIN_TRACKING_READS) {
            throw PatchException(
                "Branch tracking-state field ${trackingField.definingClass}->${trackingField.name}: only $forced reads found",
            )
        }
        logger.info("Block telemetry: forced $forced reads of ${trackingField.definingClass}->${trackingField.name} to true")
    }
}

private val logger = Logger.getLogger("HevyBlockTelemetry")
private const val MIN_TRACKING_READS = 5

private fun Instruction.isRead(field: FieldReference): Boolean {
    if (opcode != Opcode.IGET_BOOLEAN) return false
    val read = (this as ReferenceInstruction).reference as FieldReference
    return read.definingClass == field.definingClass && read.name == field.name && read.type == field.type
}
