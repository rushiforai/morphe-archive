group = "app.morphe.patches"

patches {
    about {
        name = "@alaeddinefaouzi"
        description = "Curated patches for Android apps and games by @alaeddinefaouzi."
        source = "https://github.com/alaeddinefaouzi/morphe-patches"
        author = "alaeddinefaouzi"
        contact = "https://github.com/alaeddinefaouzi/morphe-patches/issues"
        website = "https://github.com/alaeddinefaouzi/morphe-patches"
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
        dependsOn(classes)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
