group = "app.keyflow"

patches {
    about {
        name = "Keyflow Patches"
        description = "Patches for Keyflow (com.angkin.keyflow) 1.5.8: PairIP neutering, signer-identity matching, and Pro unlock."
        source = "https://github.com/Globberry/morphe-patches"
        author = "Keyflow Patches"
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
