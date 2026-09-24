import com.android.build.api.dsl.ApplicationExtension

dependencies {
    // Classes that already live inside the patched APK. compileOnly, so none of
    // this ends up in jptt.mpe -- it only lets the code below compile against
    // the exact signatures JPTT 3.8.4 ships.
    compileOnly(project(":extensions:jptt:stub"))

    // Same idea, but these are real libraries JPTT bundles, so the signatures
    // come from the library rather than from a hand written stub. The settings
    // page is built out of androidx.preference, which the app's own settings
    // screens already use.
    compileOnly("androidx.preference:preference:1.2.1")
    compileOnly("androidx.fragment:fragment:1.8.5")
}

configure<ApplicationExtension> {
    namespace = "app.lchanc3.extension.jptt"
    compileSdk = 36

    defaultConfig {
        // JPTT itself supports API 21+.
        minSdk = 21
    }
}
