extension {
    name = "extensions/youtube-extras.mpe"
}

android {
    namespace = "io.github.bryceaspringfield.morphe.extension.youtube"
}

dependencies {
    compileOnly(fileTree("libs") { include("*.jar") })
}
