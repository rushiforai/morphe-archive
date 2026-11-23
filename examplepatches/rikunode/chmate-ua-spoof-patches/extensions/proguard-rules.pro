# Keep every hook/activity entry point by name; strip unused library code (e.g. Kotlin stdlib)
# so nothing but this package is merged into the host app.
-keep class app.morphe.extension.chmateuaspoof.** { *; }
-dontobfuscate
-dontwarn **
