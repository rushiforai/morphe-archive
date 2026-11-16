/*
 * Copyright 2026 rushiranpise
 * https://github.com/rushiranpise/morphe-patches
 *
 * Ported from the nzb360 "Unlock All Access" patch in rushiranpise/morphe-patches
 * (GPLv3), re-resolved for 25.3.
 */

package dev.hyzor.patches.nzb360.unlock

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import dev.hyzor.patches.nzb360.shared.Constants.LICENSE_HELPER
import dev.hyzor.patches.nzb360.shared.Constants.LICENSE_SERVICE
import dev.hyzor.patches.nzb360.shared.Constants.UPGRADE_CENTER
import dev.hyzor.patches.nzb360.shared.Constants.UPGRADE_CENTER_STATE

/**
 * `NZB360LicenseHelper.isAASubscriptionActive()Z` — the cached "All Access is active" flag.
 *
 * It is a plain `sget-boolean` of the private `subscriptionActive` field, written from the
 * `account_status` preference and from the Play Billing result. Seven call sites read it,
 * most importantly [IsUnlockedFingerprint], and the Upgrade Center uses it to decide whether
 * the account already has All Access.
 */
object AllAccessActiveFingerprint : Fingerprint(
    definingClass = LICENSE_HELPER,
    name = "isAASubscriptionActive",
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

/**
 * `NZB360LicenseHelper.isUnlocked(Service, boolean)Z` — the actual service gate:
 *
 *   if (isAASubscriptionActive() && !ignoreAllAccess) return true;
 *   for (status in serviceStatusList) if (status.service == service) return status.unlocked;
 *   return false;
 *
 * The second parameter is the "ignore All Access" flag: the Upgrade Center and the settings
 * module list pass `true` to ask whether a module is individually unlocked, independent of
 * the All Access subscription.
 */
object IsUnlockedFingerprint : Fingerprint(
    definingClass = LICENSE_HELPER,
    name = "isUnlocked",
    returnType = "Z",
    parameters = listOf(LICENSE_SERVICE, "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

/**
 * `NZB360LicenseHelper.isLocked(Service)Z` — the one-argument overload, used by the dashboard
 * and module screens (147 `isLocked` call sites in 25.3). In 25.3 it delegates to
 * `isUnlocked$default(..., false, ...)` and inverts the result.
 */
object IsLockedOneArgFingerprint : Fingerprint(
    definingClass = LICENSE_HELPER,
    name = "isLocked",
    returnType = "Z",
    parameters = listOf(LICENSE_SERVICE),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

/**
 * `NZB360LicenseHelper.isLocked(Service, boolean)Z` — the two-argument overload, which
 * delegates to `isUnlocked(service, z)` and inverts the result.
 */
object IsLockedTwoArgFingerprint : Fingerprint(
    definingClass = LICENSE_HELPER,
    name = "isLocked",
    returnType = "Z",
    parameters = listOf(LICENSE_SERVICE, "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

/**
 * `Contract$UIState.isSubscribed()Z` — the upgrade-center view state that decides whether
 * the paywall or the "you already have All Access" UI is shown.
 */
object IsSubscribedFingerprint : Fingerprint(
    definingClass = UPGRADE_CENTER_STATE,
    name = "isSubscribed",
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

/**
 * `UpgradeCenterKt.SubscriptionSection(...)V` — the Compose plan toggle. It seeds its
 * remembered plan with `"Monthly"` and then renders both the `"Monthly"` and `"Yearly"`
 * buttons from that state, so the method is the anchor for the default-plan change.
 *
 * The parameters are not pinned: the Compose compiler changes the synthetic `$changed` /
 * `$default` ints between builds, and the `"Monthly"` const-string is unique to this method
 * in `UpgradeCenterKt`.
 */
object SubscriptionSectionFingerprint : Fingerprint(
    definingClass = UPGRADE_CENTER,
    name = "SubscriptionSection",
    returnType = "V",
    strings = listOf("Monthly"),
)
