group = "dev.rikunode.futatabi"
patches {
    about {
        name = "futatabi"
        description = "Morphe patches for futatter 3.1.1"
        source = "https://github.com/rikunode/futatabi"
        author = "rikunode"
        contact = "https://github.com/rikunode"
        website = "https://github.com/rikunode/futatabi"
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
        dependsOn("buildAndroid")
        systemProperty("patchesVersion", project.version.toString())
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish { dependsOn("generatePatchesList") }
}
