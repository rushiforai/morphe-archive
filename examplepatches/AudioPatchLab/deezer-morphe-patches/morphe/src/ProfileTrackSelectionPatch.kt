package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val profileTrackSelectionPatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(trackCellDisplayRightsPatch)

    execute {
        val rows = mutableClassDefBy("LIlIIIIlIIIIIlI;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        rows.showSelectableTrackCellsBeforeMapping(expectedCount = 2)

        // The profile's native Top tracks queue starts with the selected track ID.
        val tap = mutableClassDefBy("LlIIllllllIlllIl;").methods.single {
            it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val actions = checkNotNull(tap.implementation).instructions
        val recommendationPlayback = actions.indices.single { index ->
            (actions[index] as? ReferenceInstruction)?.reference.toString() ==
                "LlIlIIlIIlll;->IllllIllIIIllIll:LIlIIlllllIIIIlI;"
        }
        check(actions[recommendationPlayback - 1].opcode == Opcode.IF_EQZ)
        tap.replaceInstruction(recommendationPlayback - 1, "nop")

        // The single-track router can still substitute a preview for the recommendation.
        // Keep the full-track action for profile recommendations and search.
        // ExactSearchTrackPatch replaces the search action's mix-backed fetch.
        mutableClassDefBy("LlIIIIIlIllIlllIl;").methods.single {
            it.name == "lIIlIIlIlllllII" && it.parameterTypes == listOf("LlIIIIIlIIIIlllII;")
        }.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, LlIIIIIlIllIlllIl;->IllIIIlllIIlIlll:LlIlIlllIllIIllI;
                iget-object v1, v0, LlIlIlllIllIIllI;->lIIIlIlIIIIIlII:LlIIIIlIlIllIIII;
                iget-object v1, v1, LlIIIIlIlIllIIII;->IllIlllIIIllIlII:LlIlIllIIlIlIlll;
                sget-object v2, LlIlIllIIlIlIlll;->llIllIIllIllllI:LlIlIllIIlIlIlll;
                if-eq v1, v2, :full_track
                sget-object v2, LlIlIllIIlIlIlll;->IlIlIIIllIIIllll:LlIlIllIIlIlIlll;
                if-eq v1, v2, :full_track
                sget-object v2, LlIlIllIIlIlIlll;->IlIIlllIIlIlIlIl:LlIlIllIIlIlIlll;
                if-eq v1, v2, :full_track
                sget-object v2, LlIlIllIIlIlIlll;->lIlIllIIll:LlIlIllIIlIlIlll;
                if-ne v1, v2, :original
                :full_track
                return-object v0
                :original
                nop
            """.trimIndent(),
        )

        val policy = actions.indices.single { index ->
            actions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                (actions[index] as ReferenceInstruction).reference.toString() ==
                "LIl;->lIIlIIlIlllllII(Ljava/lang/String;LIlIllIlIIllIIlll;)Z" &&
                (actions.getOrNull(index + 2) as? ReferenceInstruction)?.reference.toString() ==
                "LlIlIllIIlIlIlll;->IIIIlIIIIlIlllll:LlIlIllIIlIlIlll;"
        }
        val result = actions[policy + 1] as OneRegisterInstruction
        check(result.opcode == Opcode.MOVE_RESULT && actions[policy + 3].opcode == Opcode.IF_EQZ)
        tap.replaceInstruction(policy, "nop")
        tap.replaceInstruction(policy + 1, "const/4 v${result.registerA}, 0x1")

        // The full list uses legacy rows. Only change the playback policy for its callback.
        val legacyRows = mutableClassDefBy("LlIlIlIIlIIII;").methods.single {
            it.name == "lIIlIIlIlllllII" && it.parameterTypes == listOf("LIllIIIIIlIlIlIlI;")
        }
        val legacyInstructions = checkNotNull(legacyRows.implementation).instructions
        val legacyPolicy = legacyInstructions.indices.single { index ->
            (legacyInstructions[index] as? ReferenceInstruction)?.reference.toString() ==
                "LIIllIIlllIIllll;->lIIIIIlllllIIIII(LlIIlIllIIlIlI;Ljava/lang/String;)Z"
        }
        val legacyResult = legacyInstructions[legacyPolicy + 1] as OneRegisterInstruction
        check(legacyResult.opcode == Opcode.MOVE_RESULT &&
            (legacyInstructions[legacyPolicy + 2] as? ReferenceInstruction)?.reference.toString() ==
            "LlIlIlIIlIIII;->lIIIlIlIIIIIlII:LIllIllllIIlIlIIl;")
        legacyRows.addInstructionsWithLabels(
            legacyPolicy + 2,
            """
                move-object/from16 v8, p0
                iget-object v8, v8, LlIlIlIIlIIII;->IllllIllIIIllIll:LlIlllIIllIIlIl;
                instance-of v8, v8, LIIIllIIllIlllII;
                if-eqz v8, :keep_policy
                const/4 v${legacyResult.registerA}, 0x1
                :keep_policy
                nop
            """.trimIndent(),
        )

        val legacyTap = mutableClassDefBy("LIIIllIIllIlllII;").methods.single {
            it.name == "lIIlIlIIIlllIll" && it.parameterTypes == listOf("Landroid/view/View;", "Ljava/lang/Object;")
        }
        val legacyActions = checkNotNull(legacyTap.implementation).instructions
        val route = legacyActions.indices.single { index ->
            (legacyActions[index] as? ReferenceInstruction)?.reference.toString() ==
                "LllIllIIlllIlII;->lIIlIIlIlllllII(Ljava/lang/String;)LlIIIIIlIIIllllll;"
        }
        val routeResult = legacyActions[route + 1] as OneRegisterInstruction
        check(routeResult.opcode == Opcode.MOVE_RESULT_OBJECT)
        val routeRegister = routeResult.registerA
        // Keep the native paths for replaying a mix and starting the profile queue.
        legacyTap.addInstructionsWithLabels(
            route + 2,
            """
                instance-of v3, v$routeRegister, LlIllIIlIlIlII;
                if-eqz v3, :keep_route
                sget-object v$routeRegister, LIIIIIIIlllIlIIIl;->lIIIIIlllllIIIII:LIIIIIIIlllIlIIIl;
                :keep_route
                nop
            """.trimIndent(),
        )
    }
}
