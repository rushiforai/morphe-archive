extension {
    name = "extensions/skipper.mpe"
}

android {
    namespace = "dev.ytmruskippper.skipper"
}

dependencies {
    // Not bundled: the official Morphe shared extension provides these classes in the patched app.
    compileOnly(libs.morphe.extensions.library)
}
