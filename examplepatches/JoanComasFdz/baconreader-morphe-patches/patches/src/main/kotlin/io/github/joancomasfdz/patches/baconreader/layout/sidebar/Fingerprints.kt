// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.sidebar

import app.morphe.patcher.Fingerprint

internal const val MAIN_ACTIVITY_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/ui/main/MainActivity;"

internal object MainActivityOnPrepareOptionsMenuFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS_DESCRIPTOR,
    name = "onPrepareOptionsMenu",
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
)

internal object MainActivityOpenLinksetFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS_DESCRIPTOR,
    name = "openLinkset",
    returnType = "V",
    parameters = listOf(),
)

/** Called when the posts of the feed are loaded. */
internal object MainActivityOnFirstLinkFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS_DESCRIPTOR,
    name = "onFirstLink",
    returnType = "V",
    parameters = listOf("Lcom/onelouder/baconreader/reddit/Link;"),
)
