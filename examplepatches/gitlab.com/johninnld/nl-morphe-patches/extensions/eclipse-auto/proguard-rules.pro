# Preserve the host wire protocol; isolate implementation dependencies from Eclipse's
# independently obfuscated AndroidX/Kotlin libraries. No original app classes are replaced.
-keep class nl.johninnl.eclipse.auto.** { *; }
-keep class androidx.car.app.** { *; }
-repackageclasses nl.johninnl.eclipse.auto.internal
-dontoptimize

# The stubs under stubs/ stand in for the app's own classes: they are compile-only and never
# reach R8. The patch relocates every reference to the app's real class and link-checks it.
-dontwarn nl.johninnl.eclipse.app.**
-dontwarn com.eclipse.android.**
-dontwarn android.support.v4.media.session.**
