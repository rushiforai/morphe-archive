extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.saketh.extension"
}

// This extension is Java-only. A second stdlib can shadow the external signature hook's D8 outlines.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
}
