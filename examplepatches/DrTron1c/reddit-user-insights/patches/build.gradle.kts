group = "app.userinsights"

patches {
    about {
        name = "Reddit User Insights"
        description = "Top 3 subreddits next to usernames, and unhidden profiles, for Reddit."
        source = "git@github.com:DrTron1c/reddit-user-insights.git"
        author = "DrTron1c"
        contact = "na"
        website = "https://github.com/DrTron1c/reddit-user-insights"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
