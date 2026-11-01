package semicoloncolonel.mobilestream.patches.nytimes.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants

// NYT phone 11.98.0. Every native ad slot (section fronts, the article feed,
// slideshows; banners and native ads alike) asks AdRepositoryImpl for its ad.
// Both public entry points funnel into one method, renamed j(position, page
// context, ad type) in this build. It writes a state for the slot into
// LocalAdCache and returns that cache entry as a Flow the slot observes.
//
// The app already has an EmptyAd state (gj$c, "EmptyAd(position=...)") that a
// slot shows as nothing. This patch writes EmptyAd for every slot and returns
// the cache flow, before any ad request or the alternate request path runs.
// The obfuscated names are read from j's own instructions, not hard-coded.
internal object AdRepositoryFetchFingerprint : Fingerprint(
    returnType = "Lkotlinx/coroutines/flow/Flow;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        classDef.type == "Lcom/nytimes/android/ads/core/data/repositories/AdRepositoryImpl;" &&
            method.parameterTypes.size == 3 &&
            method.parameterTypes.first().toString() == "Ljava/lang/String;"
    },
)

private fun MethodReference.smali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes ads from the New York Times phone app's sections, feeds and " +
        "slideshows: every ad slot is given the app's own empty-ad state, so no ad is " +
        "requested. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdRepositoryFetchFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val references = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }

            // The first new-instance is the EmptyAd state, built from the position.
            val emptyAd = (instructions.first { it.opcode == Opcode.NEW_INSTANCE } as ReferenceInstruction)
                .reference as TypeReference
            val cacheField = references.filterIsInstance<FieldReference>()
                .first { it.type.endsWith("/LocalAdCache;") }
            val cachePut = references.filterIsInstance<MethodReference>().first {
                it.definingClass == cacheField.type && it.returnType == "V" &&
                    it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == "Ljava/lang/String;"
            }
            val cacheFlow = references.filterIsInstance<MethodReference>().first {
                it.definingClass == definingClass && it.returnType == "Lkotlinx/coroutines/flow/Flow;" &&
                    it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/String;")
            }

            // .locals 10 in 11.98.0, so p0/p1 are v10/v11 and fit 4-bit invokes.
            addInstructions(
                0,
                """
                    new-instance v0, ${emptyAd.type}
                    invoke-direct {v0, p1}, ${emptyAd.type}-><init>(Ljava/lang/String;)V
                    iget-object v1, p0, ${cacheField.definingClass}->${cacheField.name}:${cacheField.type}
                    invoke-virtual {v1, p1, v0}, ${cachePut.smali()}
                    invoke-virtual {p0, p1}, ${cacheFlow.smali()}
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
            )
        }
    }
}
