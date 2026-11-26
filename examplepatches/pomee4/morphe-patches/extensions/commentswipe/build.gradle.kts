extension {
    name = "extensions/commentswipe.mpe"
}

android {
    namespace = "app.pomee4.extension.commentswipe"
}

dependencies {
    // Function0 and Function2 of the settings row. Reddit has the Kotlin standard library.
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.1.0")
}
