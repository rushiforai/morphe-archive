package semicoloncolonel.mobilestream.patches.foxlocal.privacy

import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// FOX LOCAL for Android TV 2.18.1 keeps its privacy choice in Ketch. Until
// you choose, the app sends the US Privacy string PRIVACY_PREFERENCE_DEFAULT,
// "1---" (no choice made), to its ad and measurement partners. That default
// becomes "1YYN", opted out of sale and sharing. A choice you make later, or
// one Ketch has stored for you, is still used instead.
//
// The constant is set in the app's JavaScript (Hermes bytecode), in the
// unnamed module function that also defines LOGOUT_TIMEOUT_MS and
// SPLASH_SCREEN_DURATION_MS. In 2.18.1 it is loaded into register 3.

private const val NO_CHOICE = "1---"
private const val OPTED_OUT = "1YYN"

// LoadConstString (0x90) <register> <string id, 16-bit little-endian>.
private fun loadConstString(register: Int, id: Int) =
    byteArrayOf(0x90.toByte(), register.toByte(), (id and 0xFF).toByte(), (id ushr 8).toByte())

@Suppress("unused")
val optOutOfDataSalePatch = rawResourcePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the app opted out of the sale and sharing of your data.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.replaceInstructions(
            name = "",
            using = listOf("PRIVACY_PREFERENCE_DEFAULT", NO_CHOICE),
            forVersion = 98,
            find = loadConstString(3, bundle.stringId(NO_CHOICE)),
            replace = loadConstString(3, bundle.stringId(OPTED_OUT)),
        )
        file.writeBytes(bundle.toByteArray())
    }
}
