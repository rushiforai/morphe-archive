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
    ignoreQueueOffer("try_to_edit_queue_list", "LIIllIIlIlIIIlIIl;->IllIIIlllIIlIlll(LllIIIlIIllllII;)Z", Opcode.MOVE_RESULT)
    ignoreQueueOffer(
        "TRY_TO_EDIT_QUEUE_LIST",
        "LlIlIllIIllllI;->lIIIIIlllllIIIII(Ljava/lang/String;)Lcore/auth/module/models/AppConversionEntrypoint;",
        Opcode.MOVE_RESULT_OBJECT,
    )
}

internal fun bypassQueueEditUpsell(composeMenuClass: MutableClass, sheetMenuClass: MutableClass) {
    composeMenuClass.methods.single {
        it.name == "IIIIlIlIllIllllI" &&
            it.parameterTypes == listOf("LIlIIlIIlIIIIIIlI;", "I", "I", "LIlIIIlllIlIlIIIl;")
    }.skipQueueOffers()

    sheetMenuClass.methods.single {
        it.name == "IIIlIIIIIIIlIl" && it.parameterTypes == listOf("LIlIlllllIIIIlIII;")
    }.skipQueueOffers()
}

internal val queuePatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(queueInsertionSupportPatch)

    execute {
        val hasEntitlement = mutableClassDefBy("Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;").methods.single {
            it.name == "IIIlIIIIIIIlIl" && it.parameterTypes == listOf("LIIllIlIllllllIlI;") && it.returnType == "Z"
        }
        check(
            checkNotNull(hasEntitlement.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;->IIllIIlIIIlIIlll:I"
            },
        )
        hasEntitlement.addInstructionsWithLabels(
            0,
            """
                sget-object v0, LIIllIlIllllllIlI;->IllIlIlIlllIIlI:LIIllIlIllllllIlI;
                if-ne p1, v0, :original
                const/4 v0, 0x1
                return v0
                :original
                nop
            """.trimIndent(),
        )

        mutableClassDefBy("LlIlIlIIIllIlllI;").methods.single {
            it.name == "IIllIIlIIIlIIlll" && it.parameterTypes.size == 6
        }.showAddTrackToQueue()
        mutableClassDefBy("LIIllIllIIlIIll;").methods.single {
            it.name == "lIIlIIlIlllllII" &&
                it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }.showAddCollectionToQueue()
        mutableClassDefBy("LIIllIIIlIIIIllll;").methods.single { it.name == "<clinit>" }
            .showPlayerQueueAction("IlIIllIIIIIIIlIl")
    }
}
