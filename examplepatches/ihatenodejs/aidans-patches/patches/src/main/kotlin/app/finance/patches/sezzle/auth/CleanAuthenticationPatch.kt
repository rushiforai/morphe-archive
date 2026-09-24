package app.finance.patches.sezzle.auth

import app.finance.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.finance.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.rawResourcePatch

private const val PHONE_FORM_RESULT_OFFSET = 3587

private val EXPECTED_PHONE_FORM_RESULT_BYTES = byteArrayOf(0x6f, 0x33, 0x0c, 0x03, 0x0b, 0x0a)
private val REPLACEMENT_PHONE_FORM_RESULT_BYTES = byteArrayOf(0x94.toByte(), 0x33, 0xae.toByte(), 0x04, 0x00, 0x00)

@Suppress("unused")
val cleanAuthenticationPatch = rawResourcePatch(
    name = "Clean Authentication",
    description = "Shows Google sign-in only and removes the unavailable phone sign-in controls.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) return@execute

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val innerFormOffset = editor.findFunctionOffsetByName("InnerForm") { offset ->
            editor.matchesBytes(offset + PHONE_FORM_RESULT_OFFSET, EXPECTED_PHONE_FORM_RESULT_BYTES)
        } ?: error("Could not find the Sezzle login form")

        editor.replaceStringUsingDonor(
            target = "Enter your mobile number to log in or sign up.",
            replacement = "Continue with Google to log in to your Sezzle account.\n\nCAUTION: You are using a patched version of Sezzle",
            donor = "../src/features/login/components/loginView/components/loginForm/components/innerForm/components/authPhoneTextInput/authPhoneTextInput.stories"
        )

        // Replace the completed phone subtree with null before the social component is
        // built. The original layout instructions remain intact, including the object
        // construction required by its phone/social child branch.
        editor.patchBytesIfMatches(
            innerFormOffset + PHONE_FORM_RESULT_OFFSET,
            EXPECTED_PHONE_FORM_RESULT_BYTES,
            REPLACEMENT_PHONE_FORM_RESULT_BYTES
        )

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
