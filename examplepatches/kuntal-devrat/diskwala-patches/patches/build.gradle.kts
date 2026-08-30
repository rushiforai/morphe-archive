group = "app.diskwala"

patches {
    about {
        name = "DiskWala Patches"
        description = "Morphe patches for DiskWala - Disable ads & Remove forced update screen"
        source = "git@github.com:kuntal-devrat/diskwala-patches.git"
        author = "kuntal-devrat"
        contact = "na"
        website = "https://www.diskwala.com"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation("app.morphe:morphe-patches-library:1.6.2")
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
