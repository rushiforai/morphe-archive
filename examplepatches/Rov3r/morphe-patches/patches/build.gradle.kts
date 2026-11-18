group = "com.rov3r"

patches {
    about {
        name = "Rov3r Patches"
        description = "Android app patches by Rov3r."
        source = "https://github.com/Rov3r/morphe-patches"
        author = "Rov3r"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Makes Gson available to the patch-list generator without bundling it.
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
