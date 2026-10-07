-dontobfuscate
-dontoptimize
-keepattributes *
# Injection points and JNI entry points are referenced by name from patches and native code.
-keep class app.lockhart.** {
  *;
}
