// No plugins block: the app.morphe.patches settings plugin applies AGP and sets
// the namespace (defaultNamespace + module name = app.vantage.extension.music)
// for every extensions/* module. Declaring com.android.library here fails with
// "'com.android.library' and 'com.android.application' cannot be applied in the
// same project".
android {
    defaultConfig {
        // Matches the Music APK's minSdkVersion (26).
        minSdk = 26
    }
}

dependencies {
    compileOnly(libs.annotation)
}
