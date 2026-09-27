/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/** The manifest half: both shared permissions renamed wherever the manifest names one. */
private val renameSharedPermissionsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.renameSharedPermissions() }
    }
}

/**
 * Lets Meta's own apps install beside a re-signed Facebook. See SharedPermissions.kt for which
 * permissions collide and why they're renamed rather than taken out.
 *
 * The code half follows the manifest: Facebook's code names FB_APP_COMMUNICATION when it registers
 * a receiver only its family may reach and when it sends a broadcast only its family may receive
 * (the cross-app broadcast manager, the MQTT service's receiver, the zero-rating switch, the login
 * state broadcast and Profilo's trace control, six places on 577 and 580). Left alone they'd name a
 * permission this build no longer holds, and those broadcasts would stop reaching Facebook itself.
 *
 * No switch: a manifest can't change at run time, so the patch stays in while paused.
 */
@Suppress("unused")
val installBesideMetaAppsPatch = bytecodePatch(
    name = "Install beside Meta's apps",
    description = "Lets the official Messenger, Facebook Lite, Business Suite and Workplace install beside the " +
        "patched Facebook. Facebook shares two permissions with them, and Android lets only one signing key own " +
        "a permission, so this patch renames Facebook's. A Root Mount install doesn't need it.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    dependsOn(renameSharedPermissionsPatch, facebookExtensionPatch)

    execute {
        routeSharedLiterals()
        enableStatus("installBesideMetaApps")
    }
}
