extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.bardo.letterboxd.extension"

    // La versión del parche (la que sube semantic-release en gradle.properties) llega al
    // «ping» del puente: Bardo la compara con la última release para avisar de actualizaciones.
    buildFeatures {
        buildConfig = true
    }
    defaultConfig {
        buildConfigField("String", "PATCH_VERSION", "\"${project.version}\"")
    }
}
