package app.s.chzzk.tongpow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.chat.SETTINGS
import app.s.chzzk.chat.chatCustomizationPatch
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.returnEarly
import app.s.chzzk.common.utils.smaliReference
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val POPUP = "Lcom/navercorp/game/android/community/app/ui/overlayplayerend/live/streaming/chat/popup/"
private const val CHAT_VM = "Lcom/navercorp/game/android/community/app/ui/overlayplayerend/live/streaming/chat/StreamingChatViewModel;"

@Suppress("unused")
val autoClaimTongPowPatch = bytecodePatch(
    name = "Auto claim TongPow",
    description = "Claims watch-time TongPow through the app's claim button handler. Can be disabled in Morphe settings.",
) {
    compatibleWith(COMPATIBILITY_CHZZK)
    dependsOn(chatCustomizationPatch)

    execute {
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
