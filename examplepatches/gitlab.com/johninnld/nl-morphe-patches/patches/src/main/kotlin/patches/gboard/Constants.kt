package patches.gboard

import patches.gboard.gboard as gboardCompatibility

internal object PatchBuildInfo {
    const val VERSION = "18.8.0-beta-port"
}

internal object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"
    const val GBOARD_PATCHED_PACKAGE_NAME = "dev.jason.com.google.android.inputmethod.latin"
    const val GBOARD_PATCH_AUTHOR = "JohninNL"
    const val GBOARD_PATCH_AUTHOR_URL = "https://gitlab.com/johninnld"
    const val GBOARD_PATCH_REPOSITORY_URL = "https://gitlab.com/johninnld/nl-morphe-patches"
    val GBOARD_PATCH_VERSION = PatchBuildInfo.VERSION

    val COMPATIBILITY_GBOARD = gboardCompatibility
}
