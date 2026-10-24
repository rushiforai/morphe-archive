# MPEs are minified independently; their private class names must not overlap.
-repackageclasses app.morphe.extension.isolated

# Rebased to ChMate's own Fragment class after compilation; keep the patch anchors intact.
-keep class app.morphe.extension.chmate.NativeToolFragment { *; }
-keep class app.morphe.extension.chmate.NativeToolTabs { *; }
-keep class app.morphe.extension.chmate.NativeThemeColors { *; }

# Coroutines' Android fast loader instantiates this factory by class-name string.
# Preserve its constructor while keeping the library isolated from ChMate's copy.
-keep,allowobfuscation class kotlinx.coroutines.android.AndroidDispatcherFactory { *; }
-adaptclassstrings kotlinx.coroutines.internal.FastServiceLoader

# Go mobile binds JNI symbols to these exact class/method names.
-keep class go.** { *; }
-keep class app.morphe.extension.chmate.vpn.nativecore.** { *; }
