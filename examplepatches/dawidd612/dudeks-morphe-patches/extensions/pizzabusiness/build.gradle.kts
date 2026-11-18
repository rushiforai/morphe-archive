android {
    namespace = "pl.dudek.extension.pizzabusiness"
    defaultConfig { minSdk = 24 }
}
dependencies { compileOnly(project(":extensions:pizzabusiness:stub")) }
