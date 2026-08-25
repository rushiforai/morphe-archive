package app.template.patches.rustore.updates

import app.morphe.patcher.Fingerprint

/**
 * Matches `GetNewerAppsUseCaseImpl.getAppVersionInfoList()` immediately before
 * the installed-app metadata is submitted to the update lookup repository.
 */
object GetAppVersionInfoListFingerprint : Fingerprint(
    returnType = "Ljava/io/Serializable;",
    parameters = listOf("L", "Ljava/lang/String;", "L"),
    custom = { method, classDef ->
        classDef.sourceFile == "GetNewerAppsUseCaseImpl.kt" &&
            method.implementation != null
    },
)
