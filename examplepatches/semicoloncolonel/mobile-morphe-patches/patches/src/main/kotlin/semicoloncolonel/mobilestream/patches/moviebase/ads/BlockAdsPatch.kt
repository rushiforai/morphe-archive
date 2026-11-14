package semicoloncolonel.mobilestream.patches.moviebase.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants

// Moviebase 7.7.0 shows Google Mobile Ads (native, banner, interstitial, and
// app-open ads) with Meta Audience Network as a mediation partner. Every ad
// asks one eligibility check first: no Premium, the free period after
// install is over, and the ad consent allows requests. That check now always
// says no, so no ad is requested and no ad space is shown. Premium itself is
// not changed.
//
// The ad SDKs are also never started: the initializer, which starts Google
// Mobile Ads and Audience Network, returns at once.

private const val AUDIENCE_NETWORK_INIT =
    "Lcom/facebook/ads/AudienceNetworkAds;->initialize(Landroid/content/Context;)V"

// The ad eligibility check: canRequestAds() = isEligible() && consent.canRequestAds.
internal object AdEligibilityFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        method.implementation?.instructions?.map { it.opcode } == ELIGIBILITY_OPCODES &&
            eligibilityCalls(method, classDef)
    },
)

private val ELIGIBILITY_OPCODES = listOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.MOVE_RESULT,
    Opcode.IF_EQZ,
    Opcode.INVOKE_VIRTUAL,
    Opcode.MOVE_RESULT_OBJECT,
    Opcode.IGET_BOOLEAN,
    Opcode.IF_EQZ,
    Opcode.CONST_4,
    Opcode.RETURN,
    Opcode.CONST_4,
    Opcode.RETURN,
)

private fun eligibilityCalls(
    method: com.android.tools.smali.dexlib2.iface.Method,
    classDef: com.android.tools.smali.dexlib2.iface.ClassDef,
): Boolean {
    val calls = method.implementation!!.instructions
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .map { (it as ReferenceInstruction).reference as MethodReference }
    // Both calls are to this class: isEligible()Z and the consent getter.
    return calls.size == 2 && calls.all { it.definingClass == classDef.type } &&
        calls[0].returnType == "Z" &&
        // isEligible compares the Premium state with Boolean.FALSE.
        classDef.methods.any { other ->
            other.name == calls[0].name && other.implementation?.instructions?.any {
                it.opcode == Opcode.SGET_OBJECT &&
                    (it as ReferenceInstruction).reference.toString() == "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
            } == true
        }
}

internal object AdsInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.INVOKE_STATIC &&
                (it as ReferenceInstruction).reference.toString() == AUDIENCE_NETWORK_INIT
        } == true
    },
)

// kotlin.Unit, which the initializer returns when it is done.
internal object KotlinUnitToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("kotlin.Unit"),
)

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the banner, native, full-screen, and app-open ads.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdEligibilityFingerprint.apply {
            method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            // isEligible, which the interstitial and app-open schedulers call directly.
            val isEligible = (method.implementation!!.instructions.first { it.opcode == Opcode.INVOKE_VIRTUAL }
                as ReferenceInstruction).reference as MethodReference
            classDef.methods.first { it.name == isEligible.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
                .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        val unit = KotlinUnitToStringFingerprint.classDef
        val instance = unit.fields.firstOrNull {
            it.type == unit.type && com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("kotlin.Unit instance not found")
        AdsInitializerFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, ${unit.type}->${instance.name}:${unit.type}
                return-object v0
            """,
        )
    }
}
