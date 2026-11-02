extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "io.github.matthewriley05.machu.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }
}

dependencies {
    compileOnly(project(":stubs:earth"))
}
