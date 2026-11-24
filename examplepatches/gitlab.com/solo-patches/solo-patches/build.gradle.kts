allprojects {
    version = providers.gradleProperty("releaseVersion")
        .orElse("1.0.9")
        .get()
}
