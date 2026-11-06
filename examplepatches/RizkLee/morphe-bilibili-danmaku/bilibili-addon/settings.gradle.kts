pluginManagement {
    repositories { mavenLocal(); gradlePluginPortal(); google(); mavenCentral(); maven { url = uri("https://jitpack.io") } }
}
plugins { id("app.morphe.patches") version "2.1.0" }
settings { extensions { projectsPath = null } }
dependencyResolutionManagement {
    versionCatalogs { create("libs") { from(files("../gradle/libs.versions.toml")) } }
}
includeBuild("../build/local-deps/morphe-patcher") {
    dependencySubstitution { substitute(module("app.morphe:morphe-patcher")).using(project(":")) }
}
