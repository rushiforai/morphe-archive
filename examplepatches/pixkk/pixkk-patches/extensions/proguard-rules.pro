-dontobfuscate
-dontoptimize
-keepattributes *
-keepattributes RuntimeInvisibleAnnotations,RuntimeInvisibleParameterAnnotations
-keepattributes RuntimeInvisibleTypeAnnotations
# Extension classes are called from injected target bytecode and by reflection.
-keep class app.pixkk.extension.** {
  *;
}
# Proguard can strip away kotlin intrinsics methods that are used by extension Kotlin code.
-keep class kotlin.jvm.internal.Intrinsics {
    public static *;
}
-dontwarn javax.lang.model.element.Modifier
