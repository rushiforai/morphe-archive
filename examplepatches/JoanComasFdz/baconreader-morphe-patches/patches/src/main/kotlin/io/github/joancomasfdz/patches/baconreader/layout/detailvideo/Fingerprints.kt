// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.detailvideo

import app.morphe.patcher.Fingerprint

/** Shows the video page and starts the player, once the app knows the video's URL. */
internal object DisplayVideoFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/PostMediaHandler;",
    name = "displayVideo",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)
