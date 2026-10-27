group = "app.template"

patches {
    about {
        name = "Heval's Morphe Patches"
        description = "Patches for apps I like"
        source = "https://github.com/heval99/Heval-Morphe-Patches"
        author = "heval99"
        contact = "https://github.com/heval99"
        website = "https://morphe.software/add-source?github=heval99/Heval-Morphe-Patches"
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
    useJUnitPlatform()
    // Smoke tests load the built bundle and gitignored APKs at runtime, outside the Java
    // source set. Include both in Gradle's cache key so a changed/added/removed fixture or
    // patch bundle cannot reuse a result from another input. A plain :patches:test also
    // builds the bundle before the harness selects it. The harness loads exactly
    // patches-<version>.mpp (util.selectPatchBundle), so stale bundles are not inputs.
    dependsOn("buildAndroid")
    systemProperty("patches.version", project.version.toString())
    inputs.files(layout.buildDirectory.file("libs/patches-${project.version}.mpp"))
        .withPropertyName("patchBundle")
        .withPathSensitivity(PathSensitivity.RELATIVE)
    inputs.files(rootProject.fileTree("apks") { include("*/base.apk") })
        .withPropertyName("apkFixtures")
        .withPathSensitivity(PathSensitivity.RELATIVE)
    // The smoke tests load the full APK (up to ~390 MB, multidex) and parse every emitted
    // dex in memory.
    maxHeapSize = "4g"
}
