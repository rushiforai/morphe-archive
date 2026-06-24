dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:amznmusic:stub"))
}

extension {
    name = "extensions/amznmusic.mpe"
}

android {
    // Unique per extension to avoid install-time package collisions.
    namespace = "app.morphe.extension.amznmusic"
}

