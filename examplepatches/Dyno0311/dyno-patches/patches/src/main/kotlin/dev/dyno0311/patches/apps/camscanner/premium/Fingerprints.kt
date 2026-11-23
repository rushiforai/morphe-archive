package dev.dyno0311.patches.apps.camscanner.premium

import app.morphe.patcher.Fingerprint

/**
 * com.intsig.comm.account_data.AccountPreference
 *
 * Reads the local "VIP status code" preference (default 0x2). A value of 0x1 is what
 * AccountPreference.o〇0OOo〇0() and CSAccountEntitlementServiceImpl.isVipUser() treat as VIP.
 * Identified by the preference key literal, not by the obfuscated method name alone.
 */
internal object VipStatusCodeFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/comm/account_data/AccountPreference;",
    returnType = "J",
    strings = listOf("qp3sdjd79xhdas02sd")
)

/**
 * com.intsig.comm.account_data.AccountPreference
 *
 * VIP expiry in epoch seconds, read from preference key "tkreds3sdvv22ccsx3xd3".
 * CSAccountEntitlementServiceImpl.isSuperVipUser() requires this to be in the future.
 */
internal object VipExpiryFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/comm/account_data/AccountPreference;",
    returnType = "J",
    strings = listOf("tkreds3sdvv22ccsx3xd3")
)
