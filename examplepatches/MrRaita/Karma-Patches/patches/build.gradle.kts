group = "dev.karmapatches"

patches {
    about {
        name = "Karma Patches"
        description = "Yamasını bulamadığım uygulamalar için AI ile hazırlayıp yayınladığım yama deposu."
        source = "https://github.com/MrRaita/Karma-Patches"
        author = "MrRaita"
        contact = "https://github.com/MrRaita"
        website = "https://github.com/MrRaita/Karma-Patches"
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
