android {
    namespace = "pl.dudek.extension.instagram"
    defaultConfig { minSdk = 28 }
}

dependencies {
    compileOnly(project(":extensions:instagram:stub"))
}
