group = "app.consumerclarity"

patches {
    about {
        name = "Consumer Clarity Patches"
        description = "Deterministic sorting and reduced promotional noise for talabat"
        source = "https://github.com/AltF4G0x/consumer-clarity"
        author = "AltF4G0x"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

val ndkHome = System.getenv("ANDROID_NDK_HOME")
val compileNative = tasks.register<Exec>("compileNative") {
    onlyIf { ndkHome != null }
    if (ndkHome != null) {
        commandLine("bash", rootProject.file("native/build.sh").absolutePath, ndkHome)
    }
}

tasks {
    named("processResources") {
        dependsOn(compileNative)
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
