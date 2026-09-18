android {
    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:primevideo:stub"))
}
