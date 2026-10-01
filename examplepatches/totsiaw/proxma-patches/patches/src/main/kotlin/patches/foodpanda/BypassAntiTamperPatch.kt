package patches.foodpanda

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * foodpanda anti-tamper / integrity-block bypass.
 *
 * DeliveryHero's `app-security` module ("MAS" = Mobile App Security) runs every foreground activity
 * through a single gate before home/login. That gate reads ONE Boolean returned by the MAS phone /
 * integrity verifier `w9u.a(Continuation)` (obfuscated `Lw9u;->a(Ltx9;)Ljava/lang/Object;`):
 *   TRUE  = device/app trusted -> proceed,
 *   FALSE = launch `com.deliveryhero.app.security.ui.BlockedActivity`
 *           ("This device or application is not supported. Please re-install…").
 * A re-signed / sideloaded build fails MAS's app-id + installer-source + root integrity checks, so
 * the verifier returns FALSE and the block screen kills the app. Forcing that single choke point to
 * TRUE flips the whole gate to "trusted".
 *
 * The verifier is a Kotlin `suspend fun` returning a BOXED result (`Ljava/lang/Object;`), so we
 * return `Boolean.TRUE` (return-object), not a raw `Z` — identical boxing situation to the unlock
 * patch's isSubscribed targets. Returning a resolved Boolean at method entry is a valid synchronous
 * completion for a suspend fn: it is NOT COROUTINE_SUSPENDED, and the caller checks
 * `if-ne result, COROUTINE_SUSPENDED` before unboxing, so it proceeds straight to
 * `booleanValue()` -> true -> no block. No coroutine state-machine concern (we never suspend).
 *
 * Fingerprint is R8-name-independent: it anchors on the non-obfuscated
 * `com.deliveryhero.app.security.MasEvaluationException` that this method news up, plus the const
 * strings "MAS eval" / "MAS evaluation failed." — never on the minified holder class `w9u`.
 *
 * This is an independent, user-facing patch; it does not touch the pandapro unlock patch.
 */
@Suppress("unused")
val bypassAntiTamperPatch = bytecodePatch(
    name = "Bypass anti-tamper (foodpanda)",
    description = "Bypasses foodpanda's DeliveryHero MAS integrity block — forces the master " +
        "security gate (`w9u.a`) to report the device/app as trusted, so re-signed / sideloaded " +
        "builds no longer hit the \"This device or application is not supported\" BlockedActivity.",
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    execute {
        // Master MAS gate: suspend fn returning a boxed Boolean -> return Boolean.TRUE (trusted).
        masGateFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent(),
        )
    }
}
