rootProject.name = "jptt-morphe-patches"

pluginManagement {
    // Gradle compiles this block in isolation from the rest of the file, so the
    // GitHub CLI lookup has to be defined inline.
    val gh: (List<String>) -> String? = { args ->
        try {
            val exe = if (System.getProperty("os.name").startsWith("Windows")) "gh.exe" else "gh"
            val process = ProcessBuilder(listOf(exe) + args).start()
            val output = process.inputStream.bufferedReader().readText().trim()
            process.errorStream.close()
            if (process.waitFor() == 0 && output.isNotEmpty()) output else null
        } catch (_: Exception) {
            null
        }
    }

    // Any GitHub account works; the token only needs the `read:packages` scope.
    //
    // These exact four names are the only ones that work, because the Morphe
    // settings plugin adds the same repository for itself and reads nothing else:
    //
    //     providers.gradleProperty("gpr.user").orElse(System.getenv("GITHUB_ACTOR")).get()
    //
    // Deriving them here from `gh` would only get as far as resolving the plugin,
    // and setting them as system properties from this script is too late: Gradle
    // snapshots the settings scope properties before it runs. So check up front,
    // because the plugin's own failure is a bare IllegalArgumentException with no
    // message that says nothing about credentials.
    val user = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
    val key = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")

    if (user == null || key == null) {
        val loggedIn = gh(listOf("api", "user", "--jq", ".login")) != null &&
            gh(listOf("auth", "token")) != null

        error(
            buildString {
                appendLine()
                appendLine("No GitHub credentials for maven.pkg.github.com, where the Morphe")
                appendLine("Gradle plugin lives. Set gpr.user and gpr.key in")
                appendLine("~/.gradle/gradle.properties, or GITHUB_ACTOR and GITHUB_TOKEN in")
                appendLine("the environment.")
                appendLine()
                if (loggedIn) {
                    appendLine("`gh` is logged in with a usable token, so this is enough:")
                    appendLine()
                    appendLine(
                        "    { echo \"gpr.user = ${'$'}(gh api user --jq .login)\"; " +
                            "echo \"gpr.key  = ${'$'}(gh auth token)\"; } " +
                            ">> ~/.gradle/gradle.properties",
                    )
                } else {
                    appendLine("Either log in with the scope the plugin needs:")
                    appendLine()
                    appendLine("    gh auth login && gh auth refresh -s read:packages")
                    appendLine()
                    appendLine("or make a classic token at")
                    appendLine("<https://github.com/settings/tokens/new?scopes=read:packages>.")
                }
            },
        )
    }

    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = user
                password = key
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

settings {
    extensions {
        // Must be an absolute path, otherwise extensions in subfolders fail to
        // find the config.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
