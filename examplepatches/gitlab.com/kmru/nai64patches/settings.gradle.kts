rootProject.name = "Nai64Patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        // Morphe artifacts are mirrored here because GitHub Packages needs
        // credentials that are unavailable on CI while the account is suspended.
        // Referenced by project id rather than path: the group separator would
        // otherwise be percent-encoded and then decoded by Gradle, which yields
        // a 404 on the nested-group route.
        maven {
            name = "GitLabMaven"
            url = uri("https://gitlab.com/api/v4/projects/87212140/packages/maven")
        }
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

dependencyResolutionManagement {
    // The patches plugin appends an unreachable GitHub Packages repository to
    // every project. PREFER_SETTINGS is required so those project repositories do
    // not shadow the repositories declared here.
    repositoriesMode = RepositoriesMode.PREFER_SETTINGS
    repositories {
        // The patches plugin adds MorpheApp/registry to every project
        // unconditionally, and that repository cannot authenticate while the
        // GitHub account is suspended. The mirror has to come first so project
        // dependencies resolve before Gradle reaches it.
        maven {
            name = "GitLabMaven"
            url = uri("https://gitlab.com/api/v4/projects/87212140/packages/maven")
        }
        mavenCentral()
        google()
    }
}

settings {
    patchesProjectPath = ":patches"
    extensions {
        projectsPath = ":extensions"
        proguardFiles("proguard-rules.pro")
    }
}
