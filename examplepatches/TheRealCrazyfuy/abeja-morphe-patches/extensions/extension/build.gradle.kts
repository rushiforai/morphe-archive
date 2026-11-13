extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.abeja.extension"
}

dependencies {
    // These classes are provided by the target app at runtime. They are only
    // needed to compile the extension code.
    compileOnly("androidx.fragment:fragment:1.6.2")
    compileOnly("androidx.preference:preference:1.2.1")
}
