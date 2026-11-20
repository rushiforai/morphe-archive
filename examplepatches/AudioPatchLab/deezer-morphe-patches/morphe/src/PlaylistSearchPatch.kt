package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PLAYLIST_ACTIONS = "LIlIllIlIlIIIllI;"
private const val ACTION = "LIIIIlIlllll;"
private const val SEARCH_ACTION = "LlIIIlIIIlllllll;"
private const val SEARCH_LABEL = 0x7f1407a4
private const val ADD_SEARCH = "morpheAddPlaylistSearch"

private fun addPlaylistSearch(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        PLAYLIST_ACTIONS,
        ADD_SEARCH,
        listOf(ImmutableMethodParameter("[$ACTION", emptySet(), null)),
        "[$ACTION",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            const/4 v0, 0x0
            array-length v1, p0
            :find_search
            if-ge v0, v1, :append_search
            aget-object v2, p0, v0
            instance-of v2, v2, $SEARCH_ACTION
            if-nez v2, :keep_actions
            add-int/lit8 v0, v0, 0x1
            goto :find_search
            :append_search
            add-int/lit8 v2, v1, 0x1
            new-array v0, v2, [$ACTION
            const/4 v2, 0x0
            const/4 v3, 0x1
            invoke-static {p0, v2, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
            new-instance v2, LIIlIlIIIIlIllIIl;
            const v3, $SEARCH_LABEL
            const/16 v4, 0xe
            const/4 v5, 0x0
            invoke-direct {v2, v3, v4, v5, v5}, LIIlIlIIIIlIllIIl;-><init>(IILjava/lang/Integer;Ljava/util/List;)V
            new-instance v3, LIIllIlIllIlIllll;
            invoke-direct {v3, v5, v2}, LIIllIlIllIlIllll;-><init>(LIlIIIlIlIIllIII;LIlIIIlIlIIllIII;)V
            new-instance v2, LIIIllIllIIIllll;
            invoke-direct {v2, v3}, LIIIllIllIIIllll;-><init>(LIIllIlIllIlIllll;)V
            new-instance v3, $SEARCH_ACTION
            invoke-direct {v3, v2}, $SEARCH_ACTION-><init>(LIIIllIllIIIllll;)V
            aput-object v3, v0, v5
            return-object v0
            :keep_actions
            return-object p0
        """.trimIndent(),
    )
    return method
}

internal val playlistSearchPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        check(mutableClassDefBy(PLAYLIST_ACTIONS).methods.add(addPlaylistSearch()))
        val header = mutableClassDefBy("LllIIIllIIIIIII;").methods.single {
            it.name == "invoke" && it.parameterTypes == List(3) { "Ljava/lang/Object;" }
        }
        val instructions = checkNotNull(header.implementation).instructions
        val listActions = instructions.indices.single { index ->
            instructions[index].opcode == Opcode.INVOKE_STATIC &&
                (instructions[index] as ReferenceInstruction).reference.toString() ==
                "LllIlIlIIlIIIIlI;->IIIlIIlIIIllIII([Ljava/lang/Object;)LIlIIlllIlIlllllI;" &&
                (index - 8 until index).any { previous ->
                    (instructions.getOrNull(previous) as? ReferenceInstruction)?.reference.toString() ==
                        "LIlIllIlIlIIIllI;->IIIIIllIlIIllll:$ACTION"
                }
        }
        val call = instructions[listActions] as FiveRegisterInstruction
        check(call.registerCount == 1)
        val actions = call.registerC
        // Keep the normal native renderer and its existing search callback.
        header.addInstructionsWithLabels(
            listActions,
            """
                invoke-static {v$actions}, $PLAYLIST_ACTIONS->$ADD_SEARCH([$ACTION)[$ACTION
                move-result-object v$actions
            """.trimIndent(),
        )
    }
}
