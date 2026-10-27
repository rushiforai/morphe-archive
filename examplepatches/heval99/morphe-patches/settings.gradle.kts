rootProject.name = "morphe-patches"

pluginManagement {
    repositories {
        // The Morphe Gradle plugin (app.morphe:*, plugin marker app.morphe.patches:*) resolves only
        // from the MorpheApp GitHub Packages registry, never from another repository that could
        // serve a look-alike artifact under the same coordinates.
        exclusiveContent {
            forRepository {
                maven {
                    name = "GitHubPackages"
                    url = uri("https://maven.pkg.github.com/MorpheApp/registry")
                    credentials {
                        username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                        password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
                    }
                }
            }
            filter {
                includeGroupByRegex("""app\.morphe(\..+)?""")
            }
        }
        gradlePluginPortal()
        google()
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.0.0"
}

// The app.morphe.patches settings plugin adds the build's dependency repositories (mavenLocal,
// mavenCentral, google, jitpack and the Morphe registry) after this script runs. Declaring the
// registry here as exclusive content keeps app.morphe libraries (morphe-patcher,
// morphe-patches-library) to the Morphe registry only; everything else still resolves from the
// repositories the plugin adds.
dependencyResolutionManagement {
    repositories {
        exclusiveContent {
            forRepository {
                maven {
                    name = "MorpheRegistry"
                    url = uri("https://maven.pkg.github.com/MorpheApp/registry")
                    credentials {
                        username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                        password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
                    }
                }
            }
            filter {
                includeGroupByRegex("""app\.morphe(\..+)?""")
            }
        }
    }
}
