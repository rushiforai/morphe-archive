extension {
    name = "extensions/kick-extras.mpe"
}

android {
    namespace = "io.github.bryceaspringfield.morphe.extension.kick"
}

dependencies {
    compileOnly(fileTree("libs") { include("*.jar") })
}
