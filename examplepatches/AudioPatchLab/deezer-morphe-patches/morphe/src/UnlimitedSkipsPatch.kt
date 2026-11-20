package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

internal val unlimitedSkipsPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        // Return 0 (unlimited) for radio_skips in the policy model so licenses and UI counters agree.
        val policySkips = mutableClassDefBy("Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;").methods.single {
            it.name == "IIlIlIlIlIllllll" && it.parameterTypes.isEmpty() && it.returnType == "I"
        }
        check(
            checkNotNull(policySkips.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;->lIIIIlllIlllll:I"
            },
        )
        policySkips.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // Allow skips and report unlimited (-1) remaining skips even before policy rights arrive.
        val skipTracker = mutableClassDefBy("LlIIIlIlIlIIIII;")
        val canSkipInWindow = skipTracker.methods.single {
            it.name == "IIlllIlIIlIlII" && it.parameterTypes == listOf("Z") && it.returnType == "Z"
        }
        check(
            checkNotNull(canSkipInWindow.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "LIlIllIlIllIIllI;->IIlllIlllIlll:I"
            },
        )
        canSkipInWindow.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        val remainingSkips = skipTracker.methods.single {
            it.name == "IIlIlIlIlIllllll" && it.parameterTypes.isEmpty() && it.returnType == "J"
        }
        check(
            checkNotNull(remainingSkips.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "LIlIllIlIllIIllI;->IIlllIlllIlll:I"
            },
        )
        remainingSkips.addInstructions(
            0,
            """
                const-wide/16 v0, -0x1
                return-wide v0
            """.trimIndent(),
        )

        val controlRights = skipTracker.methods.single {
            it.name == "IIIIIllIlIIllll" && it.parameterTypes == listOf("I") &&
                it.returnType == "LlIllIlIllIIllll;"
        }
        val rightsInstructions = checkNotNull(controlRights.implementation).instructions
        val limitedMask = rightsInstructions.indices.single { index ->
            val instruction = rightsInstructions[index]
            instruction.opcode == Opcode.CONST_WIDE_16 && (instruction as WideLiteralInstruction).wideLiteral == 3L
        }
        val maskRegister = (rightsInstructions[limitedMask] as OneRegisterInstruction).registerA
        val scratch = rightsInstructions[limitedMask + 1] as OneRegisterInstruction
        check(scratch.opcode == Opcode.CONST_4)
        // Music queue contexts 0 and 2 can publish previous/next even with the free-plan mask.
        // The native queue checks still decide whether there is a neighbour in either direction.
        controlRights.addInstructionsWithLabels(
            limitedMask + 1,
            """
                if-eqz p1, :allow_navigation
                const/4 v${scratch.registerA}, 0x2
                if-ne p1, v${scratch.registerA}, :continue_policy
                :allow_navigation
                const-wide/16 v$maskRegister, 0x33
                :continue_policy
                nop
            """.trimIndent(),
        )

        // Allow skipping to the next track in on-demand contexts (albums/playlists) after queue-end checks.
        val queueController = mutableClassDefBy("LlIIIIIlllIllllll;").methods.single {
            it.name == "IIlIlIlIllIlll" && it.parameterTypes == listOf("Z", "Z") && it.returnType == "Z"
        }
        val queueImplementation = checkNotNull(queueController.implementation)
        val queueInstructions = queueImplementation.instructions
        val rightsCheckIndex = queueInstructions.indices.single { index ->
            val instruction = queueInstructions[index]
            instruction.opcode == Opcode.IGET_OBJECT &&
                (instruction as ReferenceInstruction).reference.toString() ==
                "LlIIIIIlllIllllll;->IIIIlIIlllIll:LIllIlIIllIlIlIlI;"
        }
        val nonEmptyQueue = queueInstructions.withIndex().filter { (_, instruction) ->
            instruction is BuilderInstruction21t && instruction.target.location.index == rightsCheckIndex
        }
        check(nonEmptyQueue.size == 2)
        queueController.addInstructions(
            rightsCheckIndex,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
        // Both successful queue-boundary checks jump directly to the old first instruction.
        val allowSkip = queueImplementation.newLabelForIndex(rightsCheckIndex)
        nonEmptyQueue.forEach { (index, instruction) ->
            val branch = instruction as BuilderInstruction21t
            queueController.replaceInstruction(index, BuilderInstruction21t(branch.opcode, branch.registerA, allowSkip))
        }
    }
}
