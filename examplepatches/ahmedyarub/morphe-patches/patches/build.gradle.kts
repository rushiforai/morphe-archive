group = "app.ahmedyarub"

patches {
    about {
        name = "Ahmed Yarub's Patches"
        description = "Personal patches for use with Morphe"
        source = "git@github.com:ahmedyarub/morphe-patches.git"
        author = "ahmedyarub"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Shared helpers (returnEarly, findFreeRegister, ...).
    implementation(libs.morphe.patches.library)
    // Instagram specific patches and fingerprints shared with brosssh's bundle.
    implementation(libs.instagram.morphe.patches.library)

    testImplementation(kotlin("test"))
    testImplementation(platform(libs.junit.bom))
    testImplementation(libs.junit.jupiter)
    testImplementation(libs.kotlinx.coroutines.core)
    testRuntimeOnly(libs.junit.platform.launcher)
}

tasks {
    val jar = named<Jar>("jar")

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        // The bundle this build produced, its version, and where the list goes. Without them the
        // generator picked whichever .mpp in build/libs the file system listed first.
        args(
            jar.get().archiveFile.get().asFile.absolutePath,
            project.version.toString(),
            rootProject.file("patches-list.json").absolutePath,
        )
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }

    withType<Test>().configureEach {
        // The tests load the bundle the way Morphe does, from the built .mpp.
        dependsOn(jar)
        systemProperty("morphe.bundle", jar.get().archiveFile.get().asFile.absolutePath)
        systemProperty("morphe.buildDir", layout.buildDirectory.get().asFile.absolutePath)
        testLogging {
            events("passed", "skipped", "failed")
            exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL
        }
    }

    test {
        useJUnitPlatform { excludeTags("apk") }
    }

    // Applies the patches to real APKs, which are not in the repository:
    //   ./gradlew :patches:apkTest -Pmorphe.apks=instagram=<base.apk or .apkm>,reddit=<...>
    // Add -Pmorphe.isolated=true to also apply each patch on its own.
    register<Test>("apkTest") {
        description = "Applies the patches to the APKs passed with -Pmorphe.apks."
        group = "verification"

        testClassesDirs = sourceSets["test"].output.classesDirs
        classpath = sourceSets["test"].runtimeClasspath
        useJUnitPlatform { includeTags("apk") }

        maxHeapSize = "8g"
        systemProperty("morphe.apks", providers.gradleProperty("morphe.apks").getOrElse(""))
        systemProperty("morphe.isolated", providers.gradleProperty("morphe.isolated").getOrElse("false"))
        // The APKs are outside Gradle's view, so it cannot tell when a rerun is needed.
        outputs.upToDateWhen { false }
    }
}
