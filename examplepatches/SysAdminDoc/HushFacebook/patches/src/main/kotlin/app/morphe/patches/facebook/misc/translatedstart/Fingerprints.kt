/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.translatedstart

import app.morphe.patcher.Fingerprint

/** What Facebook logs when its cold start experiments name start-up tasks to skip. */
internal const val SKIP_APP_INITS_LOG = "CSE skip_app_inits: %s"

/**
 * The application's delegate setup, which reads the start-up tasks Facebook's cold start experiments
 * skip, logs them under [SKIP_APP_INITS_LOG], and stores them where the start-up scheduler checks
 * each task by name before it runs it. The class and method are Redex names (`LX/0h5;->A08()V` on
 * 577, `LX/0es;->A08()V` on 580), and the log line is the one method holding it on both.
 */
internal object ApplicationDelegateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf(SKIP_APP_INITS_LOG),
)
