-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.wazeytm.** {
  *;
}
# Stub classes are compileOnly and exist in the target app.
-dontwarn com.waze.**
-dontwarn androidx.compose.**

-keep class org.ungoogled.waze.** { *; }

-keep class nl.johninnl.navigation.** { *; }
