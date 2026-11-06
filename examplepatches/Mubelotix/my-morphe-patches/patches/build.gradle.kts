group = "app.mubelotix"

patches {
    about {
        name = "Mubelotix's Patches"
        description = "Custom patches by Mubelotix, compatible with Morphe"
        source = "https://github.com/Mubelotix/my-morphe-patches"
        author = "Mubelotix"
        contact = "https://github.com/Mubelotix"
        website = "https://github.com/Mubelotix/my-morphe-patches"
        license = "GPLv3"
    }
}

sourceSets {
    main {
        resources {
            srcDir("src/main/kotlin")
            include("**/*.js")
            include("**/*.py")
            include("**/*.mpe")
        }
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch list metadata"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
