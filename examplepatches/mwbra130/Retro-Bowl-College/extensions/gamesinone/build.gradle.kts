dependencies {
    compileOnly(project(":extensions:gamesinone:stub"))
}

extension {
    name = "extensions/gamesinone.mpe"
}

android {
    // Unique per extension to avoid install-time package collisions.
    namespace = "app.template.extension.gamesinone"
}
