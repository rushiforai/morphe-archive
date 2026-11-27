# R8 rules shared by all extensions (applied in settings.gradle.kts).

-dontobfuscate
-dontoptimize
-keepattributes *

# Extension classes are only called by bytecode that patches add, so R8 sees no uses of them.
# Keep everything except the Kotlin standard library, which R8 then trims to what extension code
# uses. Listing only your extension packages here would also shrink other libraries, but a package
# missing from that list is removed without any build error.
-keep class !kotlin.**,!kotlinx.**,** {
    *;
}

# Annotation-only dependencies pulled in by the bundled Car App Library; absent at run time.
-dontwarn javax.lang.model.**
-dontwarn com.google.errorprone.annotations.**
-dontwarn java.lang.reflect.AnnotatedType
