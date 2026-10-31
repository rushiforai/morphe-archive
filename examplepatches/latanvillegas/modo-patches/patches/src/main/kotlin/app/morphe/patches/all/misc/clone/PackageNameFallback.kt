package app.morphe.patches.all.misc.clone

/**
 * Compatibility bridge for retained shared components.
 *
 * The generic "Clone app" patch has been removed from main, so no package-name
 * override exists. Existing consumers receive their supplied default unchanged.
 * No selectable patch is registered by this helper.
 */
fun setOrGetFallbackPackageName(fallbackPackageName: String): String = fallbackPackageName
