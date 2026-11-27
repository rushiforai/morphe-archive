plugins {
    id("com.android.library")
}

description = "Signatures of the Morphe Patches extension classes Jimaku calls. Compile only, never shipped."

android {
    namespace = "app.jimaku.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }
}
