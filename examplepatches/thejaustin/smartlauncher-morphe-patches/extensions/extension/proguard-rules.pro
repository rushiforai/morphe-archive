# Keep all Morphe Extension classes and public methods exactly as named
-keep class com.autocat.morphe.smartlauncher.extension.** {
    public static *;
    public *;
}
-keepclassmembers class com.autocat.morphe.smartlauncher.extension.** {
    public static *;
    public *;
}

# Preserve Shizuku API classes
-keep class rikka.shizuku.** { *; }
-keep interface rikka.shizuku.** { *; }
