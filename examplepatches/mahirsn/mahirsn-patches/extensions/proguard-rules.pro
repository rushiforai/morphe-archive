-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.mahirsn.** {
  *;
}
# Morphe Patches classes come from the base bundle at runtime; only stubs are on the compile path.
-dontwarn app.morphe.extension.**
