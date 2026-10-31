// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.extension

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

private const val STRINGS_FILE = "res/values/strings.xml"
private const val BUNDLED_STRINGS = "baconreader/strings.xml"
private const val RESOURCES_CLOSING_TAG = "</resources>"

/**
 * Adds the strings of the patches (patches/src/main/resources/baconreader/strings.xml) to the app,
 * where the extension reads them with StringRef.str.
 */
internal val stringsResourcePatch = resourcePatch {
    execute {
        val bundled = object {}.javaClass.classLoader.getResourceAsStream(BUNDLED_STRINGS)
            ?.use { it.readBytes().toString(Charsets.UTF_8) }
            ?: throw PatchException("$BUNDLED_STRINGS is missing from the patches")

        val strings = bundled.substring(
            bundled.indexOf("<resources>") + "<resources>".length,
            bundled.lastIndexOf(RESOURCES_CLOSING_TAG),
        ).trim()

        // Not decoded: the written file adds its strings to the app's, unless another patch decoded it.
        val file = get(STRINGS_FILE, copy = false)
        val text = if (file.exists()) {
            file.readText()
        } else {
            file.parentFile?.mkdirs()
            "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n$RESOURCES_CLOSING_TAG\n"
        }
        val closingIndex = text.lastIndexOf(RESOURCES_CLOSING_TAG)
        if (closingIndex < 0) throw PatchException("$STRINGS_FILE has no closing resources tag")

        file.writeText(
            text.substring(0, closingIndex).trimEnd() + "\n    " + strings + "\n" + text.substring(closingIndex),
        )
    }
}
