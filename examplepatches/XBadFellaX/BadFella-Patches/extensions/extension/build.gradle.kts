extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.badfella.extension"
    compileSdk = 37
    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:6.2")
}
