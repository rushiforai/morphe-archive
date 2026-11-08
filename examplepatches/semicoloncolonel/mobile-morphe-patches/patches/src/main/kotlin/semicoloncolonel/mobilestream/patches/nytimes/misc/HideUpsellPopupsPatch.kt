package semicoloncolonel.mobilestream.patches.nytimes.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants

private const val MOBILE_UNIT = "Lcom/nytimes/onsitemessaging/core/MobileUnit;"
private val UPSELL_UNITS = listOf("MOBILE_NEWS_FSTO", "MOBILE_NEWS_TOP_APP")

// NYT phone 11.98.0 and 11.99.0. The app's on-site messaging (OMA) asks the server for a
// list of marketing units. The formal message provider (renamed in 11.99.0)
// builds that list: the units already migrated (home and article), plus the
// full-screen takeover (MOBILE_NEWS_FSTO) and the top-of-app banner
// (MOBILE_NEWS_TOP_APP), each added behind its own flag. This patch sets each
// flag to off just before it is checked.
//
// The paywall, regiwall and truncator are a separate system (FrictionKind)
// and are not touched. Article and home units are also left as they are,
// because the article unit can carry the paywall gate.
private fun unitIndex(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>, unit: String) =
    instructions.indexOfFirst {
        it.opcode == Opcode.SGET_OBJECT &&
            ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                field.definingClass == MOBILE_UNIT && field.name == unit
            }
    }

// 11.98.0: OMAFormalMessageProvider's companion builds the list from the two
// flags it is passed.
internal object OmaUnitListLegacyFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/onsitemessaging/core/OMAFormalMessageProvider\$a;",
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/nytimes/onsitemessaging/core/MigrationPhase;", "Z", "Z"),
)

// 11.99.0: the list is built inline in the renamed provider.
internal object OmaUnitListFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/nytimes/onsitemessaging/core/") && classDef.type != MOBILE_UNIT &&
            method.implementation?.instructions?.toList()?.let { instructions ->
                UPSELL_UNITS.all { unit ->
                    val index = unitIndex(instructions, unit)
                    index > 0 && instructions[index - 1].opcode == Opcode.IF_EQZ
                }
            } == true
    },
)

@Suppress("unused")
val hideUpsellPopupsPatch = bytecodePatch(
    name = "Hide upsell pop-ups",
    description = "Stops the full-screen subscription takeover and the promo banner at the top.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // 11.98.0: .locals 0, so p2/p3 are v2/v3.
        OmaUnitListLegacyFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p2, 0x0
                const/4 p3, 0x0
            """.trimIndent(),
        ) ?: OmaUnitListFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // Insert from the last check back, so earlier indexes stay valid.
            UPSELL_UNITS.map { unit -> unitIndex(instructions, unit) - 1 }
                .sortedDescending()
                .forEach { check ->
                    if (check < 0) throw PatchException("Upsell unit check not found")
                    val register = (instructions[check] as OneRegisterInstruction).registerA
                    addInstruction(check, "const/16 v$register, 0x0")
                }
        }
    }
}
