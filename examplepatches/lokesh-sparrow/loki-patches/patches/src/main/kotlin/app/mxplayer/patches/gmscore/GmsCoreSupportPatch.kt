/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.gmscore

import app.loki.patches.universal.appGmsCoreSupportPatch
import app.mxplayer.patches.shared.Constants.COMPATIBILITY_MXPLAYER_PRO

@Suppress("unused")
val gmsCoreSupportPatch = appGmsCoreSupportPatch(
    name = "GmsCore support (MX Player Pro)",
    description = "Routes Google sign-in and Google Drive through MicroG-RE (GmsCore) instead of Google Play services, so " +
        "MX Player Pro can sign in to Google Drive on a re-signed build. MicroG-RE has to be installed and signed " +
        "in to a Google account.",
    compatibility = COMPATIBILITY_MXPLAYER_PRO,
)
