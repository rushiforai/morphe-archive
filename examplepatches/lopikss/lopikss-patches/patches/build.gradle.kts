group = "com.lopikss"

patches {
    about {
        name = "Lopikss Patches"
        description = "Focused, experimental Android game patches."
        source = "https://github.com/lopikss/lopikss-patches"
        author = "Lopikss"
        contact = "https://github.com/lopikss"
        website = "https://github.com/lopikss/lopikss-patches"
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
