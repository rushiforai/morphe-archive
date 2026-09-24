# Applied to the extension before it is turned into jptt.mpe.
#
# Without this the extension dex carries the whole Kotlin standard library,
# which JPTT already ships -- merging a second copy into the APK is both 2 MB of
# dead weight and a duplicate class hazard.

-dontobfuscate
-dontoptimize
-keepattributes *

-keep class app.lchanc3.** {
  *;
}

# No keep rule for kotlin.jvm.internal.Intrinsics on purpose: this extension is
# plain Java, and keeping it would merge kotlin.* classes JPTT already has.
# Add it back if any extension code is ever written in Kotlin.

-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
