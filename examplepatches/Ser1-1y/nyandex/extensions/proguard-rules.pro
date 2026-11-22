# Extensions are called by name from patched bytecode, so nothing is renamed or removed from
# Nyandex's own classes. Unused library code is stripped.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.nyandex.** {
  *;
}
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
