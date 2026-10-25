package app.template.patches.guardian.metering

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_GUARDIAN
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The Guardian decides per article between no wall, the free sign-in gate, the offline wall and
 * the metering API's answer (the article limit wall or the warm-up prompt). The patch makes the
 * metering API step answer None(shouldTrackArticleView = false) without a request, so no limit
 * wall, no warm-up prompt and no article view counting, and turns the offline wall into the
 * same None. The sign-in gate is kept, and the premium screens (live blogs, Discover, offline
 * download) are separate and left alone.
 */
@Suppress("unused")
val disableArticleLimitPatch = bytecodePatch(
    name = "Disable article limit",
    description = "Removes the article limit."
) {
    compatibleWith(COMPATIBILITY_GUARDIAN)

    execute {
        // The None state and its (Z) constructor. Fail loudly if it changes shape rather than
        // emit a call to a missing method.
        val noneClass = MeteringNoneToStringFingerprint.originalClassDef
        val none = noneClass.type
        val noneInit = noneClass.methods.any { method ->
            method.name == "<init>" && method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("Z")
        }
        if (!noneInit) throw PatchException("$none.<init>(Z)V not found")
        val offlineWall = OfflineWallToStringFingerprint.originalClassDef.type
        val signInWall = SignInWallToStringFingerprint.originalClassDef.type

        // 1. GetMeterApiState, the only caller of RetrofitApi.message, answers
        // None(shouldTrackArticleView = false) at entry: no meter/message request, no limit wall
        // or warm-up prompt, and TrackMeteredArticleView posts no article view.
        val callers = MeteringMessageCallFingerprint.matchAllOrNull().orEmpty()
        val meterApi = callers.singleOrNull() ?: throw PatchException(
            "Expected one $METERING_RETROFIT_API->message caller, found " +
                callers.map { "${it.classDef.type}->${it.method.name}" },
        )
        val meterApiState = meterApi.method
        if (!meterApiState.isSuspendStringToObject() ||
            !meterApiState.hasString("Failed to get metering message for articleId: ")
        ) {
            throw PatchException(
                "${meterApi.classDef.type}->${meterApiState.name} is not the (String, continuation) " +
                    "metering message use case",
            )
        }
        meterApiState.apply {
            val locals = implementation!!.registerCount - parameterTypes.size - 1
            if (locals < 2) throw PatchException("GetMeterApiState has only $locals locals")
            addInstructionsChecked(
                0,
                """
                    new-instance v0, $none
                    const/4 v1, 0x0
                    invoke-direct {v0, v1}, $none-><init>(Z)V
                    return-object v0
                """
            )
        }

        // 2. GetMeteringStateImpl, the only (String, continuation) use case that awaits
        // GetMeterApiState, returns the offline wall when there is no connection. That return
        // gives None(false) instead; its SignInWall branch is left alone.
        val stateMatches = Fingerprint(
            returnType = OBJECT,
            filters = listOf(
                methodCall(
                    definingClass = meterApiState.definingClass,
                    name = meterApiState.name,
                    parameters = meterApiState.parameterTypes.map(CharSequence::toString),
                    returnType = meterApiState.returnType,
                ),
            ),
            custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == STRING },
        ).matchAllOrNull().orEmpty()
        val stateMatch = stateMatches.singleOrNull() ?: throw PatchException(
            "Expected one GetMeteringStateImpl, found " +
                stateMatches.map { "${it.classDef.type}->${it.method.name}" },
        )
        val meteringState = stateMatch.method
        val stateLabel = "${stateMatch.classDef.type}->${meteringState.name}"
        val stateInstructions = meteringState.instructions.toList()
        if (!meteringState.isSuspendStringToObject() || !meteringState.hasString("sign_in_date_key") ||
            stateInstructions.none { it.isSingletonLoad(signInWall) }
        ) {
            throw PatchException("$stateLabel does not hold the sign-in gate checks")
        }
        val offlineLoads = stateInstructions.withIndex().filter { (_, instruction) ->
            instruction.isSingletonLoad(offlineWall)
        }
        val offlineIndex = offlineLoads.singleOrNull()?.index
            ?: throw PatchException("$stateLabel has ${offlineLoads.size} OfflineWall loads, expected one")
        val register = (stateInstructions[offlineIndex] as OneRegisterInstruction).registerA
        val returned = stateInstructions.getOrNull(offlineIndex + 1)
        if (returned?.opcode != Opcode.RETURN_OBJECT || (returned as OneRegisterInstruction).registerA != register) {
            throw PatchException("$stateLabel: the OfflineWall load is not followed by its return-object")
        }
        // The constructor call goes before the return, so the return must not be a branch target
        // (a jump to it would skip the call). invoke-direct takes 4-bit registers.
        if ((returned as BuilderInstruction).location.labels.isNotEmpty()) {
            throw PatchException("$stateLabel: the OfflineWall return is a branch target")
        }
        if (register >= 16) throw PatchException("$stateLabel: OfflineWall register v$register is not 4-bit")
        // Nothing reads a register after the return, so any other low register holds the flag.
        val flag = if (register == 0) 1 else 0
        meteringState.replaceInstruction(offlineIndex, "new-instance v$register, $none")
        meteringState.addInstructionsChecked(
            offlineIndex + 1,
            """
                const/4 v$flag, 0x0
                invoke-direct {v$register, v$flag}, $none-><init>(Z)V
            """
        )
    }
}

/** A suspend use case shape: (String, continuation) returning Object. */
private fun Method.isSuspendStringToObject(): Boolean {
    val parameters = parameterTypes.map(CharSequence::toString)
    return returnType == OBJECT && parameters.size == 2 && parameters[0] == STRING &&
        parameters[1] in CONTINUATIONS
}

private fun Method.hasString(value: String): Boolean =
    implementation?.instructions?.any { instruction ->
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == value
    } == true

/** sget-object of [type]'s own static field of type [type] (its singleton instance). */
private fun Instruction.isSingletonLoad(type: String): Boolean {
    if (opcode != Opcode.SGET_OBJECT) return false
    val field = (this as ReferenceInstruction).reference as FieldReference
    return field.definingClass == type && field.type == type
}
