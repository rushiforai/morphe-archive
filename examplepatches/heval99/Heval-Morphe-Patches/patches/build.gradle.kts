group = "app.template"

patches {
    about {
        name = "Heval's Morphe Patches"
        description = "Patches for apps I like"
        source = "https://github.com/heval99/morphe-patches"
        author = "heval99"
        contact = "https://github.com/heval99"
        website = "https://morphe.software/add-source?github=heval99/morphe-patches"
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
    // The smoke tests load a ~100 MB multidex APK and parse every emitted dex in memory.
    maxHeapSize = "2g"
}
