/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.universal

import app.loki.patches.universal.appGmsCoreSupportPatch
import app.splitwise.patches.shared.Constants.COMPATIBILITY_SPLITWISE

@Suppress("unused")
val gmsCoreSupportPatch = appGmsCoreSupportPatch(
    name = "GmsCore support (Splitwise)",
    description = "Routes Google sign-in, Google Drive and Firebase push through MicroG-RE (GmsCore) instead of Google " +
        "Play services. Signs the push registration with Splitwise's original certificate, so notifications still " +
        "arrive on a re-signed build, and keeps receipt OCR on real Play services. MicroG-RE has to be installed " +
        "and signed in to a Google account.",
    compatibility = COMPATIBILITY_SPLITWISE,
)
