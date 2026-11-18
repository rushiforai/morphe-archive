group = "app.thefit"

patches {
    about {
        name = "TheFit Morphe Patches"
        description = "Ad-removal Morphe patches for Da Fit (com.crrepa.band.dafit)"
        source = "git@github.com:Sayan201/TheFit.git"
        author = "Sayan201"
        contact = "https://github.com/Sayan201/TheFit"
        website = "https://github.com/Sayan201/TheFit"
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
