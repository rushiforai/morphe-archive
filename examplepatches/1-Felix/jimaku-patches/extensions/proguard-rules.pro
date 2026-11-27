# Shrink only, as Morphe's own extensions do: names stay readable in logs,
# and classes nothing uses (the Kotlin standard library) are left out.
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.jimaku.** {
  *;
}

# Morphe Patches classes come from the app at runtime; the build sees only stubs of them.
-dontwarn app.morphe.**
