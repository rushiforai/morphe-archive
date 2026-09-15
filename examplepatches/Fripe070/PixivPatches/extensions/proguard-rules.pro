# Preserve Morphe Extension classes, methods, and fields from obfuscation and shrinking
-keep class app.morphe.extension.** { *; }
-keepclassmembers class app.morphe.extension.** { *; }
-keepnames class app.morphe.extension.** { *; }

# Preserve all public and static methods/fields for runtime reflection and DEX hooks
-keepclassmembers class * {
    public static *;
}

# Preserve inner classes and attributes required for reflection
-keepattributes SourceFile,LineNumberTable,Signature,InnerClasses,EnclosingMethod

# Suppress ProGuard / R8 warnings for runtime-provided classes
-dontwarn app.morphe.extension.**
-dontwarn android.**
-dontwarn androidx.**

# Avoid aggressive optimization that could inline or strip helper calls
-dontoptimize
-dontobfuscate
