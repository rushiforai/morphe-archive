group = "io.github.globberry"

patches {
    about {
        name = "Morphe Patches"
        description = "A collection of Morphe patches."
        source = "https://github.com/Globberry/morphe-patches"
        author = "Globberry"
        contact = "https://github.com/Globberry"
        website = "https://github.com/Globberry/morphe-patches"
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
