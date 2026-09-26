import com.android.build.api.dsl.ApplicationExtension

extension {
    name = "extensions/nothingx.mpe"
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.nothingx"
    compileSdk = 37

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
