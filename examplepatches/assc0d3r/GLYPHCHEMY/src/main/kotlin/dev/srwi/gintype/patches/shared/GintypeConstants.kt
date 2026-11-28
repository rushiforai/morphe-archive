package dev.srwi.gintype.patches.shared

import app.morphe.patcher.patch.Compatibility
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8

/**
 * Attribution and compatibility for the GinType patches ported into this bundle.
 *
 * The patches, their runtime and their behaviour are srwi's work
 * (https://github.com/srwi/GinType, GPLv3). Only the target list is replaced: it points at this
 * bundle's audited 18.8 target set instead of GinType's own generated admission table, so the
 * patches resolve against the releases this tree can actually verify.
 */
internal object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"
    const val GBOARD_PATCHED_PACKAGE_NAME = "dev.srwi.com.google.android.inputmethod.latin"
    const val GBOARD_PATCH_AUTHOR = "srwi"
    const val GBOARD_PATCH_AUTHOR_URL = "https://github.com/srwi"
    const val GBOARD_PATCH_REPOSITORY_URL = "https://github.com/srwi/GinType"

    val COMPATIBILITY_GBOARD: Compatibility = gboardCompatibility18_8()
}
