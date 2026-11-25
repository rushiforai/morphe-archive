package app.sigstick.patches.settings

import app.morphe.patcher.patch.bytecodePatch
import app.sigstick.patches.shared.Constants.COMPATIBILITY_SIGSTICK
import app.sigstick.patches.shared.indexOfCall
import app.sigstick.patches.shared.nopCall

@Suppress("unused")
val removeSettingsLinksPatch = bytecodePatch(
    name = "Remove Settings Links",
    description = "Removes Follow Us, Email Us, Terms of Service and Privacy Policy from " +
        "Settings. Community and Version stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SIGSTICK)

    execute {
        // Each removed call is a whole composable group or a plain List.add, so Compose
        // stays balanced and the list just gets shorter.
        AboutItemsFingerprint.method.apply {
            nopCall("add", indexOfCall("getAccountBalance"))
            nopCall("add", indexOfCall("getPrivacyTip"))
        }

        ConnectItemsFingerprint.method.apply {
            // Follow Us row and the divider under it.
            val followUs = nopCall("SectionListItem-hGBTI10", indexOfCall("getFavorite"))
            nopCall("SectionDivider", followUs)
            // The divider above Email Us, then the button itself.
            val emailUs = nopCall("EmailUsBtn")
            nopCall("SectionDivider", indexOfCall("getDiversity1")).also {
                check(it < emailUs) { "Unexpected Connect section layout" }
            }
        }
    }
}
