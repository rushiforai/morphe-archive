# Extension classes are referenced only from injected smali, so nothing may be
# renamed, inlined or stripped.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.morphe.** {
  *;
}
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
