-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.xitter.** {
  *;
}
-dontwarn okhttp3.**
-dontwarn okio.**
