# R8 runs only to drop what the extension does not use, above all the Kotlin standard library
# the Android plugin adds by default. Without it the extension carries ~1,100 unused classes,
# which pushes the game past one dex file.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.ckzombies.extension.** {
  *;
}
