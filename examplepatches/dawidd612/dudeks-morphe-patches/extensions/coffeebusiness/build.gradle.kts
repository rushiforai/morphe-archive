android {
    namespace = "pl.dudek.extension.coffeebusiness"
    defaultConfig { minSdk = 25 }
}
dependencies { compileOnly(project(":extensions:coffeebusiness:stub")) }
