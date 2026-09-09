// No plugins block: the app.morphe.patches settings plugin applies AGP and sets
// the namespace (defaultNamespace + module name = app.vantage.extension.claude).
android {
    defaultConfig {
        // Matches the Claude app's minSdkVersion (32).
        minSdk = 32
    }
}

dependencies {
    compileOnly(libs.annotation)
}
