import com.android.build.api.dsl.ApplicationExtension

// Nothing from the app is called directly: Local Dream is obfuscated by R8, so
// its class names change from build to build. The extension only uses the
// platform, and the patch hands it what it needs from the app.

configure<ApplicationExtension> {
    namespace = "app.lchanc3.extension.localdream"
    compileSdk = 36

    defaultConfig {
        // Local Dream itself supports API 28+.
        minSdk = 28
    }
}
