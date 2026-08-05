extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "io.github.david419kr.niconicoyt.extension"
    defaultConfig {
        minSdk = 28
    }
}

dependencies {
    testImplementation(libs.junit)
    testImplementation(libs.json)
}
