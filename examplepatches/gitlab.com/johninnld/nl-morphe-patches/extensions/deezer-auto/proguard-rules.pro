# Preserve the host wire protocol; isolate implementation dependencies from Deezer's
# independently obfuscated AndroidX/Kotlin libraries. No original app classes are replaced.
-keep class nl.johninnl.deezer.auto.** { *; }
-keep class androidx.car.app.** { *; }
-repackageclasses nl.johninnl.deezer.auto.internal
-dontoptimize
