dependencies {
    compileOnly(project(":extensions:tumblr:stub"))
}

extension {
    name = "extensions/tumblr.mpe"
}

android {
    namespace = "app.morphe.extension.tumblr"

    defaultConfig {
        minSdk = 26
    }
}

