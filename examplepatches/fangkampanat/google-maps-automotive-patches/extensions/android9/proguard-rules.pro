# The Android 9 extension (patch "Android 9 (API 28)"): its classes under framework names. R8 sees them as program
# classes that shadow the SDK's; nothing in this extension calls most of their members, so keep them all.
-keep class android.** { *; }
# Android 9's hidden classes, compiled against stubs (extensions/android9/stub) and present only on Android 9.
-dontwarn android.view.RenderNode
-dontwarn android.view.DisplayListCanvas
