package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun MutableMethod.ignoreQueueOffer(marker: String, method: String, resultOpcode: Opcode) {
    val instructions = checkNotNull(implementation).instructions
    val markerIndex = instructions.indices.single { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)?.string == marker
    }
    val lookup = (markerIndex + 1 until instructions.size).first { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction).reference.toString() == method
    }
    val result = instructions[lookup + 1] as OneRegisterInstruction
    check(result.opcode == resultOpcode)
    replaceInstruction(lookup, "nop")
    replaceInstruction(lookup + 1, "const/4 v${result.registerA}, 0x0")
}

private fun MutableMethod.skipQueueOffers() {
    // The trial call can open a screen before returning. Skip the call itself.
    ignoreQueueOffer("try_to_edit_queue_list", "LllllIIllIIlIIIl;->IIIIIllIlIIllll(LIllIIllIlIIll;)Z", Opcode.MOVE_RESULT)
    ignoreQueueOffer(
        "TRY_TO_EDIT_QUEUE_LIST",
        "LlIlIIlllIIll;->IllIlIlIIlIllIll(Ljava/lang/String;)Lcore/auth/module/models/AppConversionEntrypoint;",
        Opcode.MOVE_RESULT_OBJECT,
    )
}

internal fun bypassQueueEditUpsell(composeMenuClass: MutableClass, sheetMenuClass: MutableClass) {
    composeMenuClass.methods.single {
        it.name == "llIIlIlIlIllI" &&
            it.parameterTypes == listOf("LIlIIlIlIIIII;", "I", "I", "LIIIIIIllIIlIIIII;")
    }.skipQueueOffers()

    sheetMenuClass.methods.single {
        it.name == "lIIIIlllIlllll" && it.parameterTypes == listOf("LIIllIlllIIIlllI;")
    }.skipQueueOffers()
}

internal val queuePatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(queueInsertionSupportPatch)

    execute {
        val hasEntitlement = mutableClassDefBy("Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;").methods.single {
            it.name == "lIIIIlllIlllll" && it.parameterTypes == listOf("LlIlIIIllIlIlll;") && it.returnType == "Z"
        }
        check(
            checkNotNull(hasEntitlement.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "Lcom/deezer/core/data/model/policy/IllIlIlIIlIllIll;->IIlllIlIIlIlII:I"
            },
        )
        hasEntitlement.addInstructionsWithLabels(
            0,
            """
                sget-object v0, LlIlIIIllIlIlll;->lIlIIlIIlIlIllI:LlIlIIIllIlIlll;
                if-ne p1, v0, :original
                const/4 v0, 0x1
                return v0
                :original
                nop
            """.trimIndent(),
        )

        mutableClassDefBy("LIIlllIIIIIlIlIlI;").methods.single {
            it.name == "IIlllIlIIlIlII" && it.parameterTypes.size == 6
        }.showAddTrackToQueue()
        mutableClassDefBy("LIIIIIllllIllllI;").methods.single {
            it.name == "IIlIlIlIlIllllll" &&
                it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }.showAddCollectionToQueue()
        mutableClassDefBy("LIIllIIIIlIllIIIl;").methods.single { it.name == "<clinit>" }
            .showPlayerQueueAction("IIllIIIllllllI")
    }
}
