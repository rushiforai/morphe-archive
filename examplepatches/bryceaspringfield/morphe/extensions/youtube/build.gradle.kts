extension {
    name = "extensions/youtube-extras.mpe"
}

android {
    namespace = "io.github.bryceaspringfield.morphe.extension.youtube"
}

dependencies {
    // Morphe Patches dev.12's YouTube extension classes, present in the patched app; compiled against, never bundled.
    compileOnly(fileTree("libs") { include("*.jar") })
}
