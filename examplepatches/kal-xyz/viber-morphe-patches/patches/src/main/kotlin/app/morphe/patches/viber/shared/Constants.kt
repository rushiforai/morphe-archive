package app.morphe.patches.viber.shared

object Constants {
    const val PACKAGE_VIBER = "com.viber.voip"

    // Compatibility target: Viber on Android. null = no specific version restriction.
    val COMPATIBILITY_VIBER: Pair<String, Set<String>?> = PACKAGE_VIBER to null
}