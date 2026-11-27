dependencies {
    compileOnly(project(":extensions:brave:stub"))
}

android {
    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}
