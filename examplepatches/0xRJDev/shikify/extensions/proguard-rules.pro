# Bytecode hooks and reflection need stable runtime entry points and helper class names.
-keep class app.morphe.extension.boost.** { *; }
# R8 API-model outline classes must keep their namespaced synthetic names.
# Obfuscating these to a/b would collide with Boost's own default-package classes.
-dontobfuscate
