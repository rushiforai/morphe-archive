# Shrink the extension to the extension code itself.
# Without this, the Kotlin standard library added by the Android Gradle plugin is merged into the patched apps.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.twoeno.** {
  *;
}
