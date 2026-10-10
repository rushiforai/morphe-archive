/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.flyoutmenu.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

internal object MenuItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("toggleMenuItemMutations")
    )
)

internal object EndButtonsContainerFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.ID, "end_buttons_container")
    )
)
