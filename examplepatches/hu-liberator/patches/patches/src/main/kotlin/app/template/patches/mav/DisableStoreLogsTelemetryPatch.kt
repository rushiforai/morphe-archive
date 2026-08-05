package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Verified against hu.mav.emmapp_merged.apk (smali: I8/b.smali method
 * r(Object), a Kotlin suspend-lambda's invokeSuspend body). Sends a batch of
 * queued client-side log entries to the app's own backend telemetry
 * endpoint (POST .../Log/V_SEGMENT/Log/StoreLogs, observed in practice as
 * mvapi.mav.hu/IN/PROD/Log/4_12_0_6/Log/StoreLogs) via a Retrofit interface:
 *
 *   new-instance v1, Lhu/mav/emmapp/data/papi/models/log/StoreLogsRequestModel;
 *   invoke-direct {v1, v2}, StoreLogsRequestModel;-><init>(Ljava/util/List;)V
 *   invoke-interface {p1, v1, p0}, LogApi;->logStoreLogsPost(...)Ljava/lang/Object;
 *
 * The Retrofit interface method itself (LogApi.logStoreLogsPost) has no
 * implementation to patch -- Retrofit generates it as a dynamic proxy at
 * runtime -- so this targets the caller instead. That caller class (I8.b) is
 * this app's own obfuscated code and gets renamed independently on every
 * build (the same situation that broke several other fingerprints in this
 * patch set), so this does NOT pin its class/method name. Unlike the
 * caller, `hu.mav.emmapp.data.papi.api.log.LogApi` and its
 * `logStoreLogsPost` method name are kept legible -- Retrofit needs a real
 * interface with intact method names and annotations to build its dynamic
 * proxy via reflection, so R8 can't obfuscate them without consumer keep
 * rules protecting them. This fingerprint's `custom` block finds whichever
 * method contains an `invoke-interface` call to that fixed target, wherever
 * its caller ends up living or being named.
 *
 * This caller class has a single constructor (unlike the merged/shared
 * synthetic classes seen elsewhere in this app), i.e. it's dedicated to this
 * one purpose, so it's safe to fully short-circuit with the same
 * prepend-and-return technique used for other single-purpose callbacks in
 * this patch set.
 */
object StoreLogsCallerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode == Opcode.INVOKE_INTERFACE &&
                (insn as ReferenceInstruction).reference.let {
                    it is MethodReference &&
                        it.definingClass == "Lhu/mav/emmapp/data/papi/api/log/LogApi;" &&
                        it.name == "logStoreLogsPost"
                }
        } == true
    },
)

@Suppress("unused")
val disableStoreLogsTelemetryPatch = bytecodePatch(
    name = "Disable StoreLogs telemetry",
    description = "Prevents the app from uploading queued client-side log entries to its own backend telemetry endpoint (.../Log/StoreLogs).",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        StoreLogsCallerFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}
