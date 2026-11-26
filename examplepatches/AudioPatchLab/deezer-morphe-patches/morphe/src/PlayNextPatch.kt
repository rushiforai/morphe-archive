package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val QUEUE_EDITION_ENUM = "LIIllIlIllllllIlI;->IllIlIlIlllIIlI:LIIllIlIllllllIlI;"
private const val HAS_ENTITLEMENT =
    "Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;->IIIlIIIIIIIlIl(LIIllIlIllllllIlI;)Z"
private const val TRACK_MENU = "LlIlIlIIIllIlllI;"
private const val MENU_TRACK = "LIlIIlIIlIIIIIIlI;"
private const val MENU_TRACK_PLAYABLE = "morpheCanQueueTrack"
private const val MENU_CONTEXT = "LIIllIIIlIIIIllll;"
private const val MENU_ACTION = "LIlIIlIllIlIIIl;"
private const val PREPEND_ACTION = "morphePrependPlayerAction"

private fun MutableMethod.allowQueueMenuAction(occurrence: Int, isTrackMenu: Boolean = false) {
    val instructions = checkNotNull(implementation).instructions
    val enumLoads = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.SGET_OBJECT &&
            (instructions[index] as ReferenceInstruction).reference.toString() == QUEUE_EDITION_ENUM
    }
    val start = enumLoads[occurrence]
    check(instructions[start + 1].opcode == Opcode.INVOKE_VIRTUAL)
    check((instructions[start + 1] as ReferenceInstruction).reference.toString() == HAS_ENTITLEMENT)
    val entitlementMove = instructions[start + 2] as OneRegisterInstruction
    check(entitlementMove.opcode == Opcode.MOVE_RESULT)
    replaceInstruction(start + 2, "const/4 v${entitlementMove.registerA}, 0x1")

    val editableCallIndex = (start + 3 until (start + 10).coerceAtMost(instructions.size)).firstOrNull { index ->
        (instructions[index].opcode == Opcode.INVOKE_INTERFACE ||
            instructions[index].opcode == Opcode.INVOKE_INTERFACE_RANGE ||
            instructions[index].opcode == Opcode.INVOKE_VIRTUAL) &&
            (instructions[index] as ReferenceInstruction).reference.toString().endsWith("->IlllIIllIIIIll()Z")
    }
    if (editableCallIndex != null) {
        val editableMove = instructions[editableCallIndex + 1] as OneRegisterInstruction
        check(editableMove.opcode == Opcode.MOVE_RESULT)
        replaceInstruction(editableCallIndex + 1, "const/4 v${editableMove.registerA}, 0x1")
    }

    if (isTrackMenu) {
        val playable = (start + 1 until start + 20).first { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE &&
                (instruction as ReferenceInstruction).reference.toString() == "LIlIIlIIlIIIIIIlI;->lIlIlIllIIIlIII()Z"
        }
        val call = instructions[playable] as RegisterRangeInstruction
        check(call.registerCount == 1)
        replaceInstruction(playable, BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE, call.startRegister, call.registerCount,
            ImmutableMethodReference(TRACK_MENU, MENU_TRACK_PLAYABLE, listOf(MENU_TRACK), "Z"),
        ))
    }
}

internal fun MutableMethod.showAddTrackToQueue() = allowQueueMenuAction(occurrence = 2, isTrackMenu = true)

internal fun MutableMethod.showAddCollectionToQueue() = allowQueueMenuAction(occurrence = 1)

internal fun MutableMethod.showPlayerQueueAction(actionField: String) {
    val instructions = checkNotNull(implementation).instructions
    val player = instructions.indices.single { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)?.string == "PLAYER"
    }
    val init = (player + 1 until instructions.size).first { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_DIRECT && (instruction as ReferenceInstruction).reference.toString() ==
            "$MENU_CONTEXT-><init>(Ljava/lang/String;I[$MENU_ACTION)V"
    }
    val constructor = instructions[init] as FiveRegisterInstruction
    check(constructor.registerCount == 4)
    val actions = constructor.registerF
    val ordinal = constructor.registerE
    val ordinalLoad = instructions[init - 1] as OneRegisterInstruction
    check(ordinalLoad.opcode == Opcode.CONST_4 && ordinalLoad.registerA == ordinal &&
        (ordinalLoad as WideLiteralInstruction).wideLiteral == 6L)
    addInstructions(
        init - 1,
        """
            sget-object v$ordinal, $MENU_ACTION->$actionField:$MENU_ACTION
            invoke-static {v$actions, v$ordinal}, $MENU_CONTEXT->$PREPEND_ACTION([$MENU_ACTION$MENU_ACTION)[$MENU_ACTION
            move-result-object v$actions
        """.trimIndent(),
    )
}

private fun prependPlayerAction(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        MENU_CONTEXT, PREPEND_ACTION,
        listOf("[$MENU_ACTION", MENU_ACTION).map { ImmutableMethodParameter(it, emptySet(), null) },
        "[$MENU_ACTION", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructions(
        0,
        """
            array-length v0, p0
            add-int/lit8 v1, v0, 0x1
            new-array v1, v1, [$MENU_ACTION
            const/4 v2, 0x0
            const/4 v3, 0x1
            aput-object p1, v1, v2
            invoke-static {p0, v2, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
            return-object v1
        """.trimIndent(),
    )
    return method
}

private fun queueTrackAvailability(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        TRACK_MENU, MENU_TRACK_PLAYABLE, listOf(ImmutableMethodParameter(MENU_TRACK, emptySet(), null)),
        "Z", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            invoke-interface {p0}, LIlIIlIIlIIIIIIlI;->lIlIlIllIIIlIII()Z
            move-result v0
            if-nez v0, :allowed
            instance-of v0, p0, LIIIIlIIIlllllIIl;
            if-eqz v0, :legacy
            check-cast p0, LIIIIlIIIlllllIIl;
            iget-object v0, p0, LIIIIlIIIlllllIIl;->IllIIIlllIIlIlll:LIIIllIlllIlIII;
            iget-object v0, v0, LIIIllIlllIlIII;->IllIlllIIIllIlII:LIlllllIllIlIII;
            sget-object v1, LIlllllIllIlIII;->lIIlIlIllIl:LIlllllIllIlIII;
            if-ne v0, v1, :unavailable
            :allowed
            const/4 v0, 0x1
            return v0
            :legacy
            instance-of v0, p0, LIIIlllIlIIlI;
            if-eqz v0, :unavailable
            invoke-interface {p0}, $MENU_TRACK->lIIIIIlllllIIIII()Z
            move-result v0
            return v0
            :unavailable
            const/4 v0, 0x0
            return v0
        """.trimIndent(),
    )
    return method
}

internal val queueInsertionSupportPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        check(mutableClassDefBy(TRACK_MENU).methods.add(queueTrackAvailability()))
        check(mutableClassDefBy(MENU_CONTEXT).methods.add(prependPlayerAction()))
        bypassQueueEditUpsell(
            mutableClassDefBy("LIlIlIIllllIllIII;"),
            mutableClassDefBy("LIlIlIlIlllllllI;"),
        )

        // Allow queue insertion in IIIlIlllIlIlllll even when the queue is locked.
        mutableClassDefBy("LlIlllIIIllllllI;").methods.single {
            it.name == "lIIIIIlllllIIIII" && it.parameterTypes == listOf("LIlIlIlIIllIIl;", "LIIIllIlIIIIIIll;")
        }.apply {
            val instructions = checkNotNull(implementation).instructions
            val lockMsg = instructions.indices.single { index ->
                ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "the player queue is currently locked."
            }
            val editableCall = (lockMsg - 1 downTo 0).first { index ->
                instructions[index].opcode == Opcode.INVOKE_INTERFACE &&
                    (instructions[index] as ReferenceInstruction).reference.toString() ==
                    "LIIIIIIlIlIllIlIl;->IlllIIllIIIIll()Z"
            }
            val moveResult = instructions[editableCall + 1] as OneRegisterInstruction
            check(moveResult.opcode == Opcode.MOVE_RESULT)
            replaceInstruction(editableCall + 1, "const/4 v${moveResult.registerA}, 0x1")
        }
    }
}

internal val playNextPatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(queueInsertionSupportPatch)

    execute {
        // This older menu shares its permission check for both queue actions.
        mutableClassDefBy("LIIlIlIIlllIIllll;").methods.single {
            it.name == "IIllIIlIIIlIIlll" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/ArrayList;"
        }.allowQueueMenuAction(occurrence = 0)

        mutableClassDefBy("LIIllIllIIlIIll;").methods.single {
            it.name == "lIIlIIlIlllllII" &&
                it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }.allowQueueMenuAction(occurrence = 0)

        mutableClassDefBy("LIlllIllIIlllIIl;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.allowQueueMenuAction(occurrence = 0)

        mutableClassDefBy(TRACK_MENU).methods.single {
            it.name == "IIllIIlIIIlIIlll" && it.parameterTypes.size == 6
        }.allowQueueMenuAction(occurrence = 0, isTrackMenu = true)

        mutableClassDefBy(MENU_CONTEXT).methods.single { it.name == "<clinit>" }
            .showPlayerQueueAction("llIIIlIIllllII")
    }
}
