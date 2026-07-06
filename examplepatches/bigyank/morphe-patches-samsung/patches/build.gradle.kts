group = "app.bigyank"

patches {
    about {
        name = "Bigyank Samsung Patches"
        description = "Morphe patches for Samsung Health on Knox-tripped Galaxy devices"
        source = "git@github.com:bigyank/morphe-patches-samsung.git"
        author = "bigyank"
        contact = "https://github.com/bigyank/morphe-patches-samsung/issues"
        website = "https://github.com/bigyank/morphe-patches-samsung"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-receivers")
    }
}

dependencies {
    implementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}