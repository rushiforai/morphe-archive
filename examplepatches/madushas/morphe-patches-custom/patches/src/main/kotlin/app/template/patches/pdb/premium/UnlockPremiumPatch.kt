package app.template.patches.pdb.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.pdb.IsProUserFingerprint
import app.template.patches.pdb.ProStatusFingerprint
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Unlocks every Pdb Pro entitlement at the client layer.
 *
 * Pdb gates premium through a single predicate, `isProUser()` (obfuscated
 * `zdf.V()Z`), which itself has three sources of truth:
 *
 *  1. the developer backdoor pref `mockIsProUser`
 *  2. the server-provided `ProStatus.isPro`
 *  3. a `proUser` badge on the profile
 *
 * We drive all of them true:
 *
 *  • [IsProUserFingerprint] → `isProUser()` always returns `true`. This covers
 *    every premium call site (no-ads, hide-online, super-chats, unlimited
 *    rewinds/extends, visitors, view requests, virtual travel, IRL slots,
 *    Power PDB server, Wonder-chat reconnect, AI-friend limits, name colour, …).
 *
 *  • [ProStatusFingerprint] → its zero-arg boolean getters (`isPro`,
 *    `subscriptionBackendConfirmed`) always return `true`, so UI that reads the
 *    server model directly also sees Pro.
 *
 * The `mockIsProUser` preference is additionally force-written by the extension
 * startup hook so the app's own UI stays internally consistent.
 */
@Suppress("unused")
val pdbUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pdb Pro: premium badge plus every entitlement " +
        "(no ads, hide online, unlimited rewinds/extends, super chats, visitors, " +
        "view requests, virtual travel, extra IRL slots, Power PDB server, " +
        "Wonder-chat reconnect, AI-friend limits, name colour, chat bubbles).",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        // 1. isProUser() → always true.
        IsProUserFingerprint.method.returnEarly(true)

        // 2. ProStatus.isPro / subscriptionBackendConfirmed → true.
        ProStatusFingerprint.matchOrNull()?.let { match ->
            mutableClassDefBy(match.originalClassDef.type)
                .methods
                .filter {
                    it.returnType == "Z" &&
                        it.parameterTypes.isEmpty() &&
                        it.implementation != null
                }
                .forEach { it.returnEarly(true) }
        }
    }
}
