package app.pepper.patches.icons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Unlock tier-locked custom app icons
 *
 * In stock Pepper, 12 of the 18 app-icon variants are gated by membership tier
 * (Silver/Gold/Platinum). The picker associates each icon with a minimum tier
 * via the `vsc` enum (c=DEFAULT, d=LEVEL_1_SILVER, e=LEVEL_2_GOLD, f=LEVEL_3_PLATINUM).
 *
 * Patch: rewrites every `sget-object Lvsc;->{d|e|f}:Lvsc;` instruction in the
 * picker-builder method to `sget-object Lvsc;->c:Lvsc;` — every icon is now
 * DEFAULT-tier and accessible without farming loyalty points.
 *
 * The `vsc` enum class is obfuscated and its name will change across releases,
 * but its STRUCTURE is invariant: 6 static `Lvsc;` fields named a..f. We discover
 * its type at patch time by scanning the matched method for `sget-object` to
 * a self-typed field (where definingClass == fieldType).
 *
 * Replacement uses `removeInstructions(idx, 1) + addInstructions(idx, smali)`
 * rather than `replaceInstructions`: in patcher v21.0.0, replaceInstructions
 * silently failed to update field references on sget-object — the dex builder's
 * field-reference pool was not refreshed and the old reference persisted in
 * the output DEX. The remove+add path goes through the smali compiler, which
 * interns the new field reference correctly.
 */
@Suppress("unused")
val unlockTierIconsPatch = bytecodePatch(
    name = "Unlock tier-locked icons",
    description = "Unlocks all membership-tier app icons in the icon picker.",
) {
    compatibleWith(*PEPPER_FAMILY)

    execute {
        val method = TierIconsBuilderFingerprint.method
        val implementation = method.implementation!!

        // Discover vsc enum class type. The matched method is sa0's synthetic
        // multi-case dispatcher; its body holds self-typed fields from MANY
        // enums (vsc, whc, ywc, vic, …) all with {c,d,e,f} constants. So:
        //
        //  1. Collect every candidate class (self-typed fields with at least
        //     {c,d,e,f}).
        //  2. Patch d/e/f → c on EVERY one of them, but only on instructions
        //     that *actually* read the d/e/f variant. This is safe because we
        //     only rewrite sget-object that already pointed at the same class
        //     hierarchy (no cross-class confusion).
        val instructions = implementation.instructions.toList()
        val candidateClasses = instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? FieldReference }
            .filter { it.definingClass == it.type }
            .groupBy { it.definingClass }
            // EXACT-match {c,d,e,f}: in v8.12.00 the picker dispatcher also
            // references neighbouring enum classes that share the {c,d,e,f}
            // prefix but extend further (Lh25; with c..j, ManifestAliasId
            // with c..o, etc.). containsAll would match those too, rewriting
            // their d/e/f → c references — corrupting unrelated enum reads
            // (e.g. ManifestAliasId mappings, breaking the icon-to-launcher-
            // alias relation). vsc has exactly four self-typed constants
            // (c=DEFAULT, d=SILVER, e=GOLD, f=PLATINUM) — the equality check
            // pins us to that shape.
            .filterValues { fields ->
                fields.map { it.name }.toSet() == setOf("c", "d", "e", "f")
            }
            .keys

        if (candidateClasses.isEmpty()) {
            throw PatchException(
                "No self-typed enum with {c,d,e,f} found in tier-icons builder. " +
                "Enum structure may have changed."
            )
        }

        // Iterate the snapshot in REVERSE so live-list indices stay valid as we replace.
        // Match against ALL candidate enum classes (one of them is the real vsc).
        var patched = 0
        for (idx in instructions.indices.reversed()) {
            val insn = instructions[idx]
            if (insn.opcode != Opcode.SGET_OBJECT) continue
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (ref.definingClass !in candidateClasses) continue
            if (ref.name !in setOf("d", "e", "f")) continue
            // Only rewrite self-typed reads (enum constant): definingClass == type
            if (ref.definingClass != ref.type) continue

            val destReg = (insn as OneRegisterInstruction).registerA
            method.removeInstructions(idx, 1)
            method.addInstructions(
                idx,
                "sget-object v$destReg, ${ref.definingClass}->c:${ref.type}"
            )
            patched++
        }
        if (patched == 0) {
            throw PatchException(
                "No tier-enum sget-object instructions found to patch."
            )
        }
    }
}
