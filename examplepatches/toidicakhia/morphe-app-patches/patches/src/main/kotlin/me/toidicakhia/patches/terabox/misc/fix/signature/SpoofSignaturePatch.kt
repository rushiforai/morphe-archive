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

val spoofSignaturePatch = bytecodePatch {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    dependsOn(disablePlayIntegrityTokensPatch)
    extendWith("extensions/extension.mpe")

    execute {
        spoofSignature(APPLICATION_CLASS)
    }
}
