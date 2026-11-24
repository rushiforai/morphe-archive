package app.aidan.patches.sezzle.auth

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
private const val PHONE_FORM_RESULT_OFFSET = 0xF05

private val EXPECTED_PHONE_FORM_RESULT_BYTES = byteArrayOf(0x6f, 0x31, 0x0b, 0x02, 0x0a, 0x09)
private val REPLACEMENT_PHONE_FORM_RESULT_BYTES =
    byteArrayOf(0x94.toByte(), 0x31, 0xae.toByte(), 0x04, 0x00, 0x00)

@Suppress("unused")
val cleanAuthenticationPatch = rawResourcePatch(
    name = "Clean Authentication",
    description = "Removes the unavailable phone sign-in controls while keeping Google and Apple sign-in.",
    default = true
) {
    category("Security")
    compatibleWith(COMPATIBILITY_SEZZLE)
    val injectPatchWarning = booleanOption(
        key = "injectPatchWarning",
        default = true,
        title = "Inject patch warning",
        description = "Adds a patched-app caution warning below the Google sign-in message on the login screen."
    )

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) return@execute

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val innerFormOffset = editor.findFunctionOffsetByName("InnerForm") { offset ->
            editor.matchesBytes(offset + PHONE_FORM_RESULT_OFFSET, EXPECTED_PHONE_FORM_RESULT_BYTES) ||
                editor.matchesBytes(offset + PHONE_FORM_RESULT_OFFSET, REPLACEMENT_PHONE_FORM_RESULT_BYTES)
        } ?: error("Could not find the Sezzle login form")

        // Morphe may apply a dependency both explicitly and through the parent patch's
        // dependency closure. Skip the second application.
        if (editor.matchesBytes(innerFormOffset + PHONE_FORM_RESULT_OFFSET, EXPECTED_PHONE_FORM_RESULT_BYTES)) {
            val replacement = if (injectPatchWarning.value == true) {
                "Continue with Google to log in to your Sezzle account.\n\nCAUTION: You are using a patched version of Sezzle"
            } else {
                "Continue with Google to log in to your Sezzle account."
            }
            editor.replaceStringUsingDonor(
                target = "Enter your mobile number to log in or sign up.",
                replacement = replacement,
                donor = "../src/features/login/components/loginView/components/loginForm/components/innerForm/components/authPhoneTextInput/authPhoneTextInput.stories"
            )
            editor.replaceStringUsingDonor(
                target = "Let's start with your mobile number.",
                replacement = replacement,
                donor = "../src/features/login/components/loginView/components/loginForm/components/innerForm/components/pinTextInput/pinTextInput.stories"
            )

            // Replace the completed phone subtree with null before the social component is
            // built. The original layout instructions remain intact, including the object
            // construction required by its phone/social child branch.
            editor.patchBytesIfMatches(
                innerFormOffset + PHONE_FORM_RESULT_OFFSET,
                EXPECTED_PHONE_FORM_RESULT_BYTES,
                REPLACEMENT_PHONE_FORM_RESULT_BYTES
            )
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
