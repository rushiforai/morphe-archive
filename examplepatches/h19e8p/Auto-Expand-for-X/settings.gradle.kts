rootProject.name = "auto-expand-for-x"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        // Morphe の Gradle プラグインは GitHub Packages で公開されているため、
        // read:packages 権限のある GitHub のトークンが要る。~/.gradle/gradle.properties の
        // gpr.user と gpr.key、または環境変数 GITHUB_ACTOR と GITHUB_TOKEN で渡す。
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
            }
        }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"
        // 絶対パスで指定する必要がある。
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
