extension {
    name = "extensions/itruyenchu.mpe"
}

android {
    namespace = "app.hoitruyenchu.extension"
}

dependencies {
    // Signatures of app classes the extension calls into (not bundled).
    compileOnly(project(":extensions:itruyenchu:stub"))
}
