# Patches call extension methods by name and replace some of their bodies (e.g. PatchStatus).
# Renaming, inlining or constant-folding them would break those hooks.
-dontobfuscate
-dontoptimize

# Extension classes are merged into the Twitch app's dex and reached only from patched code.
# Extensions are written in Java, so no Kotlin runtime classes are kept or merged.
-keep class io.github.bakwudo.uyu.extension.** { *; }
