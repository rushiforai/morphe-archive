package app.template.patches.pepper.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Pepper inserts programmatic ads (AATKit and PubMatic banners) into the deal lists
 * and below the deal details. Both placements only load their ad slots while the flow
 * returned by this suspend function emits true. It is meant to check if the user is ad free,
 * but the check is stubbed out, so it always emits `Result.success(!false)`:
 *
 * ```
 * suspend fun areAdsEnabled(): Flow<Result<Boolean>> {
 *     val isAdFree = Result.success(false)
 *     return flowOf(Result.success(!isAdFree.getOrDefault(false)))
 * }
 * ```
 */
internal object AreAdsEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    // The coroutine continuation.
    parameters = listOf("L"),
    filters = listOf(
        // Value of isAdFree.
        fieldAccess(smali = "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"),
        // Default value of getOrDefault().
        fieldAccess(smali = "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"),
        // !isAdFree
        anyInstruction(
            opcode(Opcode.XOR_INT_2ADDR),
            opcode(Opcode.XOR_INT_LIT8),
        ),
        methodCall(
            smali = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;",
            location = MatchAfterImmediately()
        ),
    )
)

internal object AdSlotsToDataFingerprint : Fingerprint(
    definingClass = "Lcom/pepper/network/apirepresentation/AdInListApiRepresentationKt;",
    name = "toData",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/Iterable;", "Z"),
)

internal val hideAdLayoutResourcePatch = resourcePatch {
    execute {
        document("res/layout/item_ad.xml").use { document ->
            document.documentElement.apply {
                setAttribute("android:visibility", "gone")
                setAttribute("android:layout_height", "0dp")
            }
        }
    }
}
