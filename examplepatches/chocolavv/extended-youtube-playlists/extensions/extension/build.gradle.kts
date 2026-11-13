extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.extendedplaylists.extension"
}

dependencies {
    compileOnly(libs.annotation)
    // Settings and logging come from the Morphe Patches extension in the patched app.
    compileOnly(libs.morphe.extensions.library)
}
