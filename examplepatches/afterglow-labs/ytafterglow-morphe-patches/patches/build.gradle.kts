group = "app.afterglow"

patches {
    about {
        name = "Afterglow"
        description = "Afterglow for YouTube on Android, including integrated Morphe features."
        source = "git@github.com:afterglow-labs/ytafterglow-morphe-patches.git"
        author = "afterglow-labs"
        contact = "https://github.com/afterglow-labs/ytafterglow-morphe-patches/issues"
        website = "https://github.com/afterglow-labs/ytafterglow-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

// Original Morphe patch logic is compiled with Afterglow, retaining one shared
// graph of patch objects. Runtime extension assets remain the pinned release DEX.
kotlin.sourceSets.named("main") {
    kotlin.srcDir(rootProject.file("vendor/morphe/patches/src/main/kotlin"))
    kotlin.srcDir(rootProject.file("vendor/morphe/library/src/main/kotlin"))
    // Afterglow has its own release-list generator. This upstream command-line
    // utility is not part of the patch dependency graph.
    kotlin.exclude("app/morphe/util/PatchListGenerator.kt")
}

val compileMorpheAndroidStubs by tasks.registering(JavaCompile::class) {
    source(rootProject.fileTree("vendor/morphe/stubs/src/main/java") { include("**/*.java") })
    classpath = files()
    destinationDirectory.set(layout.buildDirectory.dir("morphe-android-stubs/classes"))
    options.release.set(11)
}

val morpheAndroidStubsJar by tasks.registering(Jar::class) {
    dependsOn(compileMorpheAndroidStubs)
    from(compileMorpheAndroidStubs.flatMap { it.destinationDirectory })
    archiveFileName.set("morphe-android-compile-stubs.jar")
    destinationDirectory.set(layout.buildDirectory.dir("morphe-android-stubs"))
}

dependencies {
    compileOnly(libs.gson)
    compileOnly(files(morpheAndroidStubsJar))
    // Required by the public smali types used by the original Morphe sources.
    compileOnly("com.google.guava:guava:33.6.0-jre")
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    processResources {
        from(rootProject.file("vendor/morphe/resources"))
        from(rootProject.file("vendor/morphe/licenses")) { into("afterglow/licenses/morphe") }
        from(rootProject.file("vendor/morphe/provenance.json")) { into("afterglow/licenses/morphe") }
        from(rootProject.file("vendor/morphe/README.md")) {
            into("afterglow/licenses/morphe")
            rename { "ADAPTATION.md" }
        }
        from(rootProject.file("NOTICE"))
        from(rootProject.file("LICENSE"))
        from(rootProject.file("NOTICE")) { into("afterglow/licenses") }
        from(rootProject.file("LICENSE")) { into("afterglow/licenses") }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
