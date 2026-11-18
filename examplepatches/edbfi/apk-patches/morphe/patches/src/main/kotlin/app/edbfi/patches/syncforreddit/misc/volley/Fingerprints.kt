// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.volley

import app.morphe.patcher.Fingerprint

/** Volley, which Sync bundles with its class names kept, sends every API, Redgifs and Imgur request from here. */
internal object PerformRequestFingerprint : Fingerprint(
    definingClass = "Lcom/android/volley/toolbox/BasicNetwork;",
    name = "performRequest",
    returnType = "Lcom/android/volley/NetworkResponse;",
    parameters = listOf("Lcom/android/volley/Request;"),
)
