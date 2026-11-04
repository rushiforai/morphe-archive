package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val REPLY_COMPOSER_CLASS =
    "Lcom/x/composer/minimal/b;"

private const val CALLBACK_CLASS =
    "Lcom/x/composer/minimal/s0;"

private const val OUTER_SURFACE =
    "Landroidx/compose/foundation/p;->l("

private const val INNER_CLICKABLE =
    "Landroidx/compose/foundation/e0;->c("

private const val HAZE_MODIFIER =
    "Lcom/x/compose/core/m0;->e("

private const val CALLBACK_CONSTRUCTOR =
    "Lcom/x/composer/minimal/s0;-><init>("

private val RENDER_CALLS = listOf(
    "Lcom/x/ui/common/user/z;->l(",
    "Lcom/x/composer/minimal/b;->d(",
    "Landroidx/compose/animation/g;->i(",
    "Landroidx/compose/material3/x;->h(",
    "Landroidx/compose/animation/g;->h("
)

@Suppress("unused")
val hidePostReplyBarKeepHazePatch = bytecodePatch(
    name = "Hide Post Reply Bar (Keep Haze)",
    description = "Hides post reply controls and tests removal of reply bar Haze tint while preserving native blur.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var composerOriginal: Method? = null
        var callbackOriginal: Method? = null

        classDefForEach { classDef ->
            when (classDef.type) {
                REPLY_COMPOSER_CLASS -> {
                    composerOriginal = classDef.methods.firstOrNull { method ->
                        method.name == "e" &&
                            method.returnType == "V" &&
                            method.parameterTypes.size == 23 &&
                            method.parameterTypes.firstOrNull()?.toString() ==
                                "Ldev/chrisbanes/haze/a1;" &&
                            method.parameterTypes.getOrNull(20)?.toString() ==
                                "Landroidx/compose/runtime/Composer;"
                    }
                }

                CALLBACK_CLASS -> {
                    callbackOriginal = classDef.methods.firstOrNull { method ->
                        method.name == "invoke" &&
                            method.returnType == "Ljava/lang/Object;" &&
                            method.parameterTypes.size == 1 &&
                            method.parameterTypes[0].toString() ==
                                "Ljava/lang/Object;"
                    }
                }
            }
        }

        val originalComposer = requireNotNull(composerOriginal) {
            "D3-F1.2: reply composer method not found."
        }

        val originalCallback = requireNotNull(callbackOriginal) {
            "D3-F1.2: callback invoke method not found."
        }

        val composer = mutableClassDefBy(
            originalComposer.definingClass
        ).methods.first {
            it.toString() == originalComposer.toString()
        }

        val callback = mutableClassDefBy(
            originalCallback.definingClass
        ).methods.first {
            it.toString() == originalCallback.toString()
        }

        val composerImplementation = requireNotNull(
            composer.implementation
        ) {
            "D3-F1.2: composer has no implementation."
        }

        val callbackImplementation = requireNotNull(
            callback.implementation
        ) {
            "D3-F1.2: callback has no implementation."
        }

        val instructions = composerImplementation.instructions.toList()

        fun referenceAt(index: Int): String? =
            (instructions[index] as? ReferenceInstruction)
                ?.reference?.toString()

        fun matchingInvokes(prefix: String): List<Int> =
            instructions.indices.filter { index ->
                val opcode = instructions[index].opcode

                (opcode == Opcode.INVOKE_STATIC ||
                    opcode == Opcode.INVOKE_STATIC_RANGE) &&
                    referenceAt(index)?.startsWith(prefix) == true
            }

        // ---------------------------------------------------------
        // D3-D: Hide reply controls and disable touch interception.
        // ---------------------------------------------------------

        val renderIndices = instructions.indices.filter { index ->
            val opcode = instructions[index].opcode

            (opcode == Opcode.INVOKE_STATIC ||
                opcode == Opcode.INVOKE_STATIC_RANGE) &&
                RENDER_CALLS.any { prefix ->
                    referenceAt(index)?.startsWith(prefix) == true
                }
        }

        val expectedCounts = mapOf(
            "Lcom/x/ui/common/user/z;->l(" to 1,
            "Lcom/x/composer/minimal/b;->d(" to 1,
            "Landroidx/compose/animation/g;->i(" to 2,
            "Landroidx/compose/material3/x;->h(" to 1,
            "Landroidx/compose/animation/g;->h(" to 1
        )

        expectedCounts.forEach { (prefix, expected) ->
            val actual = renderIndices.count { index ->
                referenceAt(index)?.startsWith(prefix) == true
            }

            require(actual == expected) {
                "D3-F1.2: expected $expected calls for $prefix, found $actual."
            }
        }

        require(renderIndices.size == 6) {
            "D3-F1.2: expected exactly six renderer calls."
        }

        require(matchingInvokes(HAZE_MODIFIER).size == 1) {
            "D3-F1.2: expected exactly one reply Haze call."
        }
        
        // D3-G: Bypass only the Reply Bar Haze modifier.
        // Preserve the incoming Modifier in v16.
        val hazeIndex = matchingInvokes(HAZE_MODIFIER).single()

        val hazeCall =
            instructions[hazeIndex] as? RegisterRangeInstruction

        val hazeResult =
            instructions.getOrNull(hazeIndex + 1)
                as? OneRegisterInstruction

        require(
            hazeCall?.startRegister == 16 &&
                hazeCall.registerCount == 7 &&
                instructions.getOrNull(hazeIndex + 1)?.opcode ==
                    Opcode.MOVE_RESULT_OBJECT &&
                hazeResult?.registerA == 6
        ) {
            "D3-G: unexpected Reply Bar Haze call registers."
        }
        
        val outerCandidates = matchingInvokes(OUTER_SURFACE)
            .filter { index ->
                val call =
                    instructions[index] as? FiveRegisterInstruction

                val result =
                    instructions.getOrNull(index + 1)
                        as? OneRegisterInstruction

                call != null &&
                    call.registerC == 2 &&
                    call.registerD == 3 &&
                    call.registerE == 4 &&
                    call.registerF == 5 &&
                    call.registerG == 11 &&
                    instructions.getOrNull(index + 1)?.opcode ==
                        Opcode.MOVE_RESULT_OBJECT &&
                    result?.registerA == 2
            }

        require(outerCandidates.size == 1) {
            "D3-F1.2: outer surface not uniquely identified."
        }

        val outerIndex = outerCandidates.single()

        val clickableCandidates = matchingInvokes(INNER_CLICKABLE)
            .filter { index ->
                val call =
                    instructions[index] as? RegisterRangeInstruction

                val result =
                    instructions.getOrNull(index + 1)
                        as? OneRegisterInstruction

                call?.startRegister == 16 &&
                    call.registerCount == 7 &&
                    instructions.getOrNull(index + 1)?.opcode ==
                        Opcode.MOVE_RESULT_OBJECT &&
                    result?.registerA == 6
            }

        require(clickableCandidates.size == 1) {
            "D3-F1.2: clickable modifier not uniquely identified."
        }

        val clickableIndex = clickableCandidates.single()

        val replacements = mutableListOf<Pair<Int, String>>()

        renderIndices.forEach { index ->
            replacements += index to "nop"
        }

        replacements += outerIndex to "nop"
        replacements += (outerIndex + 1) to "nop"

        replacements += clickableIndex to "nop"
        replacements += (clickableIndex + 1) to
            "move-object/from16 v6, v16"

        // D3-G: Remove the Reply Bar Haze effect.
        replacements += hazeIndex to "nop"
        replacements += (hazeIndex + 1) to
            "move-object/from16 v6, v16"

        // ---------------------------------------------------------
        // D3-F1.2: Set discriminator 2 only for reply callback.
        // ---------------------------------------------------------

        val constructorCandidates = instructions.indices.filter { index ->
            val instruction = instructions[index]

            instruction.opcode == Opcode.INVOKE_DIRECT &&
                referenceAt(index)?.startsWith(
                    CALLBACK_CONSTRUCTOR
                ) == true &&
                (instruction as? FiveRegisterInstruction)?.let { call ->
                    call.registerCount == 3 &&
                        call.registerC == 2 &&
                        call.registerE == 9
                } == true
        }

        require(constructorCandidates.size == 1) {
            "D3-F1.2: expected exactly one reply callback constructor."
        }

        val constructorIndex = constructorCandidates.single()

        val discriminatorCandidates =
            (maxOf(0, constructorIndex - 12) until constructorIndex)
                .filter { index ->
                    val instruction = instructions[index]

                    instruction.opcode == Opcode.CONST_4 &&
                        (instruction as? OneRegisterInstruction)
                            ?.registerA == 9
                }

        require(discriminatorCandidates.size == 1) {
            "D3-F1.2: reply callback discriminator not uniquely identified."
        }

        val discriminatorIndex = discriminatorCandidates.single()

        replacements += discriminatorIndex to "const/4 v9, 0x2"

        require(
            replacements.map { it.first }.distinct().size ==
                replacements.size
        ) {
            "D3-F1.2: conflicting composer replacements."
        }

        replacements.sortedByDescending { it.first }
            .forEach { (index, smali) ->
                composer.replaceInstruction(index, smali)
            }

        // ---------------------------------------------------------
        // D3-F1.2: Rebuild s0.invoke(Object) without packed-switch.
        // ---------------------------------------------------------

        require(callbackImplementation.registerCount == 4) {
            "D3-F1.2: expected four callback registers, found " +
                callbackImplementation.registerCount
        }

        val originalCallbackInstructions =
            callbackImplementation.instructions.toList()

        require(
            originalCallbackInstructions.count {
                it.opcode == Opcode.PACKED_SWITCH
            } == 1
        ) {
            "D3-F1.2: expected one original packed-switch."
        }

        require(
            originalCallbackInstructions.count {
                it.opcode == Opcode.PACKED_SWITCH_PAYLOAD
            } == 1
        ) {
            "D3-F1.2: expected one packed-switch payload."
        }

        require(
            originalCallbackInstructions.count {
                it.opcode == Opcode.INVOKE_INTERFACE &&
                    (it as? ReferenceInstruction)
                        ?.reference?.toString()?.startsWith(
                            "Ldev/chrisbanes/haze/blur/m;->c("
                        ) == true
            } == 2
        ) {
            "D3-F1.2: unexpected original callback structure."
        }

        callback.removeInstructions(
            0,
            originalCallbackInstructions.size
        )

        // Use a NOP placeholder for the branch.
        // The branch is constructed after the final instruction
        // positions have been established.

        callback.addInstructions(
            0,
            """
            iget-byte v0, p0, Lcom/x/composer/minimal/s0;->a:B
            iget-object v1, p0, Lcom/x/composer/minimal/s0;->b:Landroidx/compose/ui/graphics/u0;
            check-cast p1, Ldev/chrisbanes/haze/blur/m;
            invoke-interface {p1, v1}, Ldev/chrisbanes/haze/blur/m;->c(Landroidx/compose/ui/graphics/v;)V
            const/4 v1, 0x2
            nop
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            invoke-interface {p1, v0}, Ldev/chrisbanes/haze/blur/m;->h(Ljava/util/List;)V
            sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v0
            """.trimIndent()
        )

        require(callbackImplementation.instructions.size == 11) {
            "D3-F1.2: unexpected rebuilt callback size."
        }

        val returnLabel =
            callbackImplementation.newLabelForIndex(9)

        callback.replaceInstruction(
            5,
            BuilderInstruction22t(
                Opcode.IF_NE,
                0,
                1,
                returnLabel
            )
        )

        require(
            callbackImplementation.instructions.none {
                it.opcode == Opcode.PACKED_SWITCH ||
                    it.opcode == Opcode.PACKED_SWITCH_PAYLOAD
            }
        ) {
            "D3-F1.2: packed-switch remains in callback."
        }
    }
}
