# Keep all patch classes — the patch loader reflects over them.
-keep class app.morphe.patches.** { *; }
-keep class app.morphe.extension.** { *; }
-keepclassmembers class * {
    @app.morphe.patcher.patch.Patch <fields>;
}
