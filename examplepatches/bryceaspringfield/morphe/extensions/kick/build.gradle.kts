extension {
    name = "extensions/kick-extras.mpe"
}

android {
    namespace = "io.github.bryceaspringfield.morphe.extension.kick"
}

dependencies {
    // KICK's own OkHttp 4.12.0 and Okio 3.6.0 (names kept in its dex), for compiling only.
    compileOnly(fileTree("libs") { include("*.jar") })
}
