import com.android.build.api.dsl.ApplicationExtension

// The Morphe Gradle plugin builds a DEX extension resource consumed by
// extendWith("extensions/cromite.mpe") in the patcher.
extension {
    name = "extensions/cromite.mpe"
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.cromite"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
