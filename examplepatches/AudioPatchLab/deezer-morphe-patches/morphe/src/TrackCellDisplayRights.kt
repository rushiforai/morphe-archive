package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CELL_RIGHTS = "LIIIllIlllIlIII;"
private const val TRACK_RIGHTS = "LIlllllIllIlIII;"
private const val CELL_DISPLAY_RIGHTS = "morpheTrackCellDisplayRights"

private fun cellDisplayRights(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        CELL_RIGHTS,
        CELL_DISPLAY_RIGHTS,
        listOf(ImmutableMethodParameter(CELL_RIGHTS, emptySet(), null)),
        CELL_RIGHTS,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            iget-object v0, p0, LIIIllIlllIlIII;->IllIlllIIIllIlII:$TRACK_RIGHTS
            sget-object v1, LIlllllIllIlIII;->lIIlIlIllIl:$TRACK_RIGHTS
            if-ne v0, v1, :keep_rights
            iget-boolean v0, p0, LIIIllIlllIlIII;->lIIIIIlllllIIIII:Z
            sget-object v1, LIlllllIllIlIII;->lIlIIIlIllI:$TRACK_RIGHTS
            new-instance v2, $CELL_RIGHTS
            invoke-direct {v2, v0, v1}, $CELL_RIGHTS-><init>(Z$TRACK_RIGHTS)V
            return-object v2
            :keep_rights
            return-object p0
        """.trimIndent(),
    )
    return method
}

internal val trackCellDisplayRightsPatch = patch {
    compatibleWith(deezerCompatibility)
    execute {
        check(mutableClassDefBy(CELL_RIGHTS).methods.add(cellDisplayRights()))
    }
}

internal fun MutableMethod.showSelectableTrackCell(bind: Int) {
    val formatter = checkNotNull(implementation).instructions[bind] as RegisterRangeInstruction
    check(formatter.registerCount == 9 && (formatter as ReferenceInstruction).reference.toString().startsWith(
        "LIIlIlIlIllIlI;->llIllIIIlIlIl(LllIIlIIIll;",
    ))
    val rights = formatter.startRegister + 6
    addInstructionsWithLabels(
        bind,
        """
            invoke-static/range {v$rights .. v$rights}, $CELL_RIGHTS->$CELL_DISPLAY_RIGHTS($CELL_RIGHTS)$CELL_RIGHTS
            move-result-object v$rights
        """.trimIndent(),
    )
}

internal fun MutableMethod.showSelectableTrackCellsBeforeMapping(expectedCount: Int) {
    val instructions = checkNotNull(implementation).instructions
    val formatters = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.INVOKE_STATIC_RANGE &&
            (instructions[index] as ReferenceInstruction).reference.toString().startsWith(
                "LIIlIlIlIllIlI;->llIllIIIlIlIl(LllIIlIIIll;",
            ) &&
            (instructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference.toString() ==
                "LIIIllIllIIIlIIl;->IllIIIlllIIlIlll(LIlIlllIlIllllIIl;)LIlIIIlIIIllllIlI;"
    }
    check(formatters.size == expectedCount)
    formatters.asReversed().forEach { showSelectableTrackCell(it) }
}
