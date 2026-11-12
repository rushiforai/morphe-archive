package app.template.patches.bdvpn

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_BDVPN
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Finds the first sget-object instruction loading the given enum field
 * (e.g. Lt7/m;->Z) and returns its index. The register is read from the
 * instruction itself so the replacement keeps the original register.
 */
private fun findSgetObject(
    fingerprint: app.morphe.patcher.Fingerprint,
    definingClass: String,
    fieldName: String,
    errorLabel: String,
): Pair<Int, Int> {
    val instructions = fingerprint.method.implementation?.instructions
        ?: error("$errorLabel: no implementation")
    val index = instructions.indexOfFirst { instr ->
        instr.opcode == Opcode.SGET_OBJECT &&
            instr is ReferenceInstruction &&
            (instr.reference as? FieldReference)?.let {
                it.definingClass == definingClass && it.name == fieldName
            } == true
    }
    require(index >= 0) { "$errorLabel: sget-object $definingClass->$fieldName not found" }
    val register = (instructions[index] as OneRegisterInstruction).registerA
    return index to register
}

@Suppress("unused")
val bdvpnPremiumPatch = patch(
    name = "Unlock VIP",
    description = "Unlocks Bangladesh VPN VIP by forcing the local subscription tier to FULL in every place that reads it: the tier predicates (H/I), the Play Billing purchase callback, the tier deriver, and the persisted tier default. VIP servers connect and the premium section activates. No server change needed. Verified on 67.26.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BDVPN)

    execute {
        // All edits are replaceInstruction (same-size, 1-code-unit for
        // 1-code-unit swaps), so nothing shifts and no branch target is
        // involved. This follows the lesson from the SAI patch: never use
        // addInstructions before a branch target -- the patcher reports
        // success but the inserted code is silently skipped.

        // 1) Lcl/g.H: force the BASIC-tier predicate (X >= 5) to true.
        // Replace the `const/4 p0, 0x0` at :cond_b with 0x1. H is the
        // gate in MainFragment/ServersFragment/VPNService for VIP servers.
        // NOTE: p0 is a parameter register; in a static method with
        // .registers 2 it is raw register v1, not v0. So do NOT pin the
        // register -- find the single CONST_4 with literal 0 (the other
        // consts are 0x5 and 0x1) and reuse whatever register it uses.
        BdvpnTierCheckHFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("cl/g.H: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 0
            }
            require(constIndex >= 0) { "cl/g.H: const/4 p0, 0x0 not found" }
            val register = (instructions[constIndex] as OneRegisterInstruction).registerA
            it.method.replaceInstruction(constIndex, "const/4 v$register, 0x1")
        }

        // 2) Lcl/g.I: force the FULL-tier predicate (X >= 100) to true.
        // Replace the `const/4 p0, 0x0` at :cond_c with 0x1. I gates the
        // full-feature paths in Settings, MainActivity and QuickConnect.
        // Same register note as H: p0 is raw v1 here, so find the single
        // CONST_4 with literal 0 and reuse its register.
        BdvpnTierCheckIFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("cl/g.I: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 0
            }
            require(constIndex >= 0) { "cl/g.I: const/4 p0, 0x0 not found" }
            val register = (instructions[constIndex] as OneRegisterInstruction).registerA
            it.method.replaceInstruction(constIndex, "const/4 v$register, 0x1")
        }

        // 3) Ll8/q.onQueryPurchasesResponse: force the ads flag true.
        // Replace the init `const/4 v1, 0x0` with 0x1 so MainFragment.v0
        // is always true and interstitials stay off.
        BdvpnQueryPurchasesFingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("l8/q.onQueryPurchasesResponse: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is OneRegisterInstruction && instr.registerA == 1 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 0
            }
            require(constIndex >= 0) {
                "l8/q.onQueryPurchasesResponse: const/4 v1, 0x0 not found"
            }
            it.method.replaceInstruction(constIndex, "const/4 v1, 0x1")
        }

        // 4) Tier deriver (androidx/lifecycle/u0.invokeSuspend): force
        // the empty-purchase-list tier to FULL. Replace the initial
        // `sget-object v3, Lt7/m;->Z` (NONE) with `Lt7/m;->f0` (FULL).
        // With MicroG RE the purchase query returns null, so the deriver
        // otherwise falls back to the persisted tier.
        BdvpnTierDeriverFingerprint.let {
            val (sgetIndex, register) = findSgetObject(
                it, "Lt7/m;", "Z", "u0.invokeSuspend"
            )
            it.method.replaceInstruction(
                sgetIndex, "sget-object v$register, Lt7/m;->f0:Lt7/m;"
            )
        }

        // 5) DataStore default (Lt7/u.<clinit>): force the default tier
        // to FULL. Replace the `sget-object v2, Lt7/m;->Z` (NONE) with
        // `Lt7/m;->f0` (FULL), so a fresh install (or after clearing app
        // data) starts at FULL instead of NONE.
        BdvpnCurrentSubsDefaultFingerprint.let {
            val (sgetIndex, register) = findSgetObject(
                it, "Lt7/m;", "Z", "t7/u.<clinit>"
            )
            it.method.replaceInstruction(
                sgetIndex, "sget-object v$register, Lt7/m;->f0:Lt7/m;"
            )
        }
    }
}
