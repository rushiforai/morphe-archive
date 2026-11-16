/*
 * Original work for this bundle, added with the Trakt 3.28.0 port.
 *
 * Trakt 3.28 moved sign-in to AndroidX AuthTab, whose HTTPS hand-off is bound to the app's
 * signing certificate through Digital Asset Links. That check can never pass for a Morphe-signed
 * APK, so this patch routes the same OAuth flow through a regular Custom Tab, which Chrome can
 * hand back to the app through the callback filter MainActivity already declares.
 */

package dev.hyzor.patches.trakt.auth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.hyzor.patches.trakt.shared.Constants.AUTH_CONFIG_GETTER
import dev.hyzor.patches.trakt.shared.Constants.AUTH_CONFIG_HELPER
import dev.hyzor.patches.trakt.shared.Constants.TRAKT
import dev.hyzor.patches.util.getReference
import dev.hyzor.patches.util.returnEarly

/**
 * Fresh sign-ins on a re-signed Trakt 3.28 build fail before the app ever sees the OAuth code.
 *
 * 3.28 signs in through AndroidX **AuthTab** with the HTTPS redirect
 * `https://app.trakt.tv/callback/app/trakt`. Chrome completes an AuthTab hand-off only after
 * Digital Asset Links verification against `app.trakt.tv`, which lists Trakt's signing
 * certificate. Morphe re-signs the APK, so verification fails (`Statement failure matching
 * fingerprint`), Chrome never delivers the code, and the app falls back to the retired
 * `trakt://auth` redirect — which `auth.trakt.tv` answers with "Update the Trakt app".
 *
 * The app has a second, AuthTab-free path: a regular Custom Tab using the *same* HTTPS redirect.
 * `MainActivity.w(Uri)` already accepts that callback and exchanges the code. Two hooks route the
 * flow there:
 *
 * 1. the `mobile_https_auth_callback_enabled_2` Remote Config key is forced on, so the app builds
 *    the HTTPS redirect instead of `trakt://auth` even when Firebase Remote Config cannot be
 *    fetched;
 * 2. [AuthTabSupportFingerprint] is forced to answer `false`, so the auth coroutine takes its
 *    regular Custom Tab branch instead of AuthTab.
 *
 * Chrome then treats the callback as an app link. It opens Trakt directly when the user has
 * approved the `app.trakt.tv` link for the app, and otherwise offers an "Open in Trakt" prompt.
 * The app-link filter is already part of the stock manifest, so no manifest change is needed.
 *
 * This is about the re-signature, not about VIP: it applies to any Morphe-patched Trakt build.
 */
@Suppress("unused")
val fixSignInPatch = bytecodePatch(
    name = "Fix sign-in",
    description = "Signs in through a regular browser tab so the OAuth callback can return to " +
        "a re-signed build. If the browser offers to open Trakt, choose it.",
    default = true,
) {
    compatibleWith(TRAKT)

    execute {
        forceHttpsRedirect(HttpsAuthCallbackFingerprint.method)
        // s2j.b only answers the AuthTab capability question; its fallback is the Custom Tab.
        AuthTabSupportFingerprint.method.returnEarly(false)
    }
}

/**
 * Forces the `mobile_https_auth_callback_enabled_2` Remote Config read to yield `true`.
 *
 * The flag is read with `cp4.b(String)Z`; the injected `const/16` goes after its `move-result`
 * and before the branch that chooses between the HTTPS and `trakt://auth` redirects. `const/16`
 * rather than `const/4` keeps the injection valid if a future build moves the result above `v15`.
 */
private fun forceHttpsRedirect(method: MutableMethod) {
    val instructions = method.implementation?.instructions
        ?: throw PatchException("${method.definingClass}->${method.name} has no code to patch.")

    val callIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == AUTH_CONFIG_HELPER &&
                    reference.name == AUTH_CONFIG_GETTER &&
                    reference.returnType == "Z"
            } == true
    }
    if (callIndex < 0) {
        throw PatchException(
            "The Trakt auth coroutine no longer reads the Remote Config flag through " +
                "$AUTH_CONFIG_HELPER->$AUTH_CONFIG_GETTER(String)Z. Re-resolve " +
                "HttpsAuthCallbackFingerprint and the redirect branch.",
        )
    }

    val resultIndex = listOf(callIndex + 1, callIndex + 2).firstOrNull {
        it < instructions.size && instructions[it].opcode == Opcode.MOVE_RESULT
    } ?: throw PatchException("No move-result found after cp4.b(String) in the auth coroutine.")
    val register = (instructions[resultIndex] as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("The cp4.b(String) result is not a single register.")

    method.addInstructions(resultIndex + 1, "const/16 v$register, 0x1")
}
