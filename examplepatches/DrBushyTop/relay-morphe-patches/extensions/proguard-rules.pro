# Keep only this bundle's own extension classes. Everything else (Kotlin stdlib, Morphe's
# extension library) is stripped, so nothing here can collide with classes Patcheddit injects
# into the same APK.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.drbushytop.** {
  *;
}
-dontwarn **
