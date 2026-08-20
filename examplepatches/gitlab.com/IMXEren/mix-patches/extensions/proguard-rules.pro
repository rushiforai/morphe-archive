-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.mix.** {
  *;
}
-keep class com.google.** {
  *;
}
-keep class org.lsposed.** {
  *;
}
