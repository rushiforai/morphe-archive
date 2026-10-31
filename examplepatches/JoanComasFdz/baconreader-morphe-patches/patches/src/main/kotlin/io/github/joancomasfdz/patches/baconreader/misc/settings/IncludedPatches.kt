// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.returnEarly
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE

private const val INCLUDED_PATCHES_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/settings/IncludedPatches;"

/**
 * Makes IncludedPatches.[name] return true in the extension, so the settings screen shows the settings of the
 * patch. [name] is a method of IncludedPatches.java, such as "embedCommentImages".
 */
internal fun BytecodePatchContext.markPatchIncluded(name: String) {
    Fingerprint(
        definingClass = INCLUDED_PATCHES_CLASS_DESCRIPTOR,
        name = name,
        returnType = "Z",
        parameters = listOf(),
    ).method.returnEarly(true)
}
