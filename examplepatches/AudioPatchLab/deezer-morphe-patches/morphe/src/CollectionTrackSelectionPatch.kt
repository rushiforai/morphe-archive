package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t

internal val deezerCompatibility = Compatibility(
    name = "Deezer",
    packageName = "deezer.android.app",
    apkFileType = ApkFileType.APKM_REQUIRED,
    targets = listOf(AppTarget(version = "9.0.27.3", minSdk = 26)),
)

private const val TRACK_RIGHTS = "LlIlIlIlllIIIll;"
private const val DISPLAY_RIGHTS = "morpheCollectionDisplayRights"
private const val TRACK_ROW_CONSTRUCTOR = "LIIlllIlIlllIIlI;-><init>(" +
    "Ljava/lang/String;Ljava/lang/String;$TRACK_RIGHTS" +
    "Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;IZZIIZ" +
    "LIlIlIIIlIIllllII;FZLIIlIlIIIIlIllIIl;Ljava/lang/Integer;I)V"

private fun collectionDisplayRightsMethod(): MutableMethod {
    val method = MutableMethod(
        ImmutableMethod(
            TRACK_RIGHTS, DISPLAY_RIGHTS, listOf(ImmutableMethodParameter(TRACK_RIGHTS, emptySet(), null)),
            TRACK_RIGHTS, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList()),
        ),
    )
    method.addInstructionsWithLabels(
        0,
        """
            sget-object v0, LlIlIlIlllIIIll;->IIlllIlllIlll:$TRACK_RIGHTS
            if-ne p0, v0, :keep_rights
            sget-object p0, LlIlIlIlllIIIll;->IIllllllllIlll:$TRACK_RIGHTS
            :keep_rights
            return-object p0
        """.trimIndent(),
    )
    return method
}

private fun collectionNumberedTitleMethod(): MutableMethod {
    val owner = TRACK_ROW_CONSTRUCTOR.substringBefore("->")
    val constructor = mutableClassDefBy(owner).methods.single {
        it.name == "<init>" && it.parameterTypes.size == 19
    }
    check(constructor.parameterTypes[1] == "Ljava/lang/String;" &&
        constructor.parameterTypes[17] == "Ljava/lang/Integer;")
    return MutableMethod(ImmutableMethod(
        owner, "morpheNumberedCollectionTitle", constructor.parameters, "Ljava/lang/String;",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(21, emptyList(), emptyList(), emptyList()),
    )).apply {
        addInstructionsWithLabels(0, """
            move-object/from16 v0, p17
            if-eqz v0, :original
            invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
            move-result v0
            move-object/from16 v1, p1
            invoke-static {v0, v1}, $NUMBERED_TITLE
            move-result-object v0
            return-object v0
            :original
            move-object/from16 v0, p1
            return-object v0
        """.trimIndent())
    }
}

private fun MutableMethod.showSelectableRows(numberedTitle: Boolean = false) {
    val instructions = checkNotNull(implementation).instructions
    val matches = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.INVOKE_DIRECT_RANGE &&
            (instructions[index] as ReferenceInstruction).reference.toString() == TRACK_ROW_CONSTRUCTOR
    }
    check(matches.size in 1..2)
    // R8 merges multiple row-mapping branches into the same coroutine in this version.
    for (index in matches.asReversed()) {
        val call = instructions[index] as RegisterRangeInstruction
        check(call.registerCount == 20)
        val rights = call.startRegister + 3
        if (numberedTitle) {
            val title = call.startRegister + 2
            val number = call.startRegister + 18
            val owner = TRACK_ROW_CONSTRUCTOR.substringBefore("->")
            val arguments = TRACK_ROW_CONSTRUCTOR.substringAfter("(").substringBefore(")")
            addInstructions(index, """
                invoke-static/range {v${call.startRegister + 1} .. v${call.startRegister + 19}}, $owner->morpheNumberedCollectionTitle($arguments)Ljava/lang/String;
                move-result-object v$title
                const/16 v$number, 0x0
            """.trimIndent())
        }
        addInstructions(index, """
            invoke-static/range {v$rights .. v$rights}, $TRACK_RIGHTS->$DISPLAY_RIGHTS($TRACK_RIGHTS)$TRACK_RIGHTS
            move-result-object v$rights
        """.trimIndent())
    }
}

private fun MutableMethod.replaceField(
    opcode: Opcode,
    owner: String,
    field: String,
    fieldType: String,
    replacement: String,
) {
    val instructions = checkNotNull(implementation).instructions
    val index = instructions.indices.single { index ->
        val instruction = instructions[index]
        instruction.opcode == opcode &&
            (instruction as ReferenceInstruction).reference.toString() == "$owner->$field:$fieldType"
    }
    val reference = ImmutableFieldReference(owner, replacement, fieldType)
    val instruction = instructions[index] as OneRegisterInstruction
    val updated = if (opcode == Opcode.IGET_OBJECT) {
        BuilderInstruction22c(opcode, instruction.registerA, (instruction as TwoRegisterInstruction).registerB, reference)
    } else {
        BuilderInstruction21c(opcode, instruction.registerA, reference)
    }
    replaceInstruction(index, updated)
}

private fun MutableMethod.useSelectedTrackAction() {
    val instructions = checkNotNull(implementation).instructions
    val rightsRead = instructions.indices.single { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.IGET_OBJECT && (instruction as ReferenceInstruction)
            .reference.toString() == "LllIIlIIIIlIllll;->llIIIIIIlIIIIll:LlIlIlIlllIIIll;"
    }
    check(instructions[rightsRead + 1].opcode == Opcode.INVOKE_VIRTUAL)
    check(instructions[rightsRead + 2].opcode == Opcode.MOVE_RESULT)
    val readable = instructions[rightsRead + 3] as BuilderInstruction21t
    check(readable.opcode == Opcode.IF_EQZ)
    val noOnDemand = instructions[rightsRead + 4] as BuilderInstruction22t
    check(noOnDemand.opcode == Opcode.IF_EQ && noOnDemand.registerA == readable.registerA)

    // NO_MOD goes to the same handler as READABLE. Unavailable and restricted tracks keep their branches.
    replaceInstruction(
        rightsRead + 4,
        BuilderInstruction22t(noOnDemand.opcode, noOnDemand.registerA, noOnDemand.registerB, readable.target),
    )

    val playbackPolicy = instructions.indices.single { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction)
            .reference.toString() == "LIIIIllIIIlII;->IIlIlIlIlIllllll(Ljava/lang/String;)LIIIlIllIllllII;"
    }
    val policyResult = instructions[playbackPolicy + 1] as OneRegisterInstruction
    check(policyResult.opcode == Opcode.MOVE_RESULT_OBJECT)
    // NotActive is the app's normal selection path, which passes the album/playlist and the track ID.
    replaceInstruction(playbackPolicy, "nop")
    replaceInstruction(
        playbackPolicy + 1,
        "sget-object v${policyResult.registerA}, LllllllIIIIllIll;->IllIlIlIIlIllIll:LllllllIIIIllIll;",
    )
}

internal val collectionTrackSelectionPatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(numberedTrackTitleSupport)

    execute {
        // The album page combines the preview flag with the user's playback mode.
        // When that combination selects TrackPreview, use the Tracks state instead.
        val albumTrackState = "LIllIIIIlIlIIIl;"
        mutableClassDefBy("LIllIlIllIlIIIII;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.replaceField(Opcode.SGET_OBJECT, albumTrackState, "IIlllIlllIlll", albumTrackState, "IIllllllllIlll")

        // The playlist view model has separate data flows for inline tracks and the preview card.
        mutableClassDefBy("LIllIlllIIIIlII;").methods.single {
            it.name == "invoke" && it.parameterTypes.isEmpty()
        }.replaceField(
            Opcode.IGET_OBJECT, "LllIIllllIlIIIlI;", "IllIllIlIIlllIlI",
            "LIlIlIllIllIIllII;", "IIIlIIlIlIIIlIlI",
        )

        check(mutableClassDefBy(TRACK_RIGHTS).methods.add(collectionDisplayRightsMethod()))
        check(mutableClassDefBy(TRACK_ROW_CONSTRUCTOR.substringBefore("->")).methods.add(collectionNumberedTitleMethod()))
        mutableClassDefBy("LlIIlIIlllIlllI;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.showSelectableRows(numberedTitle = true)
        // Album and playlist row constructors now share this merged coroutine.

        mutableClassDefBy("LIllIIIlIlIlIllI;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.useSelectedTrackAction()
        mutableClassDefBy("LIlIllllIllllIIIl;").methods.single {
            it.name == "lIllIIIIIllIlI" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.useSelectedTrackAction()

        // Starting a collection and starting a selected track share the same router.
        // Only the FromTrack requests use the direct queue action on ad-supported accounts.
        mutableClassDefBy("LIlllIIllllIIlI;").methods.single {
            it.name == "IIlIlIlIlIllllll" && it.parameterTypes == listOf("LlIIIIIlllIlIlll;")
        }.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, LIlllIIllllIIlI;->IIlllIlIIlIlII:LlIIIlIlIIIlI;
                iget-object v1, v0, LlIIIlIlIIIlI;->IIllllIIIIIlIIl:LIlIIIllIllllIlI;
                instance-of v1, v1, LIllIlIIlllIlII;
                if-eqz v1, :original
                return-object v0
                :original
                nop
            """.trimIndent(),
        )
        mutableClassDefBy("LlllllIIIllI;").methods.single {
            it.name == "IIlIlIlIlIllllll" && it.parameterTypes == listOf("LlIIIIIlllIlIlll;")
        }.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, LlllllIIIllI;->IIlIlIlIlIllllll:LlIIIIlIlIIIIIIll;
                iget-object v1, v0, LlIIIIlIlIIIIIIll;->IIllllIIIIIlIIl:LIlIIIllIlIIlIIl;
                instance-of v1, v1, LIlIllIIlllIII;
                if-eqz v1, :original
                return-object v0
                :original
                nop
            """.trimIndent(),
        )

        // Do not downgrade normal album/playlist playback to a radio mix when MOD is false.
        mutableClassDefBy("LlIIIIllIllIIIl;").methods.single {
            it.name == "llIIIlllllIlIl" &&
                it.parameterTypes == listOf("LIllllIIIIlIllIII;", "LIlIIlllIIlIIllll;") &&
                it.returnType == "Z"
        }.apply {
            val instructions = checkNotNull(implementation).instructions
            val modCheck = instructions.indices.first { index ->
                instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                    (instructions[index] as ReferenceInstruction).reference.toString() ==
                    "LIlIllIlIllIIllI;->IllIlIlIIlIllIll(I)Z"
            }
            val moveResult = instructions[modCheck + 1] as OneRegisterInstruction
            check(moveResult.opcode == Opcode.MOVE_RESULT)
            addInstructions(
                modCheck + 1,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
        }

        // Bypass JukeboxService's MOD/RADIO rights bitmask gate when starting selected tracks.
        val jukeboxService = mutableClassDefBy("Lcom/deezer/core/jukebox/JukeboxService;")
        jukeboxService.methods.single {
            it.name == "lIIIIlllIlllll" && it.parameterTypes == listOf("LIlIlllIlIIIlllI;") && it.returnType == "V"
        }.apply {
            val instructions = checkNotNull(implementation).instructions
            val blockCall = instructions.indices.single { index ->
                instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                    (instructions[index] as ReferenceInstruction).reference.toString() ==
                    "Lcom/deezer/core/jukebox/JukeboxService;->IIlIlIlIlIllllll(I)V"
            }
            val branch = instructions[blockCall - 1] as BuilderInstruction21t
            check(branch.opcode == Opcode.IF_EQZ)
            replaceInstruction(blockCall - 1, BuilderInstruction10t(Opcode.GOTO, branch.target))
        }
        jukeboxService.methods.single {
            it.name == "IllIlIlIIlIllIll" && it.parameterTypes == listOf("LIIIlIlIIlllIlIIl;") && it.returnType == "Z"
        }.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
