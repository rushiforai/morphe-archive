allprojects {
    version = providers.gradleProperty("releaseVersion")
        .orElse("1.0.7")
        .get()
}
