group = "app.noam"

patches {
    about {
        name = "Morphe Spotify Patches"
        description = "Morphe patches for Spotify: a Morphe settings tile and local files served from a Nextcloud/WebDAV folder."
        source = "git@github.com:ImNoammm/morphe-spotify-patches.git"
        author = "ImNoammm"
        contact = "na"
        website = "https://github.com/ImNoammm/morphe-spotify-patches"
        license = "GNU General Public License v3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
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
