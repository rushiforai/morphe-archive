package app.s.chzzk.tongpow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.chat.SETTINGS
import app.s.chzzk.chat.chatCustomizationPatch
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.returnEarly
import app.s.chzzk.common.utils.smaliReference
import app.s.chzzk.shared.Constants.CHZZK_TV_VERSIONS
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK_MOBILE
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val POPUP = "Lcom/navercorp/game/android/community/app/ui/overlayplayerend/live/streaming/chat/popup/"
private const val CHAT_VM = "Lcom/navercorp/game/android/community/app/ui/overlayplayerend/live/streaming/chat/StreamingChatViewModel;"

@Suppress("unused")
val autoClaimTongPowPatch = bytecodePatch(
    name = "Auto claim TongPow",
    description = "Claims watch-time TongPow through the app's claim button handler. Can be disabled in Morphe settings.",
) {
    compatibleWith(COMPATIBILITY_CHZZK_MOBILE)
    dependsOn(chatCustomizationPatch)

    execute {
        if (packageMetadata.versionName in CHZZK_TV_VERSIONS) return@execute
        if (packageMetadata.versionName == "3.18.0") {
            addMinifiedTongPowClaim()
            return@execute
        }

        val collector = mutableClassDefBy("${POPUP}StreamingPopupScreenKt\$StreamingLiveEndAcquiredTongPowView\$1\$3\$1\$1;")
        val original = collector.methods.single {
            it.parameterTypeNames == listOf("Ljava/lang/Object;", "Lkotlin/coroutines/Continuation;")
        }
        val implementation = original.implementation!!
        check(implementation.registerCount == 16)
        val update = implementation.instructions.withIndex().single { (_, instruction) ->
            val call = instruction.getReference<MethodReference>()
            call?.definingClass == "Lkotlinx/coroutines/flow/MutableStateFlow;" &&
                call.name == "setValue" && (instruction as? FiveRegisterInstruction)?.registerC == 15 &&
                instruction.registerD == 4
        }.index
        val chatField = collector.fields.single { it.type == CHAT_VM }
        val click = classDefBy("${POPUP}a;").methods.single {
            it.name == "<init>" && it.parameterTypeNames == listOf(
                "${POPUP}StreamingPopupViewModel;", "Landroidx/compose/runtime/State;", CHAT_VM
            )
        }
        val stateFactory = classDefBy("Landroidx/compose/runtime/SnapshotStateKt;").methods.single {
            it.returnType == "Landroidx/compose/runtime/MutableState;" &&
                it.parameterTypeNames == listOf("Ljava/lang/Object;")
        }
        val method = MutableMethod(ImmutableMethod(
            original.definingClass, original.name, original.parameters, original.returnType,
            original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(17, implementation.instructions, implementation.tryBlocks, implementation.debugItems)
        ))
        // Preserve the original register layout and retain the collector for the claim callback.
        method.addInstructionsWithLabels(update + 1, """
            invoke-static {}, $SETTINGS->autoClaim()Z
            move-result v5
            if-eqz v5, :manual_claim
            invoke-static {v4}, ${stateFactory.smaliReference}
            move-result-object v5
            move-object/from16 v6, v16
            iget-object v6, v6, ${chatField.smaliReference}
            new-instance v7, ${click.definingClass}
            invoke-direct {v7, v3, v5, v6}, ${click.smaliReference}
            invoke-virtual {v7}, ${click.definingClass}->invoke()Ljava/lang/Object;
            sget-object v7, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v7
            :manual_claim
            nop
        """.trimIndent())
        method.addInstructions(0, """
            move-object/from16 v13, p0
            move-object/from16 v14, p1
            move-object/from16 v15, p2
            move-object/from16 v16, v13
        """.trimIndent())
        collector.methods.remove(original)
        collector.methods.add(method)
        mutableClassDefBy(SETTINGS).methods.single { it.name == "autoClaimAvailable" }.returnEarly(true)
    }
}

private fun BytecodePatchContext.addMinifiedTongPowClaim() {
    val collector = mutableClassDefBy("Lcd0;")
    val method = collector.methods.single {
        it.name == "d" && it.parameterTypeNames == listOf("Ljava/lang/Object;", "Lkotlin/coroutines/Continuation;")
    }
    val instructions = method.implementation!!.instructions
    check(method.implementation!!.registerCount == 28)
    val update = instructions.withIndex().single { (_, instruction) ->
        instruction.getReference<MethodReference>()?.smaliReference ==
            "Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V" &&
            (instruction as? FiveRegisterInstruction)?.registerC == 10 && instruction.registerD == 1
    }.index
    check(instructions[update - 2].getReference<MethodReference>()?.definingClass == "Lmt0;")
    check(instructions[update + 1].getReference<FieldReference>()?.smaliReference == "Lmt0;->g:Ljava/lang/Integer;")
    check(instructions[update + 2].opcode == Opcode.IGET_OBJECT &&
        instructions[update + 2].getReference<FieldReference>()?.smaliReference == "La09;->y0:Lkotlinx/coroutines/Job;")
    val click = classDefBy("Lhx8;").methods.single {
        it.name == "<init>" && it.parameterTypeNames == listOf("Ljava/lang/Object;", "I", "Ljava/lang/Object;", "Ljava/lang/Object;")
    }
    val stateFactory = classDefBy("Landroidx/compose/runtime/SnapshotStateKt;").methods.single {
        it.returnType == "Landroidx/compose/runtime/MutableState;" && it.parameterTypeNames == listOf("Ljava/lang/Object;")
    }
    val helper = MutableMethod(ImmutableMethod(collector.type, "sChzzkClaimTongPow",
        List(3) { ImmutableMethodParameter("Ljava/lang/Object;", emptySet(), null) }, "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList())))
    helper.addInstructions(0, """
        invoke-static {}, $SETTINGS->autoClaim()Z
        move-result v0
        if-eqz v0, :manual
        invoke-static {p1}, ${stateFactory.smaliReference}
        move-result-object v0
        new-instance v1, ${click.definingClass}
        const/4 v2, 0x2
        invoke-direct {v1, p0, v2, v0, p2}, ${click.smaliReference}
        invoke-virtual {v1}, ${click.definingClass}->invoke()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Ljava/lang/Boolean;
        invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
        move-result v0
        return v0
        :manual
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    collector.methods.add(helper)
    // Only the ShowTongPowPopupInfo branch reaches this update. v1 is overwritten
    // by the next original field read; v15/v13 retain the popup/chat models.
    method.addInstructionsWithLabels(update + 1, """
        invoke-static {v15, v1, v13}, ${helper.smaliReference}
        move-result v1
        if-eqz v1, :manual_claim
        sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;
        return-object v1
        :manual_claim
        nop
    """.trimIndent())
    mutableClassDefBy(SETTINGS).methods.single { it.name == "autoClaimAvailable" }.returnEarly(true)
}
