group = "app.tvqa"

patches {
    // TODO: replace these details with your own repository and author information.
    about {
        name = "tvQuickActions Patches"
        description = "Patches for tvQuickActions Pro (dev.vodik7.tvquickactions)."
        source = "git@github.com:6zev/morphe-patches.git"
        author = "Zev"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
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

// Local end-to-end check: run the built bundle over an APK and write the result.
// Usage: ./gradlew :patches:runPatch -Papk=<input.apk> -Pout=<output.apk>
val runPatch by tasks.registering(JavaExec::class) {
    group = "verification"
    description = "Runs the built patch bundle over an APK."
    dependsOn(tasks.named("jar"))

    // Read through providers so the properties are only queried when the task actually runs: a
    // plain `gradle tasks` (or the release job) configures this task without -Papk/-Pout, and
    // must not fail on their absence.
    val apk = providers.gradleProperty("apk")
    val out = providers.gradleProperty("out")
    val bundle = tasks.named<Jar>("jar").flatMap { it.archiveFile }

    inputs.property("apk", apk)
    inputs.property("out", out)

    doFirst { println("input=${apk.get()} output=${out.get()}") }
    classpath = files(bundle) + configurations.getByName("runtimeClasspath")
    mainClass.set("util.RunPatcherKt")
    systemProperty("runPatch.bundle", bundle.get().asFile.absolutePath)
    argumentProviders.add(CommandLineArgumentProvider {
        listOf(apk.get(), out.get())
    })
}
