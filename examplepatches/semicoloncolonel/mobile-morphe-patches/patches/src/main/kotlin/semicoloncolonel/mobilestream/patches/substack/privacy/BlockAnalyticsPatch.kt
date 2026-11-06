package semicoloncolonel.mobilestream.patches.substack.privacy

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.substack.shared.Constants

// Substack 3.12.0. The third-party trackers (Sentry at
// o350427.ingest.sentry.io, the Facebook SDK's Graph calls, and AppsFlyer)
// all send over HttpURLConnection, which the shared layer checks against the
// host blocklist; plus the SDKs' manifest kill switches. Substack's own
// product analytics go to substack.com, the content API, so they are left
// alone — blocking them would break the app.
//
// On top of that, this neutralizes the Facebook SDK's Privacy Sandbox
// "Fledge" module, which joins on-device ad-retargeting "custom audiences"
// with Facebook as the buyer. Every joinCustomAudience() call is removed, so
// the app never enrolls the device in an ad audience.
//
// Not touched: posts, the Notes feed, sign-in, push, or billing.

private const val JOIN_CUSTOM_AUDIENCE = "joinCustomAudience"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Sentry, the Facebook SDK, AppsFlyer, and on-device ad retargeting.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()

        // Remove every call into the framework's CustomAudienceManager
        // .joinCustomAudience(request, executor, receiver). It returns void
        // and delivers its result through the receiver, so dropping the
        // invoke leaves no move-result dangling. Collect the classes first,
        // then mutate (mutableClassDefBy swaps the class-map entry).
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            val hit = classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.isJoinCustomAudience() } == true
            }
            if (hit) targets += classDef.type
        }
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                // Walk backwards so indices stay valid as instructions are removed.
                instructions.indices.reversed().forEach { index ->
                    if (instructions[index].isJoinCustomAudience()) {
                        method.removeInstruction(index)
                    }
                }
            }
        }
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isJoinCustomAudience(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == "Landroid/adservices/customaudience/CustomAudienceManager;" &&
        reference.name == JOIN_CUSTOM_AUDIENCE
}
