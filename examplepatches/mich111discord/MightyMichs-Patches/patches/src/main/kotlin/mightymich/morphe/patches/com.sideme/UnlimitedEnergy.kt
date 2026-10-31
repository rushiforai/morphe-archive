package mightymich.morphe.patches.com.sideme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Bonus: treats energy checks as always available.
 *
 * SideMe uses an "energy" resource for lessons. Premium users typically
 * bypass energy limits; this patch forces related boolean gates that
 * gate level start / continue so free users can play without waiting.
 *
 * Fingerprint looks for methods that compare energy-related StateFlow
 * values and return boolean (can-play style).
 */
@Suppress("unused")
val unlimitedEnergyPatch = bytecodePatch(
    name = "Unlimited Energy",
    description = "Bypasses energy limits so lessons can be started freely (bonus QoL).",
    default = true
) {
    compatibleWith(SideMeCompatibility.SIDEME)

    // Enum / reward type that includes "energy" and "keys" string constants
    val energyEnumFingerprint = Fingerprint(
        strings = listOf("energy", "keys")
    )

    // Methods that return int energy counts – force a high value when short getter
    val energyCountFingerprint = Fingerprint(
        returnType = "I",
        parameters = emptyList(),
        classFingerprint = energyEnumFingerprint,
        custom = { method, _ ->
            // Keep narrow: only very short getters unlikely to be unrelated
            val insns = method.implementation?.instructions ?: return@Fingerprint false
            insns.count() <= 6 &&
                insns.any { it.toString().contains("iget") || it.toString().contains("getValue") }
        }
    )

    // Boolean "can play / has energy" style: methods mentioning energy string and returning Z
    val canPlayFingerprint = Fingerprint(
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, _ ->
            val text = method.implementation?.instructions
                ?.joinToString("\n") { it.toString() }
                ?: return@Fingerprint false
            // Avoid premium gates (already patched) – look for energy/key comparisons
            !text.contains("Lld5;->b()") &&
                (text.contains("energy") || text.contains("Lcx3")) &&
                text.contains("getValue")
        }
    )

    execute {
        // Force energy count getters → 99
        try {
            energyCountFingerprint.matchAllOrNull()?.forEach { match ->
                match.method.addInstructions(
                    0,
                    """
                        const/16 v0, 0x63
                        return v0
                    """
                )
            }
        } catch (_: Exception) {
            try {
                energyCountFingerprint.method.addInstructions(
                    0,
                    """
                        const/16 v0, 0x63
                        return v0
                    """
                )
            } catch (_: Exception) {
                // optional
            }
        }

        // Force can-play style gates → true
        try {
            canPlayFingerprint.matchAllOrNull()?.forEach { match ->
                match.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            }
        } catch (_: Exception) {
            try {
                canPlayFingerprint.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            } catch (_: Exception) {
                // optional – premium unlock is the main fix
            }
        }
    }
}
