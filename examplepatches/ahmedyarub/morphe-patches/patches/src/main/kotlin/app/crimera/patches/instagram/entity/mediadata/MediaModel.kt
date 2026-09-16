/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.crimera.utils.liveTreeGetter
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.Method

/** [liveTreeGetter] against whichever class is carrying the media getters in this build. */
internal fun BytecodePatchContext.mediaModelGetter(
    jsonKey: String,
    returnType: String,
): Method? = mediaModelGetter(jsonKey) { it == returnType }

internal fun BytecodePatchContext.mediaModelGetter(
    jsonKey: String,
    returnType: (String) -> Boolean,
): Method? = liveTreeGetter(mediaModelClass, jsonKey, returnType)
