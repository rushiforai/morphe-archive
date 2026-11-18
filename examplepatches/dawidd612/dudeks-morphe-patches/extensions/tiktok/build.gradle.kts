android {
    namespace = "pl.dudek.extension.tiktok"
    defaultConfig { minSdk = 23 }
}
dependencies { compileOnly(project(":extensions:tiktok:stub")) }
