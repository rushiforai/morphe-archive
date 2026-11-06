// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/updates/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.updates

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
