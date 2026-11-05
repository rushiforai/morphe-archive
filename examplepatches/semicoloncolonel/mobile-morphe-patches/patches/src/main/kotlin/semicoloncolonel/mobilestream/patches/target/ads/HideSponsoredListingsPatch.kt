package semicoloncolonel.mobilestream.patches.target.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.target.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// Target 2026.43.0 asks its search service for sponsored products with the
// include_sponsored parameter. Each search parameter is a small object in
// com.target.search.params that turns itself into a (name, value) pair as
// the request is built. Just before the pair is made, the value goes through
// ShoppingAdsFilter, which answers false for include_sponsored, so search
// results come back without sponsored products.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

// The search parameter's () -> Pair(name, value) method.
internal object SearchParameterPairFingerprint : Fingerprint(
    returnType = "Lkotlin/Pair;",
    parameters = listOf(),
    custom = { method, classDef -> classDef.type.startsWith("Lcom/target/search/params/") },
)

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Asks Target's search for results without sponsored products.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        SearchParameterPairFingerprint.method.apply {
            // name in v0 and value in v1, just before new Pair(v0, v1).
            val pairIndex = implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == "Lkotlin/Pair;"
            }
            if (pairIndex < 0) throw PatchException("Target search parameter pair not found")
            val constructor = implementation!!.instructions.toList()[pairIndex + 1] as? FiveRegisterInstruction
            if (constructor?.registerD != 0 || constructor.registerE != 1) {
                throw PatchException("Target search parameter pair is not built from v0 and v1")
            }
            addInstructions(
                pairIndex,
                """
                    invoke-static { v0, v1 }, $ADS_FILTER->targetSearchParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v1
                """.trimIndent(),
            )
        }
    }
}
