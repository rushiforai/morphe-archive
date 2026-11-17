package semicoloncolonel.mobilestream.patches.kouponai.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.disableCodePushPatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Hide promo code countdown.
//
// Two places count down the new-user promo code window: the home screen card
// (NewUserPromoCode: "New users only 07 Days 00 Hrs") and the promo code page
// (Filter: "Remaining 07 Days 00 Hrs"). Each builds a row of children:
//
//   NewUserPromoCode   ["New users only", days, hours, minutes] in r21
//   Filter             ["Remaining", days, hours, minutes] in r9
//
// Each child is stored with PutOwnByIndex (0x44 <array> <value> <index>).
// Every store in those two rows becomes two LoadConstUndefined (0x76) of the
// value register, so the slots stay empty and React draws nothing there. The
// home card keeps its "Best Promo Codes" title and loses the "New users only"
// label with the countdown.
// Bytecode version 96 only.
//
// Koupon's over-the-air updates are turned off so that the patched bundle
// stays in use (DisableCodePushPatch).
// ─────────────────────────────────────────────────────────────────────────────

private const val PUT_OWN_BY_INDEX = 0x44
private const val LOAD_CONST_UNDEFINED = 0x76

private fun HermesBundle.dropChild(name: String, using: String, array: Int, value: Int, index: Int) {
    replaceInstructions(
        name,
        listOf(using),
        forVersion = 96,
        find = byteArrayOf(PUT_OWN_BY_INDEX.toByte(), array.toByte(), value.toByte(), index.toByte()),
        replace = byteArrayOf(
            LOAD_CONST_UNDEFINED.toByte(), value.toByte(),
            LOAD_CONST_UNDEFINED.toByte(), value.toByte(),
        ),
    )
}

private val hidePromoCountdownInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        for (index in 0..3) bundle.dropChild("NewUserPromoCode", "New users only", array = 21, value = 22, index = index)
        for (index in 0..3) bundle.dropChild("Filter", "Remaining", array = 9, value = 11, index = index)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hidePromoCountdownPatch = resourcePatch(
    name = "Hide promo code countdown",
    description = "Removes the \"New users only\" label and the days-and-hours countdown from the " +
        "promo codes on the home screen and the promo code page.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    dependsOn(hidePromoCountdownInBundlePatch, disableCodePushPatch)
}
