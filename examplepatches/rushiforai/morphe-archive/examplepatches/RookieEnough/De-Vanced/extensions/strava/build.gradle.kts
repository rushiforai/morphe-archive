dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:strava:stub"))
    compileOnly(libs.okhttp)
}

extension {
    name = "extensions/strava.mpe"
}

android {
    // Unique per extension to avoid install-time package collisions.
    namespace = "app.morphe.extension.strava"
}

