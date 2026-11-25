package app.infinity.patches.api

import app.infinity.patches.shared.Constants.COMPATIBILITY_INFINITY
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

/**
 * Removes the paywall nag that Infinity+ shows on launch.
 *
 * `Infinity->y()` opens the subscription activity whenever the "unlocked" flag is false.
 * Returning from it immediately also skips the EventBus broadcast that follows, which is
 * what the subscription screen listens to, so nothing is left half-initialised.
 *
 * `billingClientOnServiceConnected` is resolved leniently: its anchor literal was dropped
 * in 8.3.3, and the paywall is already gone once `y()` is neutered, so a miss is not fatal.
 */
private val disableBillingPatch = bytecodePatch(
    default = false
) {
    execute {
        billingClientOnServiceConnectedFingerprint.methodOrNull?.replaceInstructions(
            0,
            "return-void"
        )

        infinityStartSubscriptionActivityFingerprint.method.replaceInstructions(
            0,
            "return-void"
        )
    }
}

@Suppress("unused")
val spoofClientPatch = bytecodePatch(
    name = "Spoof client (Infinity)",
    description = "Replaces the bundled Reddit OAuth credentials with your own, so the app " +
            "keeps working after Reddit's API changes. Requires a client ID from " +
            "https://www.reddit.com/prefs/apps (create an 'installed app').",
    default = true
) {
    compatibleWith(*COMPATIBILITY_INFINITY)

    dependsOn(disableBillingPatch)

    val clientId by stringOption(
        key = "client-id",
        default = null,
        title = "OAuth client ID",
        description = "The Reddit OAuth client ID of an 'installed app' created at " +
                "https://www.reddit.com/prefs/apps.",
        required = true,
        validator = { value ->
            !value.isNullOrBlank() && value.matches(Regex("^[\\w-]{22}$"))
        }
    )

    val redirectUri by stringOption(
        key = "redirect-uri",
        default = "redreader://rr_oauth_redir",
        title = "Redirect URI",
        description = "The redirect URI configured on your Reddit app. Must match exactly. " +
                "Leave as-is unless you entered something different on Reddit.",
        required = true,
        validator = { value -> !value.isNullOrBlank() }
    )

    val userAgent by stringOption(
        key = "user-agent",
        default = "org.quantumbadger.redreader/1.25.1",
        title = "User agent",
        description = "The user agent sent to Reddit. Leave blank to keep the app's own " +
                "user agent.",
        required = false
    )

    execute {
        // The client ID lives in libinfinity.so and is read through a native method, so
        // there is no body to rewrite — each call site has to be redirected instead.
        //
        // `invoke-static ...getId()` is always followed by `move-result-object vN`. The
        // invoke is replaced with a nop rather than deleted so the following instruction
        // keeps its index, then the move-result is turned into the constant that loads
        // into the very same register the rest of the method already expects.
        clientIdFingerprint.matchAll().forEach { match ->
            val index = match.instructionMatches[0].index
            val method = match.method

            val moveResultIndex = index + 1
            val moveResult = method.getInstruction(moveResultIndex)
            if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) {
                // A call site that throws the client ID away has nothing to spoof, but it
                // also means the shape assumed here no longer holds, so say so loudly
                // rather than corrupting the method.
                throw PatchException(
                    "Expected move-result-object after APIUtils.getId() in " +
                            "${method.definingClass}->${method.name}, found ${moveResult.opcode}"
                )
            }
            val register = (moveResult as OneRegisterInstruction).registerA

            method.replaceInstruction(index, "nop")
            method.replaceInstruction(
                moveResultIndex,
                "const-string v$register, \"${clientId!!.escapeSmali()}\""
            )
        }

        // The redirect URI is a plain literal in both the app's own classes and in the
        // obfuscated AppAuth helper, so both sets of call sites get rewritten in place.
        val redirectUriMatches = redirectUriFingerprint.matchAllOrNull().orEmpty() +
                obfuscatedRedirectUriFingerprint.matchAllOrNull().orEmpty()

        if (redirectUriMatches.isEmpty()) {
            throw PatchException("Found no redirect URI literal to replace")
        }

        redirectUriMatches.forEach { match ->
            match.replaceStringLiterals(redirectUri!!) { it == STOCK_REDIRECT_URI }
        }

        // Only rewrite the user agent when one is set; blanking the option keeps the app's
        // own agent. The default identifies as RedReader, which matches the redirect URI
        // default -- Reddit ties rate limits to the agent, and the stock Infinity agent is
        // the one its own (now dead) client ID was throttled under.
        userAgent?.takeIf { it.isNotBlank() }?.let { agent ->
            // A miss is not fatal: another bundle's spoof patch (Patcheddit) applied in the
            // same run rewrites these literals first, leaving nothing here to match.
            val userAgentMatches = anyUserAgentFingerprint.matchAllOrNull().orEmpty()
            if (userAgentMatches.isEmpty()) {
                Logger.getLogger("SpoofClientPatch").warning(
                    "Found no user agent literal to replace; keeping the current one"
                )
            }

            userAgentMatches.forEach { match ->
                // `contains`, not `startsWith`: the literal appears both bare and with an
                // `android:` prefix depending on the call site.
                match.replaceStringLiterals(agent) { it.contains(USER_AGENT_PREFIX) }
            }
        }
    }
}

/**
 * Replaces every `const-string` in this match's method whose literal satisfies [predicate]
 * with [value], keeping each literal's original destination register.
 *
 * The method's instructions are scanned rather than using [Match.stringMatches]: that legacy
 * list is only populated for exactly-compared string declarations, and stays empty for the
 * partial (`String.contains`) matches this patch relies on — which would make the rewrite
 * silently do nothing instead of failing.
 */
private fun Match.replaceStringLiterals(value: String, predicate: (String) -> Boolean) {
    val escaped = value.escapeSmali()

    method.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO
    }?.filter { (_, instruction) ->
        predicate((((instruction as ReferenceInstruction).reference) as StringReference).string)
    }?.map { it.index }?.forEach { index ->
        val register = method.getInstruction<OneRegisterInstruction>(index).registerA
        method.replaceInstruction(index, "const-string v$register, \"$escaped\"")
    }
}

/**
 * Escapes a value for embedding in a smali string literal.
 */
private fun String.escapeSmali() = replace("\\", "\\\\").replace("\"", "\\\"")
