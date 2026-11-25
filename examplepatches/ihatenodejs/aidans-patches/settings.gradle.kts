import org.gradle.api.artifacts.repositories.MavenArtifactRepository

rootProject.name = "aidans-patches"

pluginManagement {
  repositories {
    mavenLocal()
    gradlePluginPortal()
    mavenCentral()
    google()
    maven {
      name = "GitHubPackages"
      url = uri("https://maven.pkg.github.com/MorpheApp/registry")
      credentials {
        val releaseMavenToken = System.getenv("RELEASE_MAVEN_TOKEN")?.takeIf { it.isNotBlank() }
        username =
          if (releaseMavenToken != null) {
            "x-access-token"
          } else {
            providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR") ?: "ihatenodejs"
          }
        password = releaseMavenToken ?: providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
      }
    }
    maven { url = uri("https://jitpack.io") }
  }
}

plugins {
  id("app.morphe.patches") version "1.3.4"
}

val releaseMavenToken = System.getenv("RELEASE_MAVEN_TOKEN")?.takeIf { it.isNotBlank() }
if (releaseMavenToken != null) {
  val registryUrl = uri("https://maven.pkg.github.com/MorpheApp/registry")
  val repository =
    checkNotNull(
      dependencyResolutionManagement.repositories
        .withType<MavenArtifactRepository>()
        .singleOrNull { it.url == registryUrl },
    ) { "Expected exactly one Morphe dependency Maven repository" }
  repository.credentials {
    username = "x-access-token"
    password = releaseMavenToken
  }
}
