-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.morphe.** {
  *;
}
-keep class com.google.** {
  *;
}

-keep class kotlin.coroutines.** {
  *;
}
