/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.feed

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.sduiComponentFilterPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val postMenuPatch = bytecodePatch(
    name = "Post menu items",
    description = "Adds Copy text, Download photos and videos, and Save document as PDF to the ⋯ menu of posts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    // The menu is edited and the posts are remembered in the SDUI component hook.
    dependsOn(sduiComponentFilterPatch)

    execute { markIncluded("isPostMenuIncluded") }
}
