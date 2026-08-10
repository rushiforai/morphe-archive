extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.ang3lo.extension"
    buildFeatures {
        buildConfig = true
    }
    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}
