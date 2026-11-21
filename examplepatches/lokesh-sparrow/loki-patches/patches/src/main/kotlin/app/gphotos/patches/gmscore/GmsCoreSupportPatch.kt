/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.gphotos.patches.gmscore

import app.gphotos.patches.shared.Constants.COMPATIBILITY_GPHOTOS
import app.loki.patches.universal.appGmsCoreSupportPatch

@Suppress("unused")
val gmsCoreSupportPatch = appGmsCoreSupportPatch(
    name = "GmsCore support (Google Photos)",
    description = "Routes Google sign-in and Firebase push through MicroG-RE (GmsCore) instead of Google Play " +
        "services, and signs the push registration with Google Photos' original certificate, so the account backs " +
        "up from a re-signed build. MicroG-RE has to be installed and signed in to the same Google account.",
    compatibility = COMPATIBILITY_GPHOTOS,
    // On by default: the patched Photos installs next to the preinstalled one and cannot sign in without it.
    default = true,
)
