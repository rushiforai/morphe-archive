group = "app.wagg13"

patches {
    about {
        name = "Wagg13Patch_Morphe"
        description = "Modding apps i like "
        source = "git@github.com:WaggBR/Wagg13Patch_Morphe.git"
        author = "Wagg13"
        contact = "t.me/wagg13"
        website = "https://github.com/WaggBR"
        license = "GPLv3"
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
        // The generator reads patches/build/libs/*.mpp, so the bundle has to be built first.
        dependsOn("buildAndroid")
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}