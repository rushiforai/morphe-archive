package semicoloncolonel.mobilestream.patches.starz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Starz",
        packageName = "com.bydeluxe.d3.android.program.starz",
        description = "The Starz phone, tablet, and Android TV apps. The 6.12.0 builds share the version " +
            "name. On a TV, patch the Android TV build (version code 9510), not the phone build (4518).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        // One target by version name matches both builds: the phone and tablet build
        // (version code 4518) and the Android TV build (9510). No version code is
        // pinned, so the Android TV build is accepted too. Skip launch video is the
        // only patch that does not apply to it; it no-ops there (see its patch).
        targets = listOf(devTarget("6.12.0"))
    )
}
