/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.ghost

import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.patch.bytecodePatch

/**
 * The user-facing ghost mode patch. Stories, Instants and messages report being seen over unrelated
 * paths (a REST request, a separate Instants API and the direct thread protocol), so each surface is
 * its own patch with its own toggle and this one only brings them together.
 */
@Suppress("unused")
val ghostModePatch =
    bytecodePatch(
        name = "Ghost mode",
        description = "Lets you watch stories, Instants and messages without being marked as seen. Each surface has its own toggle in Piko settings.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(ghostStoriesPatch, ghostInstantsPatch, ghostMessagesPatch)
    }
