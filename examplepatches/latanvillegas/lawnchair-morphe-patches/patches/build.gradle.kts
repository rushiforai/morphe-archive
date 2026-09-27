group = "com.latanvillegas.lawnchair"

patches {
    about {
        name = "Lawnchair Morphe Patches"
        description = "Personalized Morphe patches for Lawnchair"
        source = "https://github.com/latanvillegas/lawnchair-morphe-patches"
        author = "latanvillegas"
        contact = "https://github.com/latanvillegas"
        website = "https://github.com/latanvillegas/lawnchair-morphe-patches"
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
