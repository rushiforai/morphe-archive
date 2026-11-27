/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.COPY_TEXT
import app.fakh.patches.shared.register
import app.morphe.patcher.patch.patch

@Suppress("unused")
val copyTextPatch = patch(
    name = "Copy text",
    description = "Adds Copy text to the ⋯ menu of posts and comments.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Posts")

    dependsOn(postMenuPatch)

    execute {
        register(COPY_TEXT)
    }
}
