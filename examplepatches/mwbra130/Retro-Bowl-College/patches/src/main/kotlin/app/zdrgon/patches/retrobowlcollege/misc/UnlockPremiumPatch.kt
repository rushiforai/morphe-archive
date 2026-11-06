package app.zdrgon.patches.retrobowlcollege.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.retrobowlcollege.shared.Constants.COMPATIBILITY_RETRO_BOWL_COLLEGE
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Synthetic owned purchase for "college_full_version", injected into the
 * Play Billing query response JSON.
 *
 * Quotes are smali-escaped so the constant can be interpolated directly into
 * const-string instructions below.
 */
private const val FAKE_PURCHASE_JSON =
    "{\\\"orderId\\\":\\\"morphe-fake-order\\\",\\\"packageName\\\":\\\"com.newstargames.retrobowlcollege\\\"," +
        "\\\"productId\\\":\\\"college_full_version\\\",\\\"purchaseTime\\\":1720000000000,\\\"purchaseState\\\":0," +
        "\\\"purchaseToken\\\":\\\"morphe_fake_token\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":true}"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks the full version. No real purchase is made.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RETRO_BOWL_COLLEGE)

    execute {
        val method = QueryPurchasesResponseFingerprint.method

        // The callback serializes its response with JSONObject.toString(); the
        // resulting string lands in v6 via the move-result-object that follows.
        val toStringIndex = method.instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)
                ?.reference.toString() == "Lorg/json/JSONObject;->toString()Ljava/lang/String;"
        }
        if (toStringIndex == -1) {
            throw PatchException("JSONObject.toString() call not found in onQueryPurchasesResponse")
        }

        // Insert right after move-result-object (toStringIndex + 2). v6 holds the
        // JSON string and must be preserved; v0 and v7 are dead at this point
        // (both are reassigned before their next use), so they are safe scratch.
        // Two literal replaces handle the non-empty and empty purchases array:
        // the empty case is patched second so its pattern cannot match the
        // already-patched non-empty result.
        method.addInstructions(
            toStringIndex + 2,
            """
                const-string v7, "\"purchases\":[{"
                const-string v0, "\"purchases\":[${FAKE_PURCHASE_JSON},{"
                invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object v6
                const-string v7, "\"purchases\":[]"
                const-string v0, "\"purchases\":[${FAKE_PURCHASE_JSON}]"
                invoke-virtual {v6, v7, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object v6
            """,
        )
    }
}
