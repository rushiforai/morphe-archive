/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.gphotos.patches.camera

import app.gphotos.patches.shared.Constants.COMPATIBILITY_GPHOTOS
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel

/**
 * Google Photos' "is this path the camera folder?" check: `(String)Z`, skips Photos' own `/mars_files/`, then
 * accepts the DCIM root, anything under it, and the Pixel camera volume. The media scanner stores its answer on every
 * item, so this one method decides what counts as camera roll (and is always backed up).
 */
private val cameraFolderCheck = Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("/mars_files/", "/dcim/"),
)

private val cameraFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.dcimcamera") }
    }
}

@Suppress("unused")
val cameraFolderPatch = bytecodePatch(
    name = "Only real camera photos count as Camera",
    description = "Google Photos treats everything under DCIM as Camera, so screenshots and other apps' DCIM " +
        "folders are always backed up with it. Only DCIM/Camera counts; the rest become normal device folders you " +
        "choose in Photos' own Backup settings. A switch in Loki Patches restores Photos' rule.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GPHOTOS)
    dependsOn(menuPatch, cameraFlag)

    execute {
        val method = cameraFolderCheck.method
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, Lapp/loki/extension/PhotosDevice;->cameraFolder(Ljava/lang/String;)I
                move-result v0
                if-ltz v0, :photos_rule
                return v0
            """,
            ExternalLabel("photos_rule", method.getInstruction(0)),
        )
    }
}
