group = "io.github.totsiaw"

patches {
    about {
        name = "Proxma Patches"
        description = "Proxma Patches"
        source = "https://github.com/totsiaw/proxma-patches"
        author = "Proxma"
        contact = ""
        website = ""
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    // Ensure the Android DEX is built when building the MPP.
    // Without buildAndroid, the MPP only contains JVM .class files,
    // which the Morphe Android app cannot load (Android uses DEX format).
    build { dependsOn("buildAndroid") }

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
