group = "app.revanced"

patches {
    about {
        name = "rif patches"
        description = "Patches for rif is fun (Reddit is Fun). Use together with Patcheddit."
        source = "https://github.com/MojiRS/morphe-rif-patches"
        author = "Moji"
        contact = "contact@moji.tel"
        website = "https://github.com/MojiRS/morphe-rif-patches"
        license = "GNU General Public License v3.0"
    }
}

// patches-list.json (the file morphe-patches.software and other tools read), generated like
// morphe-patches-template does, from the built .mpp. The generator is its own source set so that it and gson
// are not part of the shipped .mpp. dev/morphe-build.sh runs this after buildAndroid; the output lands at the
// repository root.
val patchList: SourceSet = sourceSets.create("patchList") {
    compileClasspath += sourceSets["main"].compileClasspath
}

dependencies {
    "patchListCompileOnly"(libs.gson)
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    patchListGeneratorClasspath(libs.gson)
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Writes ../patches-list.json from the built .mpp"
    dependsOn("buildAndroid")

    classpath = patchList.output + sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
    val mppName = "patches-${project.version}.mpp"
    args(layout.buildDirectory.file("libs/$mppName").get().asFile, rootProject.file("patches-list.json"))
}
