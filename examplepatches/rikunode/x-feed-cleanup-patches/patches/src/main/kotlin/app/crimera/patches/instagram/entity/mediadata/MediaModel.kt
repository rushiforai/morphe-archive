/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.crimera.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.crimera.utils.liveTreeGetter
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.Method

/** [liveTreeGetter] on the media class, which carries the media getters since v441 folded the media dict into it. */
internal fun BytecodePatchContext.mediaModelGetter(
    jsonKey: String,
    returnType: String,
): Method? = mediaModelGetter(jsonKey) { it == returnType }

internal fun BytecodePatchContext.mediaModelGetter(
    jsonKey: String,
    returnType: (String) -> Boolean,
): Method? = liveTreeGetter(MEDIA_CLASS_NAME, jsonKey, returnType)
