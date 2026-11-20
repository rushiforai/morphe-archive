group = "com.awt"

patches {
    about {
        name = "AWT-Patches"
        description = "AWT Morphe Patches"
        source = "git@github.com:AWTMODS/AWT-Patches.git"
        author = "AWT"
        website = "https://github.com/AWTMODS/AWT-Patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    // ARSCLib for resource handling; the patches library provides helpers/addResources.
    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")
    implementation(libs.morphe.patches.library)
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