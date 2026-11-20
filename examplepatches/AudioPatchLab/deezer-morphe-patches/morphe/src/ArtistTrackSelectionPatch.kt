package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ARTIST_TRACK_DATA = "LIIIIIlIlIIllIII;"
private const val RIGHTS_DATA = "LllIIlIIIIlIllll;"
private const val ARTIST_TRACK_RIGHTS = "LlIlIlIlllIIIll;"
private const val DISPLAY_DATA = "morpheArtistTrackData"

private fun selectableArtistTrackData(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        ARTIST_TRACK_DATA, DISPLAY_DATA, listOf(ImmutableMethodParameter(ARTIST_TRACK_DATA, emptySet(), null)),
        ARTIST_TRACK_DATA, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            iget-object v0, p0, LIIIIIlIlIIllIII;->IIlIlIlIlIllllll:$RIGHTS_DATA
            iget-object v1, v0, LllIIlIIIIlIllll;->llIIIIIIlIIIIll:$ARTIST_TRACK_RIGHTS
            sget-object v2, LlIlIlIlllIIIll;->IIlllIlllIlll:$ARTIST_TRACK_RIGHTS
            if-ne v1, v2, :keep_data
            iget-boolean v6, v0, LllIIlIIIIlIllll;->IllIlIlIIlIllIll:Z
            sget-object v2, LlIlIlIlllIIIll;->IIllllllllIlll:$ARTIST_TRACK_RIGHTS
            new-instance v4, $RIGHTS_DATA
            invoke-direct {v4, v6, v2}, $RIGHTS_DATA-><init>(Z$ARTIST_TRACK_RIGHTS)V
            iget-object v1, p0, LIIIIIlIlIIllIII;->IllIlIlIIlIllIll:LIIllIIIlIIllIIl;
            iget-object v2, p0, LIIIIIlIlIIllIII;->llIIIIIIlIIIIll:LllllIllllIllII;
            iget-object v3, p0, LIIIIIlIlIIllIII;->IIIIIllIlIIllll:LIlIIIllIIIIIlI;
            iget-boolean v5, p0, LIIIIIlIlIIllIII;->IIllllIIIIIlIIl:Z
            new-instance v0, $ARTIST_TRACK_DATA
            invoke-direct/range {v0 .. v5}, $ARTIST_TRACK_DATA-><init>(LIIllIIIlIIllIIl;LllllIllllIllII;LIlIIIllIIIIIlI;${RIGHTS_DATA}Z)V
            return-object v0
            :keep_data
            return-object p0
        """.trimIndent(),
    )
    return method
}

private fun MutableMethod.useArtistTrackAction() {
    val instructions = checkNotNull(implementation).instructions
    val policy = instructions.indices.single { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction).reference.toString() ==
            "LIIIIllIIIlII;->IIlIlIlIlIllllll(Ljava/lang/String;)LIIIlIllIllllII;"
    }
    val result = instructions[policy + 1] as OneRegisterInstruction
    check(result.opcode == Opcode.MOVE_RESULT_OBJECT)
    replaceInstruction(policy, "nop")
    replaceInstruction(policy + 1, "sget-object v${result.registerA}, LllllllIIIIllIll;->IllIlIlIIlIllIll:LllllllIIIIllIll;")
}

private fun MutableMethod.showSelectableArtistTrack() {
    val instructions = checkNotNull(implementation).instructions
    val bind = instructions.indices.single { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction).reference.toString() ==
            "LIlllIIllIllIlll;->lIllIIllIIl(${ARTIST_TRACK_DATA}Z)LIlIIIlllIIIIlllI;"
    }
    val call = instructions[bind] as FiveRegisterInstruction
    check(call.registerCount == 3)
    val trackData = call.registerD
    // The full list has branches that target the converter call directly.
    replaceInstruction(bind, "invoke-static {v$trackData}, $ARTIST_TRACK_DATA->$DISPLAY_DATA($ARTIST_TRACK_DATA)$ARTIST_TRACK_DATA")
    addInstructions(
        bind + 1,
        """
            move-result-object v$trackData
            invoke-virtual {v${call.registerC}, v$trackData, v${call.registerE}}, LIlllIIllIllIlll;->lIllIIllIIl(${ARTIST_TRACK_DATA}Z)LIlIIIlllIIIIlllI;
        """.trimIndent(),
    )
}

internal val artistTrackSelectionPatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(artistTrackNumberDisplaySupport)

    execute {
        val topTracks = mutableClassDefBy("LlIIlIIIIIllll;").methods.single {
            it.name == "IllIlIlIIlIllIll" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val instructions = checkNotNull(topTracks.implementation).instructions
        val list = instructions.indices.single { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.IGET_OBJECT && (instruction as ReferenceInstruction).reference.toString() ==
                "LIIlIIlIIllIIIll;->IIIIIllIlIIllll:Ljava/util/List;" && index + 2 < instructions.size &&
                (instructions[index + 2] as? ReferenceInstruction)?.reference.toString() ==
                "LlIIlIIIIIllll;->llIlIllIIIl:Z"
        }
        val compactFlag = instructions[list + 2] as OneRegisterInstruction
        check(compactFlag.opcode == Opcode.IGET_BOOLEAN)
        topTracks.replaceInstruction(list + 2, "const/4 v${compactFlag.registerA}, 0x0")

        check(mutableClassDefBy(ARTIST_TRACK_DATA).methods.add(selectableArtistTrackData()))
        // The artist page and the full Top tracks screen bind their rows separately.
        mutableClassDefBy("LIIIlllIlIIIlIIIl;").methods.single {
            it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.showSelectableArtistTrack()
        mutableClassDefBy("LlIIlIIlllIlllI;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.showSelectableArtistTrack()

        mutableClassDefBy("LlllllllIlll;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.useArtistTrackAction()

        val allTracks = mutableClassDefBy("LIllIllIIIlIlIIII;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val actions = checkNotNull(allTracks.implementation).instructions
        val rights = actions.indices.single { index ->
            val instruction = actions[index]
            instruction.opcode == Opcode.IGET_OBJECT && (instruction as ReferenceInstruction).reference.toString() ==
                "LllIIlIIIIlIllll;->llIIIIIIlIIIIll:LlIlIlIlllIIIll;"
        }
        val readable = actions[rights + 3] as BuilderInstruction21t
        val noOnDemand = actions[rights + 4] as BuilderInstruction22t
        check(readable.opcode == Opcode.IF_EQZ && noOnDemand.opcode == Opcode.IF_EQ)
        allTracks.replaceInstruction(rights + 4, BuilderInstruction22t(
            noOnDemand.opcode, noOnDemand.registerA, noOnDemand.registerB, readable.target,
        ))
        allTracks.useArtistTrackAction()

        // The artist's Mix button shares this router. Send only explicit tracks to the artist queue.
        mutableClassDefBy("LIlIIIlIlIIIIIllI;").methods.single {
            it.name == "IIlIlIlIlIllllll" && it.parameterTypes == listOf("LlIIIIIlllIlIlll;")
        }.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, LIlIIIlIlIIIIIllI;->IIllllIIIIIlIIl:LIllIllllIIIIlll;
                iget-object v1, v0, LIllIllllIIIIlll;->lIlIIllIIlI:Ljava/lang/Object;
                instance-of v1, v1, LIlIlIIllIlllIIII;
                if-eqz v1, :original
                return-object v0
                :original
                nop
            """.trimIndent(),
        )
    }
}
