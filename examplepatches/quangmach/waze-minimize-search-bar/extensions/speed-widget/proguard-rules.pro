# The patch references this package directly from Waze's manifest and bytecode.
-keep class app.template.extension.extension.SpeedWidget** { *; }
-keep class app.template.extension.extension.NavigationWidget** { *; }

# Waze ships its own Google Play services client. Keep this extension's client
# private so it can coexist with the app's optimized classes.
-repackageclasses 'app.template.extension.speedwidget.dependencies'
-applymapping play-services-mapping.txt

# Optional analysis annotations used by Play services.
-dontwarn com.google.android.apps.common.proguard.SideEffectFree
-dontwarn com.google.errorprone.annotations.**
-dontwarn javax.annotation.Nullable
-dontwarn org.checkerframework.checker.**
