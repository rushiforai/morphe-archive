package app.whatsapp.patches.metaai

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Meta AI UI cleanup in WhatsApp.
 */

/**
 * Matches HomeActivity.onResume() to hide presentation-layer Meta AI entry points
 * (such as the Meta AI FAB and search bar placeholder) while preserving normal search.
 */
object HomeActivityOnResumeFingerprint : Fingerprint(
    definingClass = "/HomeActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Fallback matching HomeActivity.onCreate(Bundle) if onResume is inherited.
 */
object HomeActivityOnCreateFingerprint : Fingerprint(
    definingClass = "/HomeActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
