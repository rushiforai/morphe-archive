group = "dev.rikunode.pupil"

patches {
    about {
        name = "rikunode Pupil patches"
        description = "Minimal patches for the Pupil Android gallery reader"
        source = "https://github.com/rikunode/pupil-morphe-patches"
        author = "rikunode"
        contact = "https://github.com/rikunode"
        website = "https://github.com/rikunode/pupil-morphe-patches"
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
        description = "Generate Morphe patch metadata"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish { dependsOn("generatePatchesList") }
}
