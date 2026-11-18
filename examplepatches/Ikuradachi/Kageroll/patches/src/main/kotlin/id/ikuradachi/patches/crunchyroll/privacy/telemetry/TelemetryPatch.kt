package id.ikuradachi.patches.crunchyroll.privacy.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private fun MutableMethod.returnFalseAtZero() = addInstructions(
    0,
    """
        const/4 v0, 0x0
        return v0
    """.trimIndent(),
)

private fun MutableMethod.returnNullAtZero() = addInstructions(
    0,
    """
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(),
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Blocks Segment initialization, Mux events, advertising ID lookup, Firebase Analytics pre-init, Crashlytics NDK native loading, Braze session and push flush alarms, and Datadog uploads; disables Firebase Analytics after consent updates, denies automatic Crashlytics uploads, and selects disabled Datadog setup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Privacy")

    execute {
        SegmentAnalyticsBuildFingerprint.matchAll(1..1).single().method.returnNullAtZero()

        MuxEventAdmissionFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        run {
            val match = FirebaseAnalyticsCollectionObserverFingerprint.matchAll(1..1).single()
            val result = match.instructionMatches[1]
            val register = result.getInstruction<OneRegisterInstruction>().registerA
            val setter = match.instructionMatches.last().getInstruction<Instruction35c>()
            check(register in 0..15 && setter.registerCount == 2 && setter.registerD == register) {
                "Unexpected Firebase Analytics collection argument"
            }
            match.method.replaceInstruction(result.index, "const/4 v$register, 0x0")
        }

        AppMeasurementContentProviderOnCreateFingerprint.matchAll(1..1).single().method.returnFalseAtZero()

        run {
            val initMatch = ScionZzdfInitFingerprint.matchAll(1..1).single()
            initMatch.method.addInstruction(initMatch.instructionMatches.last().index + 1, "return-void")

            val enqueueMethod = ScionZzdfEnqueueFingerprint.matchAll(1..1).single().method
            val zzaClassType = enqueueMethod.parameterTypes.single().toString()
            val zzaClassDef = classDefBy(zzaClassType)
            val zzbMethod = ScionZzdfTaskRunFingerprint.match(zzaClassDef)
                .instructionMatches[1]
                .getMethodCalled()
            check(
                zzbMethod.definingClass == zzaClassType &&
                    zzbMethod.parameterTypes.isEmpty() &&
                    zzbMethod.returnType == "V",
            ) { "Unexpected Scion task cleanup callback: $zzbMethod" }

            enqueueMethod.addInstructions(
                0,
                """
                    invoke-virtual {p1}, $zzaClassType->${zzbMethod.name}()V
                    return-void
                """.trimIndent(),
            )
        }

        AdvertisingIdClientGetInfoFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            """
                new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                const-string v1, "00000000-0000-0000-0000-000000000000"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                return-object v0
            """.trimIndent(),
        )

        run {
            val match = CrashlyticsAutomaticPermissionFingerprint.matchAll(1..1).single()
            val method = match.method
            val implementation = requireNotNull(method.implementation)
            val instructions = implementation.instructions
            val log = match.instructionMatches.last()
            val call = log.getInstruction<Instruction35c>()
            check(
                implementation.registerCount == 2 && instructions.first().opcode == Opcode.MONITOR_ENTER &&
                    call.registerCount == 2 && call.registerC == 1 && call.registerD == 0 &&
                    instructions[log.index + 1].opcode == Opcode.MONITOR_EXIT &&
                    instructions[log.index + 2].opcode == Opcode.RETURN &&
                    (instructions[log.index + 2] as OneRegisterInstruction).registerA == 0,
            ) { "Unexpected Crashlytics automatic collection control flow" }
            // Replace the labelled slot so both preference/default branches execute the false assignment.
            method.replaceInstruction(log.index, "const/4 v0, 0x0")
            method.addInstructions(
                log.index + 1,
                "invoke-direct {p0, v0}, Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;->logDataCollectionState(Z)V",
            )
        }

        run {
            val jniClinitMatch = CrashlyticsJniNativeApiClinitFingerprint.matchAll(1..1).single()
            val loadLibMatch = jniClinitMatch.instructionMatches[2]
            val loadedConstMatch = jniClinitMatch.instructionMatches[3]
            val loadedReg = loadedConstMatch.getInstruction<OneRegisterInstruction>().registerA
            check(loadedReg in 0..15) { "Unexpected JniNativeApi loaded flag register: v$loadedReg" }
            jniClinitMatch.method.replaceInstruction(loadedConstMatch.index, "const/4 v$loadedReg, 0x0")
            jniClinitMatch.method.replaceInstruction(loadLibMatch.index, "nop")
        }

        CrashlyticsNdkPrepareNativeSessionFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        run {
            val match = DatadogSetupFingerprint.matchAll(1..1).single()
            val implementation = requireNotNull(match.method.implementation)
            val instructions = implementation.instructions
            val condition = match.instructionMatches[1]
            val register = condition.getInstruction<OneRegisterInstruction>().registerA
            val branch = instructions[match.instructionMatches[2].index] as BuilderInstruction21t
            val target = branch.target.location.index
            val validBranch = instructions.drop(target).take(4).map { it.opcode } == listOf(
                Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT,
                Opcode.MOVE_OBJECT, Opcode.SPUT_OBJECT,
            )
            check(
                implementation.registerCount == 63 && register in 0..15 && branch.registerA == register && validBranch,
            ) { "Unexpected Datadog disabled branch" }
            match.method.replaceInstruction(condition.index, "const/4 v$register, 0x0")
        }

        // Target 12: Mux 1000ms fixed delay scheduled polling loop
        val muxMatch = MuxEventQueue1000msTimerFingerprint.matchAll(1..1).single()
        val scheduleCall = muxMatch.instructionMatches.last()
        muxMatch.method.addInstruction(scheduleCall.index, "return-void")

        // Braze session seal AlarmManager scheduler
        BrazeSessionSealAlarmFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 14: Braze AlarmManager-scheduled push delivery flush receiver
        BrazeFlushReceiverFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 15: Datadog continuous in-memory upload thread starter
        DatadogUploadSchedulerStartFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")
    }
}
