group = "app.voidhack"

patches {
    about {
        name = "Nich87 Patches"
        description = "Custom patches by Nich87 for use with Morphe."
        source = "https://github.com/Nich87/nich87-patches"
        author = "Nich87"
        contact = "https://github.com/Nich87/nich87-patches/issues"
        website = "https://github.com/Nich87/nich87-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.junit)
    testImplementation(libs.json)
}

sourceSets["test"].java.srcDir(project(":extensions:extension").file("src/test/java"))
tasks.named<JavaCompile>("compileTestJava") {
    options.release.set(11)
    source(project(":extensions:extension").file("src/main/java/app/voidhack/extension/applemusic/GlassSpring.java"))
    source(project(":extensions:extension").fileTree("src/main/java/app/voidhack/extension/applemusic/library") {
        include("LibraryBackup.java", "LibraryImportPlan.java", "LibraryFailure.java")
    })
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
