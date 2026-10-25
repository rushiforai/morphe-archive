package mightymich.morphe.patches.mobi.charmer.magovideo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Unlocks MagoVideo Premium / VIP (aligned with common MT Manager mod flow).
 *
 * Tutorial approach (YT): search string "onetime_purchase" → related VIP method →
 * force boolean const 0 → 1.
 *
 * In 5.7.1 the billing helper is Lm2/l; (older builds used Lf2/l; / method h0):
 *   - a()Z  public VIP  (La8/c.a → La8/b.i used by UI)
 *   - m()Z  public flag (La8/c.m → La8/b.h)
 *   - L()Z  private check from encrypted local license (string "json=")
 *   - N(sku, expiry)Z  accepts product ids including "onetime_purchase"
 *
 * Also patches UI facade La8/b i()/h().
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks MagoVideo premium / VIP (no watermark, pro features).",
    default = true
) {
    compatibleWith(MagoVideoCompatibility.MAGO_VIDEO)

    // --- Core helper (class that owns onetime_purchase / isVip logs) ---

    val vipAFingerprint = Fingerprint(
        definingClass = "Lm2/l;",
        name = "a",
        returnType = "Z",
        parameters = emptyList()
    )

    val vipMFingerprint = Fingerprint(
        definingClass = "Lm2/l;",
        name = "m",
        returnType = "Z",
        parameters = emptyList()
    )

    // Private license check (contains log "json=" + reads encrypted VIP)
    val vipFromStorageFingerprint = Fingerprint(
        definingClass = "Lm2/l;",
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, _ ->
            val text = method.implementation?.instructions
                ?.joinToString("\n") { it.toString() }
                ?: return@Fingerprint false
            text.contains("json=") && text.contains("TextUtils")
        }
    )

    // Product SKU validator that includes onetime_purchase
    val skuValidatorFingerprint = Fingerprint(
        definingClass = "Lm2/l;",
        returnType = "Z",
        parameters = listOf("Ljava/lang/String;", "J"),
        custom = { method, _ ->
            val text = method.implementation?.instructions
                ?.joinToString("\n") { it.toString() }
                ?: return@Fingerprint false
            text.contains("onetime_purchase")
        }
    )

    // --- UI facade used by material shop / export ---

    val facadeIFingerprint = Fingerprint(
        definingClass = "La8/b;",
        name = "i",
        returnType = "Z",
        parameters = emptyList()
    )

    val facadeHFingerprint = Fingerprint(
        definingClass = "La8/b;",
        name = "h",
        returnType = "Z",
        parameters = emptyList()
    )

    // Fallback: any short public ()Z in a class that references onetime_purchase
    val fallbackVipByStringFingerprint = Fingerprint(
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, classDef ->
            val classHasSku = classDef.methods.any { m ->
                m.implementation?.instructions?.any {
                    it.toString().contains("onetime_purchase")
                } == true
            }
            if (!classHasSku) return@Fingerprint false
            // Prefer public short VIP getters (a / m) or any short ()Z
            method.name == "a" || method.name == "m" || (
                (method.implementation?.instructions?.count() ?: 99) <= 8 &&
                    method.accessFlags and 0x1 != 0 // public
                )
        }
    )

    execute {
        val retTrue = """
            const/4 v0, 0x1
            return v0
        """

        var ok = 0

        fun tryPatch(block: () -> Unit) {
            try {
                block()
                ok++
            } catch (_: Exception) {
                // continue
            }
        }

        // Primary (5.7.1 exact)
        tryPatch { vipAFingerprint.method.addInstructions(0, retTrue) }
        tryPatch { vipMFingerprint.method.addInstructions(0, retTrue) }
        tryPatch { vipFromStorageFingerprint.method.addInstructions(0, retTrue) }
        tryPatch { skuValidatorFingerprint.method.addInstructions(0, retTrue) }
        tryPatch { facadeIFingerprint.method.addInstructions(0, retTrue) }
        tryPatch { facadeHFingerprint.method.addInstructions(0, retTrue) }

        // If definingClass names drifted, string-based fallback (single match only)
        if (ok < 2) {
            try {
                fallbackVipByStringFingerprint.method.addInstructions(0, retTrue)
                ok++
            } catch (_: Exception) {
            }
        }

        if (ok == 0) {
            throw PatchException(
                "MagoVideo VIP: no fingerprint matched. " +
                    "Expected Lm2/l; a()/m() or class with onetime_purchase."
            )
        }
    }
}