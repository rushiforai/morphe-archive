group = "app.error404rt.patches"

patches {
    about {
        name = "Anixart patches"
        description = "Смотрите аниме без рекламы и отвлекающих факторов."
        source = "https://github.com/Error404rt/Anixart-patches"
        author = "Error404rt"
        contact = "https://github.com/Error404rt"
        website = "https://github.com/Error404rt/Anixart-patches"
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
