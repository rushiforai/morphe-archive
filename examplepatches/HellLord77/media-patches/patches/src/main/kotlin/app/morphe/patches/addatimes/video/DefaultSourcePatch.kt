package app.morphe.patches.addatimes.video

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.addatimes.shared.Constants.COMPATIBILITY_ADDATIMES
import app.morphe.patches.addatimes.shared.Constants.COMPATIBILITY_ADDATIMESTV
import app.morphe.patches.shared.morphe.androidx.media3.exoplayer.source.DefaultMediaSourceFactory
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference

@Suppress("unused")
val defaultSourcePatch =
    bytecodePatch(
        name = "Default source",
        description = "Use default media source for video player.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_ADDATIMES, COMPATIBILITY_ADDATIMESTV)

        execute {
            SetDataToPlayerFingerprint.matchSingle().apply {
                val newInstanceMatch = instructionMatches[0]
                val newInstanceInstruction =
                    newInstanceMatch.getInstruction<OneRegisterInstruction>()

                method.replaceInstruction(
                    newInstanceMatch.index,
                    BuilderInstruction21c(
                        Opcode.NEW_INSTANCE,
                        newInstanceInstruction.registerA,
                        ImmutableTypeReference(DefaultMediaSourceFactory.toString()),
                    ),
                )

                val initMethodCallMatch = instructionMatches[1]
                val initMethodCallInstruction =
                    initMethodCallMatch.getInstruction<FiveRegisterInstruction>()

                method.replaceInstruction(
                    initMethodCallMatch.index,
                    BuilderInstruction35c(
                        Opcode.INVOKE_DIRECT,
                        initMethodCallInstruction.registerCount,
                        initMethodCallInstruction.registerC,
                        initMethodCallInstruction.registerD,
                        initMethodCallInstruction.registerE,
                        initMethodCallInstruction.registerF,
                        initMethodCallInstruction.registerG,
                        DefaultMediaSourceFactory.ConstructorFingerprint.matchSingle().originalMethod,
                    ),
                )

                val setDrmSessionManagerProviderMatch = instructionMatches[2]
                val setDrmSessionManagerProviderInstruction =
                    setDrmSessionManagerProviderMatch.getInstruction<FiveRegisterInstruction>()

                method.replaceInstruction(
                    setDrmSessionManagerProviderMatch.index,
                    BuilderInstruction35c(
                        Opcode.INVOKE_VIRTUAL,
                        setDrmSessionManagerProviderInstruction.registerCount,
                        setDrmSessionManagerProviderInstruction.registerC,
                        setDrmSessionManagerProviderInstruction.registerD,
                        setDrmSessionManagerProviderInstruction.registerE,
                        setDrmSessionManagerProviderInstruction.registerF,
                        setDrmSessionManagerProviderInstruction.registerG,
                        DefaultMediaSourceFactory.SetDrmSessionManagerProviderFingerprint.matchSingle().originalMethod,
                    ),
                )

                val createMediaSourceMatch = instructionMatches[3]
                val createMediaSourceInstruction =
                    createMediaSourceMatch.getInstruction<FiveRegisterInstruction>()

                method.replaceInstruction(
                    createMediaSourceMatch.index,
                    BuilderInstruction35c(
                        Opcode.INVOKE_VIRTUAL,
                        createMediaSourceInstruction.registerCount,
                        createMediaSourceInstruction.registerC,
                        createMediaSourceInstruction.registerD,
                        createMediaSourceInstruction.registerE,
                        createMediaSourceInstruction.registerF,
                        createMediaSourceInstruction.registerG,
                        DefaultMediaSourceFactory.CreateMediaSourceFingerprint.matchSingle().originalMethod,
                    ),
                )
            }
        }
    }
