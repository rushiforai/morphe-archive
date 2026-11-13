group = "app.hxmst"

patches {
    about {
        name = "Hxmst Morphe Patches"
        description = "A collection of general patches for Morphe"
        source = "https://github.com/hxmst/morphe-patches.git"
        author = "hxmst"
        contact = "na"
        website = "https://github.com/hxmst/morphe-patches.git"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
}

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    compilerOptions.freeCompilerArgs.add("-Xcontext-parameters")
}

tasks {
    register<JavaExec>("debugFingerprintCheck") {
        description = "Run fingerprints against the target APK"

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.DebugFingerprintCheckKt")
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
