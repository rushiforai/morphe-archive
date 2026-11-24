package app.jofslash.patches.kaloricketabulky.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "cz.psc.android.kaloricketabulky"

    /**
     * SHA-1 of the certificate the maker signs the app with (from Google Play's base.apk). Its Google
     * sign-in client is registered for it, and MicroG-RE answers Google with it for the patched app.
     */
    const val SIGNATURE = "932fd5810dfe4c226499dd89c6b08461242cf854"

    /** The app's own classes keep their names; only the libraries are renamed. */
    const val APP = "Lcz/psc/android/kaloricketabulky"

    val COMPATIBILITY_KALORICKE_TABULKY = Compatibility(
        name = "Kalorické Tabulky",
        packageName = PACKAGE_NAME,
        // Not on APKMirror. APKPure has it as an XAPK, and Google Play installs it as split APKs.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x8CC63F,
        targets = listOf(
            AppTarget(version = "3.14.71"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
