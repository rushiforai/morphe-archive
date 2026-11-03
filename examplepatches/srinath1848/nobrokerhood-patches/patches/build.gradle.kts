
group = "community.nobrokerhood"

patches {
    about {
        name = "NoBrokerHood Community Patches"
        description = "Experimental ad-removal patches for NoBrokerHood 3.6.6"
        source = "https://github.com/srinath1848/nobrokerhood-patches"
        author = "Community"
        contact = "na"
        website = "https://github.com/srinath1848/nobrokerhood-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath =
    configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath =
            sourceSets["main"].runtimeClasspath +
            patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
