# SPDX-License-Identifier: AGPL-3.0-or-later
# Patches call extension code from smali by name, so R8 must keep it all as written. The generated R class is unused.
-keep class !**.R, !**.R$*, app.edbfi.extension.** { *; }
-dontobfuscate
# Stub classes are compile-only: the app provides them at runtime.
-dontwarn com.android.volley.**
-dontwarn okhttp3.**
-dontwarn com.google.android.exoplayer2.**
