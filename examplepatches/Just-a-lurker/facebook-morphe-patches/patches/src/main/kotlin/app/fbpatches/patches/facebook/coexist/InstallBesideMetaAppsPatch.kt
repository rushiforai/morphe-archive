/*
 * The permission half follows Hushfacebook
 * (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0), facebook/coexist,
 * rewritten for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.coexist

import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/** The manifest half: both shared permissions renamed wherever the manifest names one. */
private val renameSharedPermissionsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.renameSharedPermissions() }
    }
}

/**
 * Lets stock Messenger, Facebook Lite, Business Suite and Workplace install and update beside a
 * re-signed Facebook. See SharedPermissions.kt for which permissions collide and why they're
 * renamed rather than taken out.
 *
 * The code half follows the manifest: Facebook's code names FB_APP_COMMUNICATION when it registers
 * a receiver only its family may reach and when it sends a broadcast only its family may receive.
 * Left alone they'd name a permission this build no longer holds, and those broadcasts would stop
 * reaching Facebook itself.
 */
@Suppress("unused")
val installBesideMetaAppsPatch = bytecodePatch(
    name = "Install beside Meta's apps",
    description = "Lets stock Messenger, Facebook Lite, Business Suite and Workplace install and update " +
        "beside this re-signed Facebook. Without it, Android refuses one of them because they share two " +
        "permissions with Facebook. Works as soon as you patch it in, with no switch.",
    default = true,
) {
    dependsOn(renameSharedPermissionsPatch, extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        routeSharedLiterals()
    }
}
