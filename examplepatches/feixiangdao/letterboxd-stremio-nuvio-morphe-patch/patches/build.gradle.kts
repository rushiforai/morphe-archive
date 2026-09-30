group = "app.playerbridge"

patches {
    about {
        name = "Stremio + Nuvio Bridge"
        description = "Adds separate Stremio and Nuvio buttons to supported film/TV apps."
        source = "https://github.com/feixiangdao/letterboxd-stremio-nuvio-morphe-patch"
        author = "feixiangdao"
        contact = "https://github.com/feixiangdao"
        website = "https://github.com/feixiangdao/letterboxd-stremio-nuvio-morphe-patch"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}


// Diagnostic generator copied from the upstream template.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks.register<JavaExec>("generatePatchesList") {
    dependsOn("build")
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
}
