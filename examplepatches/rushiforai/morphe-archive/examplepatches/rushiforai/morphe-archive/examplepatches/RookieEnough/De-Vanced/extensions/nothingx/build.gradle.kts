dependencies {
    compileOnly(project(":extensions:shared:library"))
}

extension {
    name = "extensions/nothingx.mpe"
}

android {
    namespace = "app.morphe.extension.nothingx"

    defaultConfig {
        minSdk = 22
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}

