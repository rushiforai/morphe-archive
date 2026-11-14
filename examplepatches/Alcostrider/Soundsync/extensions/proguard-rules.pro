# The patched app calls these classes by name: keep them exactly as written.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.soundsync.** {
  *;
}
