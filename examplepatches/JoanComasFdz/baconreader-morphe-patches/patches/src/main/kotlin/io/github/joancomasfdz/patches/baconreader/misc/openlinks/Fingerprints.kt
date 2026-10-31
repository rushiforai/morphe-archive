// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.openlinks

import app.morphe.patcher.Fingerprint

internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/ui/main/MainActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)
