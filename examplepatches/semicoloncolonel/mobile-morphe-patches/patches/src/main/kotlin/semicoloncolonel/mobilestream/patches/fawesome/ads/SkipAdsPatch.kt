package semicoloncolonel.mobilestream.patches.fawesome.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.fawesome.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Fawesome 20.8 (phone build) — Skip ads.
//
// Fawesome plays two kinds of ads, each switched by a setting in the app's
// server config that the config parser stores in a static flag of
// GlobalObject (R8-renamed):
//
//   adActivation   ("Show Ads") the IMA video ad breaks: the player asks it
//                  before every pre-roll (F0) and when it lays out the
//                  mid-roll breaks.
//   enableHouseAd  Fawesome's own promo videos, which the player plays
//                  before a title when this is on.
//
// Every read of either flag now reads false, so no ad break is scheduled and
// no promo video plays. The stores are left alone: GlobalObject's static
// initializer shares one register among many defaults. Each flag is found as
// the field the parser stores right after it reads the setting's name.
// ─────────────────────────────────────────────────────────────────────────────

private const val GLOBAL_OBJECT = "Lcom/recipe/filmrise/GlobalObject;"

internal object ConfigParserFingerprint : Fingerprint(
    strings = listOf("adActivation", "enableMidAd", "fuseAdRequest"),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the video ads and promo videos before and during movies and shows.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val parser = ConfigParserFingerprint.method.instructions.toList()
        listOf("adActivation", "enableHouseAd").forEach { setting ->
            val flag = parser.flagStoredAfter(setting)
                ?: throw PatchException("The $setting flag was not found")

            val readers = mutableListOf<String>()
            classDefForEach { classDef ->
                val reads = classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.isReadOf(flag) } == true
                }
                if (reads) readers += classDef.type
            }
            var reads = 0
            readers.forEach { type ->
                mutableClassDefBy(type).methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    instructions.indices.filter { instructions[it].isReadOf(flag) }.forEach { index ->
                        // sget-boolean vX, flag -> const/16 vX, 0x0: the same register, now false.
                        val register = (instructions[index] as OneRegisterInstruction).registerA
                        method.replaceInstruction(index, "const/16 v$register, 0x0")
                        reads++
                    }
                }
            }
            if (reads == 0) throw PatchException("No reads of the $setting flag found")
        }
    }
}

/** The first boolean the parser stores in GlobalObject after it loads the string [setting]. */
private fun List<Instruction>.flagStoredAfter(setting: String): FieldReference? {
    val key = indexOfFirst {
        it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == setting
    }
    if (key < 0) return null
    return drop(key + 1).firstOrNull {
        it.opcode == Opcode.SPUT_BOOLEAN &&
            ((it as ReferenceInstruction).reference as FieldReference).definingClass == GLOBAL_OBJECT
    }?.let { (it as ReferenceInstruction).reference as FieldReference }
}

private fun Instruction.isReadOf(flag: FieldReference): Boolean {
    if (opcode != Opcode.SGET_BOOLEAN) return false
    val field = (this as ReferenceInstruction).reference as FieldReference
    return field.definingClass == flag.definingClass && field.name == flag.name && field.type == flag.type
}
