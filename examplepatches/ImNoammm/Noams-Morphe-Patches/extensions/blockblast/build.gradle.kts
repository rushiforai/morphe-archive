extension {
    name = "extensions/blockblast.mpe"
}

android {
    namespace = "app.noam.extension.blockblast"
}

dependencies {
    // Plain Java: declaring the stdlib compile-only keeps the Kotlin plugin from packing a copy into the extension.
    compileOnly(libs.kotlin.stdlib)
}
