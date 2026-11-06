package app.template.patches.reddit.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY

/**
 * Account-flag spoof family — all verified against Reddit 2026.42.0's
 * AccountJsonAdapter / Account.<init> (ordered Moshi options table):
 *
 *   idx 4  is_employee                 Z
 *   idx 17 has_verified_email          Ljava/lang/Boolean;  (boxed)
 *   idx 44 hide_ads                    Z
 *   idx 45 outbound_clicktracking      Z
 *   idx 46 can_create_subreddit        Z
 *   idx 47 can_edit_name               Z
 *   idx 49 password_set                Z
 *
 * All server-validated actions still fail server-side; these patches only bend
 * what the *client* shows/enables — exactly the "Unlock Premium" mechanism.
 */

@Suppress("unused")
val redditUnlockAccountEntitlementsPatch = bytecodePatch(
    name = "Unlock Account Entitlements",
    description = "Locally flips account-gating flags at the Account JSON adapter: " +
        "can_create_subreddit, can_edit_name, password_set (kills the SSO 'set password' nag) " +
        "and has_verified_email. Off by default; server entitlements still rule API actions.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    execute {
        forceAccountFlags(
            AccountFromJsonFingerprint.method,
            AccountJsonAdapterConstructorFingerprint.method,
            listOf(
                "can_create_subreddit" to true,
                "can_edit_name" to true,
                "password_set" to true,
                "has_verified_email" to true,
            ),
            "Account Entitlements"
        )
    }
}

@Suppress("unused")
val redditDisableClickTrackingPatch = bytecodePatch(
    name = "Disable Click Tracking",
    description = "Forces the outbound click-tracking account preference off at the " +
        "Account deserialization choke point (local; server-side click analytics may " +
        "still be recorded). Enabled by default.",
    default = true,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    execute {
        forceAccountFlags(
            AccountFromJsonFingerprint.method,
            AccountJsonAdapterConstructorFingerprint.method,
            listOf("outbound_clicktracking" to false),
            "Click Tracking"
        )
    }
}

@Suppress("unused")
val redditEmployeeDebugPatch = bytecodePatch(
    name = "Employee Debug Flags",
    description = "Spoofs is_employee locally at the Account JSON adapter, exposing " +
        "Reddit's internal employee/debug UI menus (mostly non-functional without the " +
        "employee backend, and a few may misbehave — enable for exploration only). " +
        "Off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    execute {
        forceAccountFlags(
            AccountFromJsonFingerprint.method,
            AccountJsonAdapterConstructorFingerprint.method,
            listOf("is_employee" to true),
            "Employee Debug"
        )
    }
}
