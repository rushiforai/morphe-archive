/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.idn.shared.Constants.SHOW_PACKAGE_BANNER
import app.fakh.patches.idn.shared.references
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SKELETON_LAYOUT = "Lcom/faltenreich/skeletonlayout/SkeletonLayout;"

/** MySubscriptionStatusManager's bind: fills the subscription banner on the profile with one of its variants (the only one-argument method that sets card colors). */
private object SubscriptionBannerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(methodCall(name = "setCardBackgroundColor", parameters = listOf("I"), returnType = "V")),
    custom = { method, _ ->
        method.parameterTypes.size == 1 &&
            method.references().count { it.endsWith("->setCardBackgroundColor(I)V") } >= 2
    },
)

/** MySubscriptionStatusManager's loading switch: shows or hides the banner's frame and the loading skeleton while the status loads. */
private object SubscriptionFrameFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(checkCast(SKELETON_LAYOUT)),
)

@Suppress("unused")
val hidePackageBannerPatch = patch(
    name = "Hide package banner",
    description = "Removes the \"Beli Paket\" banner from the profile, since packages cannot be bought in a patched app. The switch is in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        register(SHOW_PACKAGE_BANNER)

        val bind = SubscriptionBannerFingerprint.method
        val bindCall = "${bind.definingClass}->${bind.name}(${bind.parameterTypes.joinToString("")})${bind.returnType}"
        val bannerType = bind.parameterTypes.single().toString()

        // The status code turns each subscription status into a banner: it calls the bind once per status that has a
        // default banner. The server can send its own banner, so the banner object says nothing; the status does. A package
        // is available, or none is active: both read their banner off the status right before the branch that falls back
        // to the default banner, so the mark goes there, not before the bind call a branch can jump over.
        val statusCaller = Fingerprint(
            filters = listOf(
                methodCall(
                    definingClass = bind.definingClass,
                    name = bind.name,
                    parameters = bind.parameterTypes.map { it.toString() },
                    returnType = bind.returnType,
                )
            )
        ).matchAllOrNull().orEmpty().lastOrNull { match -> match.originalMethod.references().count { it == bindCall } >= 2 }
            ?: throw PatchException("IDN: the profile banner status code was not found.")
        statusCaller.method.apply {
            val marks = sortedSetOf<Int>()
            instructions.forEachIndexed { index, instruction ->
                if ((instruction as? ReferenceInstruction)?.reference?.toString() != bindCall) return@forEachIndexed
                val read = (index - 1 downTo 0).firstOrNull {
                    val field = (instructions[it] as? ReferenceInstruction)?.reference as? FieldReference
                    instructions[it].opcode == Opcode.IGET_OBJECT && field != null &&
                        field.type == bannerType && field.definingClass != bind.definingClass
                }
                if (read != null) marks += read
            }
            if (marks.size != 2) throw PatchException("IDN: the buy banner statuses were not found in the profile banner code.")
            // From the last, so the earlier indexes stay valid.
            marks.reversed().forEach { addInstruction(it, "invoke-static { }, $EXTENSION_SETTINGS->buyBanner()V") }
        }

        // The loading switch runs before the bind and shows the frame; the extension remembers it and hides it for a buy banner.
        bind.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->takeBuyBanner()Z
                    move-result v0
                    if-eqz v0, :show
                    invoke-static { }, $EXTENSION_SETTINGS->hideBanner()V
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }

        // The last call of the loading switch shows the banner's frame; the extension keeps it hidden if it was.
        SubscriptionFrameFingerprint.method.apply {
            val show = instructions.indexOfLast {
                (it as? ReferenceInstruction)?.reference?.let { reference -> reference is MethodReference && reference.name == "setVisibility" } == true
            }
            if (show < 0) throw PatchException("IDN: the banner frame visibility call was not found.")
            val frame = (instructions[show] as FiveRegisterInstruction).registerC
            addInstruction(show + 1, "invoke-static { v$frame }, $EXTENSION_SETTINGS->keepBannerHidden(Landroid/view/View;)V")
        }
    }
}
