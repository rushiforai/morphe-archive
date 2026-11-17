/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.settings

import app.morphe.patcher.patch.ResourcePatchContext
import app.badfella.patches.ultimea.upstream.shared.misc.dart.dartAotLibrary

internal fun ResourcePatchContext.writeNativeEdits(
    @Suppress("UNUSED_PARAMETER") feature: String,
    library: ByteArray,
    edits: List<Pair<Int, ByteArray>>,
) {
    edits.forEach { (offset, replacement) -> replacement.copyInto(library, offset) }
    dartAotLibrary().writeBytes(library)
}
