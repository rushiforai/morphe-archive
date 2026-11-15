extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "spooky.morphe.extension"
    lint {
            abortOnError = false
            checkReleaseBuilds = false
    }
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
}
