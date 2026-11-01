group = "app.kirklandpickles"

patches {
    about {
        name = "offline-gboard"
        description = "Offline patches for Gboard."
        source = "git@github.com:Kirkland-Pickles/Gboard-offline-morphe.git"
        author = "Kirkland-Pickles"
        contact = "https://github.com/Kirkland-Pickles"
        website = "https://github.com/Kirkland-Pickles/Gboard-offline-morphe"
        license = "GNU General Public License v3.0"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
