group = "0xtalos"
version = "1.2.0"

patches {
    about {
        name = "365Score Patches"
        description = "Morphe patches for 365Score"
        source = "https://github.com/0xtalos/365score-patches"
        author = "0xtalos"
        contact = "na"
        website = "https://github.com/0xtalos/365score-patches"
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
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
        args(project.version.toString())
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
}
