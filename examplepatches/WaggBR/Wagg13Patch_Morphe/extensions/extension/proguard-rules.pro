-dontobfuscate
-dontoptimize
-keepattributes *

# Extension classes are referenced by name from the injected bytecode.
-keep class app.morphe.** {
  *;
}

# HiddenApiBypass is called directly and through reflection.
-keep class org.lsposed.** {
  *;
}

-keep class com.google.** {
  *;
}
