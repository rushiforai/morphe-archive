# Shrink only: the extension classes are called from the patched app by name.
# Shrinking drops the Kotlin standard library the Android plugin adds,
# which would otherwise be merged into the app and replace its own copy.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class io.github.hyperstown.extension.** {
  *;
}
