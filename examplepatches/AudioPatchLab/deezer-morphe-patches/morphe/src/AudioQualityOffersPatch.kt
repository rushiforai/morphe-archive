package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val QUALITY_OFFER = "LIlIlIIlIllIllllI;"

internal val audioQualityOffersPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val picker = mutableClassDefBy("LllIlllllIllIllI;").methods.single {
            it.name == "IllIIIlllIIlIlll" && it.returnType == "LIIIlIlIIllIIlIl;"
        }
        val instructions = checkNotNull(picker.implementation).instructions

        // The picker builds permitted qualities first, then appends two campaign rows.
        for (offer in listOf("IIIlIIIllIlII", "IllIlIlIlllIIlI")) {
            val load = instructions.indices.single { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.SGET_OBJECT && (instruction as ReferenceInstruction).reference.toString() ==
                    "$QUALITY_OFFER->$offer:$QUALITY_OFFER"
            }
            val lookup = instructions[load + 1]
            val result = instructions[load + 2] as OneRegisterInstruction
            check(lookup.opcode == Opcode.INVOKE_INTERFACE &&
                (lookup as ReferenceInstruction).reference.toString() == "Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;")
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT)
            picker.replaceInstruction(load + 1, "nop")
            picker.replaceInstruction(load + 2, "const/4 v${result.registerA}, 0x0")
        }
    }
}
