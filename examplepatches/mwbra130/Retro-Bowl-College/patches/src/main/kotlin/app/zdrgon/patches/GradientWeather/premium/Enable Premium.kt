package morningentree.morphe.patches.gradientweather.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import morningentree.morphe.patches.gradientweather.shared.Constants
import app.zdrgon.util.getReference
import java.util.logging.Logger

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Gradient Weather Premium. Use With Spoof Install Source",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // The state holder's constructor seeds the initial tier from the persisted
        // is_lifetime / is_premium prefs. Force the is_lifetime read to true, and
        // remember which enum field the constructor picks in that branch: it is the
        // LIFETIME tier value, whatever the obfuscated field is named in this build.
        val lifetimeReference = InitSubscriptionTierFingerprint.method.run {
            val insns = instructions.toList()
            val stringIndex = insns.indexOfFirst {
                it.getReference<StringReference>()?.string == "is_lifetime"
            }
            if (stringIndex < 0) {
                throw PatchException("Could not find the is_lifetime pref read in the constructor.")
            }
            val moveResultIndex = ((stringIndex + 1) until insns.size).firstOrNull {
                insns[it].opcode == Opcode.MOVE_RESULT
            } ?: throw PatchException("Could not find the is_lifetime getBoolean result.")
            val ref = insns.subList(moveResultIndex + 1, insns.size)
                .firstNotNullOfOrNull { it.getReference<FieldReference>() }
                ?: throw PatchException("Could not find the tier constant picked for is_lifetime.")
            val register = (insns[moveResultIndex] as OneRegisterInstruction).registerA
            addInstruction(moveResultIndex + 1, "const/4 v$register, 0x1")
            ref
        }

        // The billing entitlement sync recomputes the tier from Play purchases and
        // stores it over the constructor's seed, then persists the prefs from that
        // same value. Pin the stored value to the LIFETIME tier so every sync keeps
        // premium and writes is_lifetime=true back to prefs.
        runCatching {
            UpdateEntitlementFingerprint.method.apply {
                val insns = instructions.toList()
                val storeIndex = insns.indices.firstOrNull { idx ->
                    val ref = insns[idx].getReference<MethodReference>()
                    ref != null && ref.name == "m" && ref.returnType == "V" &&
                        ref.parameterTypes.size == 1 &&
                        ((idx + 1) until minOf(idx + 26, insns.size)).any {
                            insns[it].getReference<StringReference>()?.string == "is_premium"
                        }
                } ?: throw PatchException("Could not find the tier store in the entitlement sync.")
                val store = insns[storeIndex] as? Instruction35c
                    ?: throw PatchException("Tier store is not a 35c invoke.")
                val smaliReference =
                    "${lifetimeReference.definingClass}->${lifetimeReference.name}:${lifetimeReference.type}"
                addInstruction(storeIndex, "sget-object v${store.registerD}, $smaliReference")
            }
        }.onSuccess {
            logger.info("Gradient Weather: entitlement sync pinned to LIFETIME.")
        }.onFailure {
            logger.warning("Gradient Weather: entitlement sync edit skipped: ${it.message}")
        }
    }
}
