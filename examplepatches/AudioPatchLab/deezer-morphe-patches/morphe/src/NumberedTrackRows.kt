package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val NUMBERED_TITLE = "LIIlllIlIlllIIlI;->morpheNumberedTitle(ILjava/lang/String;)Ljava/lang/String;"

internal val numberedTrackTitleSupport = patch {
    compatibleWith(deezerCompatibility)
    execute {
        val track = "LIIlllIlIlllIIlI;"
        check(mutableClassDefBy(track).methods.add(numberedRowMethod(
            track, "morpheNumberedTitle", listOf("I", "Ljava/lang/String;"), "Ljava/lang/String;", 4,
            """
                new-instance v0, Ljava/lang/StringBuilder;
                invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
                invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                const-string v1, ". "
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        )))
    }
}

private const val SIZE = "LIlllIIlIlIIIllll;"
private const val RANK = "$SIZE->morpheArtistRank:I"
private const val RANKED_SIZE = "$SIZE->morpheWithArtistRank(${SIZE}I)$SIZE"
private const val SWIPE_CELL = "LIlIIIlllIIIIlllI;"
private const val TRACK_CELL = "LIIlIlIllllllIlII;"
private const val SWIPE_OPTIONS = "LIllllllIllllIllI;"
private const val TRACK_CELL_FLAGS = "LIIIlIIIllIIIlI;LIllllllIIlIlll;LlIIIIIllIlIIlllI;" +
    "LIlIlIIllllllIll;LIlIIIlIlIIllIII;LIlIIIlIlIIllIII;LIlIIIlIlIIllIII;I"
private const val CELL_TEXT = "LIlIIlllIIlIllII;"
private const val ARTIST_ROW = "LIlIIIIllIIllIIl;->IIIIIllIlIIllll(Ljava/lang/String;$SIZE"

internal val artistTrackNumberDisplaySupport = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(numberedTrackTitleSupport)

    execute {
        val size = mutableClassDefBy(SIZE)
        check(size.fields.add(MutableField(ImmutableField(
            SIZE, "morpheArtistRank", "I", AccessFlags.PUBLIC.value, null, emptySet(), emptySet(),
        ))))
        check(size.methods.add(numberedRowMethod(
            SIZE, "morpheWithArtistRank", listOf(SIZE, "I"), SIZE, 5,
            """
                iget v1, p0, LIlllIIlIlIIIllll;->llIIIIIIlIIIIll:I
                iget v2, p0, LIlllIIlIlIIIllll;->IllIlIlIIlIllIll:F
                new-instance v0, $SIZE
                invoke-direct {v0, v1, v2}, $SIZE-><init>(IF)V
                iput p1, v0, $RANK
                return-object v0
            """,
        )))
        val equals = size.methods.single { it.name == "equals" }
        val equalsInstructions = checkNotNull(equals.implementation).instructions
        val cast = equalsInstructions.indices.single { index ->
            equalsInstructions[index].opcode == Opcode.CHECK_CAST &&
                (equalsInstructions[index] as ReferenceInstruction).reference.toString() == SIZE
        }
        equals.addInstructionsWithLabels(cast + 1, """
            iget v0, p0, $RANK
            iget v1, p1, $RANK
            if-eq v0, v1, :same_rank
            const/4 v0, 0x0
            return v0
            :same_rank
            nop
        """.trimIndent())

        val abbreviated = mutableClassDefBy("LllIllIIIIIlIIII;").methods.single {
            it.name == "invoke" && it.parameterTypes.size == 2
        }
        abbreviated.numberArtistSection()

        val full = mutableClassDefBy("LIIlIlllllllIlIIl;").methods.single {
            it.name == "invoke" && it.parameterTypes.size == 4
        }
        val fullRender = full.findReference(Opcode.INVOKE_STATIC_RANGE, ARTIST_ROW)
        // The full artist list supplies a zero-based index in v2.
        full.addInstructions(fullRender, """
            add-int/lit8 v2, v2, 0x1
            invoke-static {v8, v2}, $RANKED_SIZE
            move-result-object v8
        """.trimIndent())

        val cellClass = mutableClassDefBy(SWIPE_CELL)
        check(cellClass.methods.add(artistDisplayCell()))
        val renderer = mutableClassDefBy("LIIIIIllIlIIIl;").methods.single {
            it.name == "invoke" && it.parameterTypes.size == 3
        }
        val render = renderer.findReference(Opcode.INVOKE_STATIC_RANGE,
            "LIIlIIllIIlIlllIl;->IIlllIlIIlIlII(${SWIPE_CELL}LIlllIlllIlIIlII;")
        val input = (checkNotNull(renderer.implementation).instructions[render] as RegisterRangeInstruction).startRegister
        renderer.addInstructions(render, """
            invoke-static/range {v$input .. v${input + 1}}, $SWIPE_CELL->morpheNumberedArtistCell($SWIPE_CELL$SIZE)$SWIPE_CELL
            move-result-object v$input
        """.trimIndent())
    }
}

private fun MutableMethod.numberArtistSection() {
    val instructions = checkNotNull(implementation).instructions
    val take = findReference(Opcode.INVOKE_STATIC,
        "LllIlllIllIlllI;->lIlllIIIllIIll(Ljava/lang/Iterable;I)Ljava/util/List;")
    check(instructions[take + 2].opcode == Opcode.CHECK_CAST &&
        (instructions[take + 2] as ReferenceInstruction).reference.toString() == "Ljava/lang/Iterable;")
    check((instructions[take + 3] as? ReferenceInstruction)?.reference.toString() ==
        "Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;")
    val iterator = (instructions[take + 3] as FiveRegisterInstruction).registerC
    replaceInstruction(take + 2, "check-cast v$iterator, Ljava/util/List;")
    replaceInstruction(take + 3, "invoke-interface {v$iterator}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;")
    val setup = findReference(Opcode.INVOKE_DIRECT, "$SIZE-><init>(IF)V")
    val args = instructions[setup] as FiveRegisterInstruction
    // After next(), the iterator's next index is the one-based rank of the current item.
    addInstructions(setup + 1, """
        invoke-interface {v$iterator}, Ljava/util/ListIterator;->nextIndex()I
        move-result v${args.registerE}
        iput v${args.registerE}, v${args.registerC}, $RANK
    """.trimIndent())
}

private fun artistDisplayCell() = numberedRowMethod(
    SWIPE_CELL, "morpheNumberedArtistCell", listOf(SWIPE_CELL, SIZE), SWIPE_CELL, 15,
    """
        iget v0, p1, $RANK
        if-lez v0, :original
        iget-object v12, p0, LIlIIIlllIIIIlllI;->IllIlIlIIlIllIll:$TRACK_CELL
        iget-object v11, v12, LIIlIlIllllllIlII;->IIIIIllIlIIllll:$CELL_TEXT
        iget-object v1, v11, LIlIIlllIIlIllII;->IllIlIlIIlIllIll:Ljava/lang/String;
        if-eqz v1, :original
        invoke-static {v0, v1}, $NUMBERED_TITLE
        move-result-object v1
        new-instance v0, $CELL_TEXT
        iget-object v2, v11, LIlIIlllIIlIllII;->llIIIIIIlIIIIll:Ljava/lang/String;
        iget-boolean v3, v11, LIlIIlllIIlIllII;->IIIIIllIlIIllll:Z
        iget-object v4, v11, LIlIIlllIIlIllII;->IIlIlIlIlIllllll:LIIllllIIllIllII;
        iget-object v5, v11, LIlIIlllIIlIllII;->IIllllIIIIIlIIl:LIIIIIIlllIIII;
        iget-boolean v6, v11, LIlIIlllIIlIllII;->IIlllIlIIlIlII:Z
        invoke-direct/range {v0 .. v6}, $CELL_TEXT-><init>(Ljava/lang/String;Ljava/lang/String;ZLIIllllIIllIllII;LIIIIIIlllIIII;Z)V
        move-object v3, v0
        new-instance v0, $TRACK_CELL
        iget-object v1, v12, LIIlIlIllllllIlII;->IllIlIlIIlIllIll:LIlIlIIllIIIl;
        iget-object v2, v12, LIIlIlIllllllIlII;->llIIIIIIlIIIIll:LlIllIllIIIIlIlI;
        iget-object v4, v12, LIIlIlIllllllIlII;->IIlIlIlIlIllllll:LIIIlIIIllIIIlI;
        iget-object v5, v12, LIIlIlIllllllIlII;->IIllllIIIIIlIIl:LIllllllIIlIlll;
        iget-object v6, v12, LIIlIlIllllllIlII;->IIlllIlIIlIlII:LlIIIIIllIlIIlllI;
        iget-object v7, v12, LIIlIlIllllllIlII;->lIlIIllIIlI:LIlIlIIllllllIll;
        iget-object v8, v12, LIIlIlIllllllIlII;->lIIIIlllIlllll:LIlIIIlIlIIllIII;
        iget-object v9, v12, LIIlIlIllllllIlII;->llIllllIllIIlIl:LIlIIIlIlIIllIII;
        iget-object v10, v12, LIIlIlIllllllIlII;->IlIIIlIIIIlllIl:LIlIIIlIlIIllIII;
        const/16 v11, 0x0
        invoke-direct/range {v0 .. v11}, $TRACK_CELL-><init>(LIlIlIIllIIIl;LlIllIllIIIIlIlI;$CELL_TEXT$TRACK_CELL_FLAGS)V
        iget-object v2, p0, LIlIIIlllIIIIlllI;->llIIIIIIlIIIIll:$SWIPE_OPTIONS
        new-instance v1, $SWIPE_CELL
        invoke-direct {v1, v0, v2}, $SWIPE_CELL-><init>($TRACK_CELL$SWIPE_OPTIONS)V
        return-object v1
        :original
        return-object p0
    """,
)

private fun numberedRowMethod(
    owner: String, name: String, arguments: List<String>, result: String, registers: Int, body: String,
) = MutableMethod(ImmutableMethod(
    owner, name, arguments.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
    emptySet(), emptySet(), ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList()),
)).apply {
    addInstructionsWithLabels(0, body.trimIndent())
}

private fun MutableMethod.findReference(opcode: Opcode, reference: String): Int =
    checkNotNull(implementation).instructions.withIndex().single { (_, instruction) ->
        instruction.opcode == opcode && (instruction as ReferenceInstruction).reference.toString().startsWith(reference)
    }.index
