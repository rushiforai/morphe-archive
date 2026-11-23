extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "dev.dyno0311.extension"
    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
}
