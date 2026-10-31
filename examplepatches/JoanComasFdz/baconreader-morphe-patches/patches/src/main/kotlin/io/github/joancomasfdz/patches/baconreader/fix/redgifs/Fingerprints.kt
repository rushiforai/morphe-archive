// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.redgifs

import app.morphe.patcher.Fingerprint

internal object GetOkHttpClientFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/media/gfycat/RedGifsManager;",
    name = "getOkhttpClient",
    returnType = "Lokhttp3/OkHttpClient;",
    parameters = listOf(),
)
