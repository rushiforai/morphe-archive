package app.modprod.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    /** Release GitHub qui contient les APK de base. */
    const val BASE_RELEASE = "https://github.com/MOD-PROD/modprod-apk-creator/releases/download/base-apk/"

    /** Nom de package de l'APK de base (base-app/apk-src). */
    const val BASE_PACKAGE = "app.modprod.apkbase"
    const val BASE_APK_URL = BASE_RELEASE + "apk-base.apk"

    /** Nom de package de l'APK de base Android TV (base-app/atv-src). */
    const val ATV_PACKAGE = "app.modprod.atvlink.base"
    const val ATV_APK_URL = BASE_RELEASE + "atv-base.apk"

    /** Dossiers des assets de l'appli HTML dans l'APK de base. */
    const val ASSETS_ROOT = "assets/htmlapp/root/"
    const val ASSETS_INDEX = "${ASSETS_ROOT}index/"
    const val ASSETS_CONFIG = "${ASSETS_ROOT}config/"

    val COMPATIBILITY_BASE = Compatibility(
        name = "APK Base",
        packageName = BASE_PACKAGE,
        description = "APK de base ModProd, à télécharger ici (ne pas chercher ailleurs) : $BASE_APK_URL",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E90FF,
        targets = listOf(
            // Toutes les versions de l'APK de base.
            AppTarget(
                version = null,
                description = "Télécharger l'APK de base : $BASE_APK_URL",
            ),
        ),
    )

    val COMPATIBILITY_ATV = Compatibility(
        name = "ATV Base",
        packageName = ATV_PACKAGE,
        description = "APK de base Android TV ModProd, à télécharger ici (ne pas chercher ailleurs) : $ATV_APK_URL",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E90FF,
        formFactor = FormFactor.TV,
        targets = listOf(
            AppTarget(
                version = null,
                description = "Télécharger l'APK de base TV : $ATV_APK_URL",
            ),
        ),
    )
}
