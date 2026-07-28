package app.template.patches.rustore.auth

import app.morphe.patcher.Fingerprint

/**
 * Matches `AuthSuggestDelegateImpl.ensureAuthSuggestShown()`, the central
 * authorization check that displays the login prompt before an app update.
 */
object AuthSuggestShownFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.sourceFile == "AuthSuggestDelegateImpl.kt" &&
            method.implementation != null
    },
)
