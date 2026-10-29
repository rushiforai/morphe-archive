/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.patches.terabox.misc.fix.signature

import app.morphe.patcher.patch.bytecodePatch
import app.apppatches.patches.shared.Constants
import app.apppatches.patches.shared.misc.signature.spoofSignature
import app.apppatches.patches.terabox.misc.fix.integrity.disablePlayIntegrityTokensPatch

private const val APPLICATION_CLASS = "Lcom/dubox/drive/shell/ShellApplication;"

val spoofSignaturePatch = bytecodePatch {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    dependsOn(disablePlayIntegrityTokensPatch)
    extendWith("extensions/extension.mpe")

    execute {
        spoofSignature(APPLICATION_CLASS)
    }
}
