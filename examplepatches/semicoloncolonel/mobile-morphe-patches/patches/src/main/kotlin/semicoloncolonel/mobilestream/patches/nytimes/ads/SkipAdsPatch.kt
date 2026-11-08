package semicoloncolonel.mobilestream.patches.nytimes.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants

// NYT phone 11.98.0 and 11.99.0. Every native ad slot (section fronts, the
// article feed, slideshows; banners and native ads alike) asks the ad
// repository (AdRepositoryImpl) for its ad. The app has its own EmptyAd state,
// which a slot shows as nothing.
//
// 11.98.0: the fetch method writes EmptyAd to the cache itself. The patch
// writes EmptyAd for every slot and returns the cache flow, before any ad
// request. The obfuscated names are read from the method's own instructions.
internal object AdRepositoryFetchLegacyFingerprint : Fingerprint(
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

// 11.99.0: the repository class is renamed, and the fetch method first reads
// the app's "Google Ad Manager enabled" flag. When it is off, the app writes
// EmptyAd and returns without requesting an ad. The patch sets the flag off
// right after it is read. The method is found by the consent preferences it
// sets before an ad request.
internal object AdRepositoryFetchFingerprint : Fingerprint(
    strings = listOf("gad_has_consent_for_cookies", "gad_rdp"),
    custom = { method, _ ->
        method.parameterTypes.size == 3 &&
            method.parameterTypes.first().toString() == "Ljava/lang/String;"
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads from the app's sections, feeds, and slideshows.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // 11.98.0
        AdRepositoryFetchLegacyFingerprint.methodOrNull?.apply {
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
        } ?: AdRepositoryFetchFingerprint.method.apply {
            // 11.99.0
            val instructions = implementation!!.instructions.toList()
            val flagRead = instructions.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN }
            if (flagRead < 0) throw PatchException("Ad Manager flag read not found")
            val register = (instructions[flagRead] as OneRegisterInstruction).registerA
            addInstruction(flagRead + 1, "const/16 v$register, 0x0")
        }
    }
}
