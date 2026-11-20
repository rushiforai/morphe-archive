extension {
    // Path of the compiled extension inside the .mpp. Patches load it with extendWith(...).
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.modprod.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly(libs.annotation)
    // Host app provides the real Fragment at runtime; compileOnly for .mpe build only.
    compileOnly("androidx.fragment:fragment:1.8.5")
}
