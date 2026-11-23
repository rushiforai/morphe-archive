-dontobfuscate
-dontoptimize
-keepattributes *
-keep class dev.materialtidal.** {
  *;
}
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
