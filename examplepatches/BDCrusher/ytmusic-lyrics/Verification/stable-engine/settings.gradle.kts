rootProject.name = "ytmusic-stable-engine-verification"
includeBuild(providers.gradleProperty("patcherSource").getOrElse("../../BuildSources/morphe-patcher-stable")) {
    dependencySubstitution {
        substitute(module("app.morphe:morphe-patcher")).using(project(":"))
    }
}
