dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:nunl:stub"))
}

extension {
    name = "extensions/nunl.mpe"
}

android {
    namespace = "app.morphe.extension.nunl"

    defaultConfig {
        minSdk = 22
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}

