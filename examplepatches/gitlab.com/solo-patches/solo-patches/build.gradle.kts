allprojects {
    version = providers.gradleProperty("releaseVersion")
        .orElse("1.0.6")
        .get()
}
