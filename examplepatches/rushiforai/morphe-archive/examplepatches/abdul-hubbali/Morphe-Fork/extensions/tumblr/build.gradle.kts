dependencies {
    compileOnly(project(":extensions:tumblr:stub"))
}

extension {
    name = "extensions/tumblr.mpe"
}

android {
    defaultConfig {
        minSdk = 26
    }
}

