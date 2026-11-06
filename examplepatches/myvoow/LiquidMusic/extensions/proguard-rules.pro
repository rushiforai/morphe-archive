# The patch calls the extension by name: its classes keep their names and members.
-keep class app.liquidmusic.extension.** {
  *;
}

# Everything else the extension bundles (Kotlin, coroutines, Jetpack Compose, Backdrop) is renamed
# into a package of its own, so it can never meet the copies Apple Music contains: Morphe merges
# classes that have the same name.
-repackageclasses app.liquidmusic.shaded
-allowaccessmodification

# No optimization: the patch replaces the bodies of the option getters, so their values must not
# be inlined into the callers.
-dontoptimize
-keepattributes Signature,InnerClasses,EnclosingMethod,*Annotation*,SourceFile,LineNumberTable

# The library rules are ignored (see extensions/liquidglass/build.gradle.kts). What they keep and
# the bundled code needs: kotlinx.coroutines updates these fields by name.
-keepclassmembers class kotlinx.coroutines.** {
  volatile <fields>;
}
-keepclassmembers class kotlin.coroutines.SafeContinuation {
  volatile <fields>;
}
-dontwarn **
