package app.heinrich26.patches.mtisland

import app.morphe.patcher.patch.bytecodePatch
import app.heinrich26.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.InstructionLocation.MatchFirst
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.*

@Suppress("unused")
val getProStatusPatch = bytecodePatch(
    name = "Unlock Pro",
    default = true
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    execute {
        GetOrCreateSecretKeyFingerprint.match()

        val decodeMethodRef = DecodeFingerprint.match(GetOrCreateSecretKeyFingerprint.originalClassDef)

        val getProStatusFingerprint = Fingerprint(
            /**
             * Exact access flags.
             */
//            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            /**
             * Return type. Partial matches are allowed and follows the same rules as [definingClass]
             * and [app.morphe.patcher.StringComparisonType].
             */
            returnType = "Ljava/lang/Object;",
            /**
             * Parameters. Partial matches are allowed and follows the same rules as
             * [app.morphe.patcher.StringComparisonType].
             *
             * Obfuscated class names must be declared only using the object type: "L"
             * Since obfuscated names change between app targets.
             */
            parameters = listOf("L"),
            /**
             * Instruction filters. See [app.morphe.patcher.InstructionFilter].
             */
            filters = listOf(
                opcode(Opcode.INSTANCE_OF, location = MatchFirst()),
                opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),

                string("call to 'resume' before 'invoke' with coroutine"),

                // methodCall(opcodes = listOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_STATIC), parameters = listOf("Ljava/lang/String;")),
                // anyInstruction(opcode(Opcode.INVOKE_DIRECT), opcode(Opcode.INVOKE_STATIC), location = MatchAfterImmediately()),
                // opcode(Opcode.THROW, MatchAfterImmediately()),

                opcode(Opcode.RETURN_OBJECT), // only there to prevent the next filter from matching the wrong const
                literal(0, opcodes = listOf(Opcode.CONST_4)), // filter 4
                // opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()), // filter 5
                // methodCall(name = "length"), // the parser doesn't look backwards

                methodCall(
                    reference = GetOrCreateSecretKeyFingerprint.originalMethod
                ),
                // move-result-object
                methodCall(
                    reference = decodeMethodRef.originalMethod,
                    location = MatchAfterWithin(2),
                    // parameters = listOf("Ljava/lang/String;") + DecodeFingerprint.parameters
                ),

                string("yes"),

                opcode(Opcode.MOVE_RESULT), // filter 8

                anyInstruction(
                    methodCall(smali = "Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;"),
                    methodCall(smali = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;")
                ), // filter 9
                opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
                opcode(Opcode.RETURN_OBJECT, MatchAfterImmediately())
            )
        ).match(GetOrCreateSecretKeyFingerprint.originalClassDef)

        getProStatusFingerprint.let {
            it.method.replaceInstructions(it.instructionMatches[8].index, "nop")

            val constInstr = it.instructionMatches[4]
            val register = constInstr.getInstruction<OneRegisterInstruction>().registerA
            it.method.replaceInstruction(constInstr.index, "const/4 v$register, 0x1")
        }

        val getProStatusFlowMatch = GetProStatusFlowFingerprint.match(DecodeFingerprint.originalClassDef)

        val lambdaClass = getProStatusFlowMatch.instructionMatches[2].getMethodCalled().definingClass

        val emitFlowOuterFingerprint = Fingerprint(
            definingClass = lambdaClass,
            parameters = listOf("L", "L"),
            returnType = "Ljava/lang/Object;",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            filters = listOf(
                opcode(Opcode.NEW_INSTANCE),
                methodCall(
                    name = "<init>",
                    parameters = listOf("L", decodeMethodRef.classDef.type, "I"),
                    returnType = "V",
                    opcodes = listOf(Opcode.INVOKE_DIRECT)),
            )
        ).match()


        val booleanFilter = methodCall(
            opcodes = listOf(Opcode.INVOKE_STATIC),
            smali = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"
        )
        val emitFlowMethod = Fingerprint(
            definingClass = emitFlowOuterFingerprint.instructionMatches[1].getMethodCalled().definingClass,
            parameters = listOf("Ljava/lang/Object;", "L"),
            returnType = "Ljava/lang/Object;",
            filters = listOf(
                booleanFilter,
                booleanFilter
            )
        ).match()

        emitFlowMethod.let {
            it.instructionMatches.reversed().forEach { m ->
                val register = m.getInstruction<BuilderInstruction35c>().registerC
                it.method.addInstruction(m.index, "const/4 v$register, 0x1")
            }
        }
    }
}
