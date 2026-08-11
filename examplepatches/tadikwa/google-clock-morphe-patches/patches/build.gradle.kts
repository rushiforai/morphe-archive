group = "app.tadikwa.googleclockmorphe"

patches {
    about {
        name = "Tadikwa Google Clock patches"
        description = "Morphe patches for Google Clock, including support for Morphe-patched YouTube Music alarms."
        source = "https://github.com/tadikwa/google-clock-morphe-patches"
        author = "tadikwa"
        contact = "na"
        website = "https://github.com/tadikwa/google-clock-morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
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

    publish {
        dependsOn("generatePatchesList")
    }
}
