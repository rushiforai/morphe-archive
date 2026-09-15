-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.morphe.** {
  *;
}

# This bundle's own extension classes. Without a keep rule R8 shrinks them out of the
# .mpe, and every patch calling them fails at runtime with NoClassDefFoundError.
-keep class app.ahmedyarub.** {
  *;
}
-keep class com.google.** {
  *;
}
-keep class com.eclipsesource.v8.** {
  *;
}
# Proguard can strip away kotlin intrinsics methods that are used by extension Kotlin code. Unclear why.
-keep class kotlin.jvm.internal.Intrinsics {
    public static *;
}
-dontwarn javax.lang.model.element.Modifier