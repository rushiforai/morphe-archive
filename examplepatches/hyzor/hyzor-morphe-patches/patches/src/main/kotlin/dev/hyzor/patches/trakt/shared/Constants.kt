/*
 * Copyright 2026 ineednotitle
 * https://github.com/ineednotitle/Proteus-Patches
 *
 * The VIP constants (USER, USER_IS_VIP) are ported from the Trakt "Unlock VIP" patch in
 * Proteus-Patches (GPLv3), re-resolved for 3.28.0.
 *
 * The auth constants (AUTH_HELPER, AUTH_REDIRECT_FLAG, AUTH_CONFIG_HELPER, AUTH_CONFIG_GETTER)
 * are original work for this bundle, added with the 3.28.0 port.
 */

package dev.hyzor.patches.trakt.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** `User`: the Kotlinx-serialized account model (14 fields, `a`…`n`). */
    const val USER = "Ltv/trakt/trakt/common/model/User;"

    /**
     * `User.h`, the `isVip` boolean. The name is R8 output, not source: the class is
     * `@Serializable`, so the class name survives but the field letters do not. `h` follows
     * `g` (`isPrivate`) in `User.toString()`, which still spells the field order out in 3.28.0.
     */
    const val USER_IS_VIP = "h"

    /**
     * `s2j`: the auth helper. `b(MainActivity, String)` reports whether the chosen browser
     * package implements AndroidX AuthTab support.
     */
    const val AUTH_HELPER = "Ls2j;"

    /** `cp4`: the Firebase Remote Config wrapper. [AUTH_CONFIG_GETTER] reads a boolean key. */
    const val AUTH_CONFIG_HELPER = "Lcp4;"

    /** `cp4.b(String)Z`, the Remote Config boolean getter the auth coroutine calls. */
    const val AUTH_CONFIG_GETTER = "b"

    /** Firebase Remote Config key that selects the HTTPS OAuth redirect on 3.28.0. */
    const val AUTH_REDIRECT_FLAG = "mobile_https_auth_callback_enabled_2"

    val TRAKT = Compatibility(
        name = "Trakt",
        packageName = "tv.trakt.trakt",

        // The tested artifact is the APKMirror bundle for 3.28.0 (versionCode 452,
        // arm64-v8a + armeabi-v7a splits). Trakt ships as a bundle, so the target is APKM.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xED1C24,

        targets = listOf(
            AppTarget(version = "3.28.0", versionCode = 452),
        ),
    )
}
