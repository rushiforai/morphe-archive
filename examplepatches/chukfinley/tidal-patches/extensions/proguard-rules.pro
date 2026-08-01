-dontobfuscate
-dontoptimize
-keepattributes *
-keep class dev.chuk.** {
  *;
}
-keep class com.google.** {
  *;
}
# Proguard can strip away kotlin intrinsics methods that are used by extension Kotlin code. Unclear why.
-keep class kotlin.jvm.internal.Intrinsics {
    public static *;
}
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
