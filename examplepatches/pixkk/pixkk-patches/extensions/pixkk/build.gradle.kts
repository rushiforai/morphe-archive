dependencies {
    compileOnly(libs.annotation)
}

extension {
    name = "extensions/pixkk.mpe"
}

android {
    namespace = "app.pixkk.extension"

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}
