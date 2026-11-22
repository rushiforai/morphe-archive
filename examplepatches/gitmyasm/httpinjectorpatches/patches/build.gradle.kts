group = "app.gitmyasm"

patches {
    about {
        name = "HTTP Injector Pro"
        description = "Pro patch for HTTP Injector 6.5.0"
        source = "https://github.com/gitmyasm/HttpInjectorPatches"
        author = "gitmyasm"
        contact = "na"
        website = "na"
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
