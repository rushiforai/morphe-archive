dependencies {
    compileOnly(project(":extensions:shared:library"))
}

extension {
    name = "extensions/messenger.mpe"
}

android {
    // Unique per extension to avoid install-time package collisions.
    namespace = "app.morphe.extension.messenger"
}
