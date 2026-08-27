package app.mctoolbox.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * vs0.a()Z — checks if ad duration has elapsed.
 * Compares currentTimeMillis >= start + duration*1000.
 * Body is replaced: always returns true.
 */
object Vs0TimeElapsedFingerprint : Fingerprint(
    definingClass = "Lvs0;",
    name = "a",
    returnType = "Z",
    parameters = listOf()
)

/**
 * vs0.b()Z — second completion check used for early-close dialog
 * and reward condition.
 * Body is replaced: always returns true.
 */
object Vs0CanCloseFingerprint : Fingerprint(
    definingClass = "Lvs0;",
    name = "b",
    returnType = "Z",
    parameters = listOf()
)

/**
 * SimpleInterstitialAdActivity.r() — ad screen countdown tick.
 * Called 100ms after the activity is created.
 * finish() is injected at method start: activity closes immediately
 * without showing content, and the reward path inside finish() runs.
 */
object AdScreenTickFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/simpleads/SimpleInterstitialAdActivity;",
    name = "r",
    returnType = "V",
    parameters = listOf()
)

/**
 * n21$a.b()V — called when all ad sources have failed.
 * Shows toast, dismisses dialog, resets n21.W flag.
 * Premium is written directly via bridge.b.S() at method start.
 */
object AdAllSourcesFailedFingerprint : Fingerprint(
    definingClass = "Ln21\$a;",
    name = "b",
    returnType = "V",
    parameters = listOf()
)

/**
 * m21.onClick(View)V — "Watch ad" button click handler.
 * Contains "premium_ticket" string used in r2.b() call.
 */
object M21OnClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("premium_ticket")
)
