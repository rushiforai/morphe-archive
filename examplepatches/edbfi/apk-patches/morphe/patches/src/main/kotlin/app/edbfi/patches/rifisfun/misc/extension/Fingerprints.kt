// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.rifisfun.misc.extension

import app.edbfi.patches.rifisfun.APPLICATION
import app.morphe.patcher.Fingerprint

internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = APPLICATION,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
