/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package me.toidicakhia.patches.terabox.misc.fix.signature

import app.morphe.patcher.patch.bytecodePatch
import me.toidicakhia.patches.shared.Constants
import me.toidicakhia.patches.shared.misc.signature.spoofSignature
import me.toidicakhia.patches.terabox.misc.fix.integrity.disablePlayIntegrityTokensPatch

private const val APPLICATION_CLASS = "Lcom/dubox/drive/shell/ShellApplication;"

/**
 * Kept separate from the feature patches so it can be dropped when another
 * patch set already applies an equivalent signature spoof.
 */
@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature",
    description = "Makes the re-signed APK report the stock developer certificate and disables Play " +
        "Integrity token requests, so Google login and TeraBox's anti-cheat accept the patched app. " +
        "Skip it when patching with another set that already spoofs the signature.",
    default = false
) {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    dependsOn(disablePlayIntegrityTokensPatch)
    extendWith("extensions/extension.mpe")

    execute {
        spoofSignature(APPLICATION_CLASS)
    }
}
