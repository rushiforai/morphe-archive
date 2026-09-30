/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.decoder

import app.morphe.patcher.Fingerprint

internal object UserTagInfoDictInitFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/api/schemas/UserTagInfoDict;",
    name = "<init>",
)

/**
 * The media helper class. R8 renamed it on earlier releases, and piko found it by a survey key
 * one of its methods read; 449 keeps the Kotlin name and no longer has that key.
 */
internal const val MEDIA_EXT_CLASS = "Lcom/instagram/feed/media/MediaExtKt;"
