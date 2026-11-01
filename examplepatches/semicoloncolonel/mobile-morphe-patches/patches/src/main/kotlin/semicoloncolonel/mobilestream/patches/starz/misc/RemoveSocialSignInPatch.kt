package semicoloncolonel.mobilestream.patches.starz.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.starz.shared.Constants

// Starz 6.11.0 offers Sign in with Google (Credential Manager) and Sign in
// with Apple (web flow) next to email and TV-provider sign-in. The login
// screen shows each button only when its client ID string is set, and the
// connect-account flows abort when it is empty. Clearing the two IDs turns
// both features off the way an app build without them would. The "or"
// divider only appears next to a visible option, so no gap is left.
private val clientIds = setOf("google_signin_client_id", "apple_signin_client_id")

@Suppress("unused")
val removeSocialSignInPatch = resourcePatch(
    name = "Remove social sign-in",
    description = "Removes the Sign in with Google and Sign in with Apple options from the " +
        "Starz phone app. Email and TV-provider sign-in still work.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            var cleared = 0
            for (i in 0 until strings.length) {
                val element = strings.item(i) as Element
                if (element.getAttribute("name") in clientIds) {
                    element.textContent = ""
                    cleared++
                }
            }
            if (cleared != clientIds.size) throw PatchException("Sign-in client IDs not found")
        }
    }
}
