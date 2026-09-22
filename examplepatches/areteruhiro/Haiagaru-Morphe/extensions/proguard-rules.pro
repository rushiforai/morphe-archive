-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.morphe.extension.chmate.** {
    *;
}
-keep class rikka.shizuku.** {
    *;
}

# Programmable NG evaluates user-authored rules with Rhino in interpreter mode.
-keep class org.mozilla.javascript.** { *; }
-dontwarn jdk.dynalink.**
-dontwarn java.beans.**
