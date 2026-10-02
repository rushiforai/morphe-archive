/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.buildexpiry

import app.morphe.patcher.Fingerprint

/**
 * The method that shows the "this version of Instagram has expired" lockout over the main
 * activity. It takes the activity and a lockout config, reads the "lockout_active" flag and checks
 * the build's age. Another method of its class carries the same string with a boolean parameter, so
 * the activity parameter tells them apart.
 */
internal object BuildExpiredLockoutFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;", "L"),
    strings = listOf("lockout_active"),
)
