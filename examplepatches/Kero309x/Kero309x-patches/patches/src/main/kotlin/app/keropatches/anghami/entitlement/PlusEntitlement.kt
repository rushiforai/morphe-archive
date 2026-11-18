// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.entitlement

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The account's own derivation of "is this a paying subscriber?".
 *
 * The static `isPlus()` is a cached wrapper around this method, so answering here
 * covers both entry points. Every other entitlement answer either calls this or
 * compares the raw plan type, which keeps the change in one place.
 */
private object AccountPlanFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isPlusUser",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * The account flag that turns the player restrictions on for this account.
 *
 * For a subscriber the server sends it off; for a free account it sends it on and
 * the player refuses to scrub, repeat or play more. Since the flag is a server
 * answer, the client has to be told the subscriber value instead.
 */
private object PlayerRestrictionFlagFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "enablePlayerRestrictions",
    isStatic = true,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * The account flag that turns those refusals into an upsell prompt.
 *
 * It is consulted before the seek, repeat or play-more action is allowed, and when
 * it answers true the action is replaced by a "subscribe" message. A subscriber
 * never sees it, because the server sends it off for one.
 */
private object PlayerRestrictionUpsellFingerprint : Fingerprint(
    definingClass = "LW7/a;",
    name = "f",
    isStatic = true,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Makes the client treat the signed-in account as a subscriber.
 *
 * The answer is derived locally: a plus plan, a free trial, or a gold plan. The
 * patch replaces the derivation with a constant, so every feature that asks the
 * client whether the account pays gets yes: download allowances, lyrics, queue
 * behaviour, upsell suppression and the rest.
 *
 * Two more answers are server-flag driven and do not consult the plan at all, so
 * they are answered here as well. One marks the account as restricted in the
 * player; the other turns an attempted scrub, repeat or play-more into an upsell
 * message. A subscriber receives both off from the server, and without this the
 * client would keep refusing those actions for an account it otherwise treats as
 * paying.
 *
 * The plan type itself is not changed, and neither is the gold answer. That is
 * deliberate. The plan type is what the server sent and what the account screen
 * displays, and the gold answer drives a different tier's checks; rewriting
 * either would make the client claim a purchase that never happened. Features
 * that the server still refuses keep their normal refusal path.
 *
 * This patch overlaps several single-purpose patches on purpose. It is the broad
 * switch, and the narrow patches exist so a user can take one behaviour without
 * the rest.
 */
@Suppress("unused")
val plusEntitlementPatch = bytecodePatch(
    name = "Plus entitlement state",
    description = "Reports the account as a paying subscriber to every local check that derives that state.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.ENTITLEMENT.label)

    execute {
        AccountPlanFingerprint.method.returnEarly(true)
        PlayerRestrictionFlagFingerprint.method.returnEarly(false)
        PlayerRestrictionUpsellFingerprint.method.returnEarly(false)
    }
}
