-keep class app.hushmessenger.extension.** { *; }
-dontobfuscate
# Messenger itself ships these when the patch merges the extension in.
-dontwarn com.facebook.rsys.**
