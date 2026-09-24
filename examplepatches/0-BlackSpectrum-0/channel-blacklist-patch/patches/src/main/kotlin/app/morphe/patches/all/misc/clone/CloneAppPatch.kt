package app.morphe.patches.all.misc.clone

import app.morphe.patcher.patch.resourcePatch

private var targetPackageName: String? = null

/**
 * Resets the target package name state.
 * Prevents package name state from leaking across patcher runs in the same JVM.
 */
fun resetTargetPackageName() {
    targetPackageName = null
}

internal val cloneAppPatch = resourcePatch {
    execute {
        resetTargetPackageName()
    }
}

/**
 * Set or get the fallback package name.
 *
 * If a custom package name (such as "app.morphe.android.youtube" from GmsCoreSupportPatch)
 * has been set, that custom package name is returned.
 * If fallbackPackageName is a custom package name (i.e. not the stock "com.google.android.youtube"),
 * it sets the target package name and returns it.
 * Otherwise, if no custom package name has been set (root install), fallbackPackageName is returned.
 */
fun setOrGetFallbackPackageName(fallbackPackageName: String): String {
    val current = targetPackageName
    if (current != null) {
        return current
    }

    if (fallbackPackageName != "com.google.android.youtube") {
        targetPackageName = fallbackPackageName
        return fallbackPackageName
    }

    return fallbackPackageName
}
