extension {
    name = "extensions/youtube.mpe"
}

android {
    namespace = "app.threadripper.extension"

    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    compileOnly(project(":extensions:youtube:stub"))
}
