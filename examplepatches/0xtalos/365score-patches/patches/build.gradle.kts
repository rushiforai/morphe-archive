group = "0xtalos"
version = "1.4.0"

patches {
    about {
        name = "Vibe Patches"
        description = "Morphe patches for 365Scores and HDO Box"
        source = "https://github.com/0xtalos/vibe-patches"
        author = "0xtalos"
        contact = "na"
        website = "https://github.com/0xtalos/vibe-patches"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")
    compileOnly(libs.morphe.patcher)

    // Used by JsonGenerator.
    implementation(libs.gson)

    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testImplementation(libs.morphe.patcher)
    testImplementation("com.github.REAndroid:ARSCLib:a28c6fb2a7")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
        args(project.version.toString())
    }

    test {
        useJUnitPlatform()
        maxHeapSize = "4g"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
}
