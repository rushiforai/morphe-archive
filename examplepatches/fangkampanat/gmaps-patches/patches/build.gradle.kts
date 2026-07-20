group = "app.morphe"

patches {
    about {
        name = "Maps Patches"
        description = "Google Maps MicroG patch for ReVanced GmsCore, applied with Morphe Manager"
        source = "https://github.com/fangkampanat/gmaps-patches"
        author = "fangkampanat"
        contact = "https://github.com/fangkampanat/gmaps-patches/issues"
        website = "https://github.com/fangkampanat/gmaps-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

// Separate configuration so Gson is available when generating patches-list.json
// without bundling it into the patch artifact.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build the patch bundle and generate patches-list.json"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(project.version.toString())
    }
}
