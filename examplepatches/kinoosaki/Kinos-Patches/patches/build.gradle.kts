group = "app.template"

patches {
    about {
        name = "Kino's Patches"
        description = "Tasker patches for Morphe"
        source = "https://github.com/kinoosaki/Kinos-Patches"
        author = "kinoosaki"
        contact = "https://kinosaki.in"
        website = "https://morphe.software/add-source?github=kinoosaki/Kinos-Patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Provides app.morphe.util helpers (returnEarly, findMutableMethodOf, getReference, etc.)
    // used by patches ported from Heval-Patches.
    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        // Read exactly patches-<version>.mpp, not a stale bundle left in build/libs.
        systemProperty("patches.version", project.version.toString())
        systemProperty("patches.list.output", rootProject.file("patches-list.json").absolutePath)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

// Smoke-test harness: applies patches to a real APK and asserts on the emitted bytecode.
// Each test reads its APK from the gitignored `apks/` directory and skips (rather than fails)
// when that APK is absent, so CI stays green without the multi-hundred-MB inputs.
// See patches/src/test/kotlin/.
dependencies {
    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks.test {
    useJUnitPlatform {
        excludeTags("smoke")
    }
}

tasks.register<Test>("taskerSmokeTest") {
    description = "Applies the Tasker patches to the local APK fixture and checks emitted bytecode"
    group = "verification"
    testClassesDirs = sourceSets["test"].output.classesDirs
    classpath = sourceSets["test"].runtimeClasspath
    dependsOn("testClasses")
    useJUnitPlatform {
        includeTags("smoke")
    }
    dependsOn("buildAndroid")
    systemProperty("patches.version", project.version.toString())
    inputs.files(layout.buildDirectory.file("libs/patches-${project.version}.mpp"))
        .withPropertyName("patchBundle")
        .withPathSensitivity(PathSensitivity.RELATIVE)
    inputs.files(rootProject.fileTree("apks") { include("**/base.apk") })
        .withPropertyName("apkFixtures")
        .withPathSensitivity(PathSensitivity.RELATIVE)
    // The smoke test loads a multidex APK and parses every emitted dex in memory.
    maxHeapSize = "4g"
    // Fingerprints are top-level vals; isolate smoke-test classes so cached matches cannot
    // leak between patching sessions.
    forkEvery = 1
}
