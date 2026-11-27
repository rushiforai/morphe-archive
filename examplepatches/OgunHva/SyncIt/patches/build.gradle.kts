group = "app.syncit"

patches {
    about {
        name = "SyncIt"
        description = "Morphe patches for Sync for Reddit"
        source = "https://github.com/OgunHva/SyncIt"
        author = "OgunHva"
        contact = "https://github.com/OgunHva/SyncIt/issues"
        website = "https://github.com/OgunHva/SyncIt"
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

        // buildAndroid, not build: the plain jar has no classes.dex, and writing the list
        // from it would leave a bundle that Manager cannot load on Android.
        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
