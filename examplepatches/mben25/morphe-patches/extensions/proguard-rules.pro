-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.morphe.** {
  *;
}
-keep class com.google.** {
  *;
}
# Extension code is only reached from patched app bytecode, never from inside the extension, so
# R8 sees no entry points and would strip it all.
-keep class app.template.extension.stayfree.** {
  *;
}
-keep class app.template.extension.infinity.** {
  *;
}
# Proguard can strip away kotlin intrinsics methods that are used by extension Kotlin code. Unclear why.
-keep class kotlin.jvm.internal.Intrinsics {
    public static *;
}
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
