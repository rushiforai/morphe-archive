-repackageclasses app.morphe.extension.isolated
-dontoptimize
-keepattributes *
-keep class app.morphe.extension.chmate.** {
    *;
}
-keep class dev.carlsen.mega.Mega { *; }
-keep class io.ktor.client.engine.okhttp.OkHttpEngineContainer { *; }
-keep class io.ktor.client.HttpClientEngineContainer { *; }
-keep class dev.whyoleg.cryptography.CryptographyProviderContainer { *; }
-keep class dev.whyoleg.cryptography.providers.jdk.JdkCryptographyProviderContainer { *; }
-keep class rikka.shizuku.** {
    *;
}
-keep class rikka.sui.** {
    *;
}

# Programmable NG evaluates user-authored rules with Rhino in interpreter mode.
-keep class org.mozilla.javascript.** { *; }
-dontwarn jdk.dynalink.**
-dontwarn java.beans.**
