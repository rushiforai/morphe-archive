group = "dev.twitchpatches"

patches {
    about {
        name = "Twitch patches"
        description = "Independent patches for Twitch on Android, compatible with Morphe."
        source = providers.gradleProperty("patches.source").orNull
            ?: System.getenv("GITHUB_REPOSITORY")?.let { "https://github.com/$it" }
            ?: "local:twitch-patches"
        author = providers.gradleProperty("patches.author").orNull ?: "Contributors"
        contact = providers.gradleProperty("patches.contact").orNull ?: ""
        website = providers.gradleProperty("patches.website").orNull ?: ""
        license = "GPLv3"
    }
}


val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    testImplementation("junit:junit:4.13.2")
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

val patchBundle = tasks.named<org.gradle.jvm.tasks.Jar>("jar").flatMap { it.archiveFile }

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generate metadata for the current patch bundle"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        argumentProviders.add(org.gradle.process.CommandLineArgumentProvider {
            listOf(patchBundle.get().asFile.absolutePath)
        })
    }

    // semantic-release entry point.
    publish {
        dependsOn("generatePatchesList")
    }
}
