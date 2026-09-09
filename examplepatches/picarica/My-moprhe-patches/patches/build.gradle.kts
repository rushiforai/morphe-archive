group = "dev.bucek.affine"

patches {
    about {
        name = "AFFiNE No-GMS Patches"
        description = "Removes Play licensing and automatic Google/Firebase startup from AFFiNE"
        source = "https://github.com/picarica/My-moprhe-patches"
        author = "picarica"
        contact = "https://github.com/picarica/My-moprhe-patches/issues"
        website = "https://github.com/picarica/My-moprhe-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    testImplementation(platform(libs.junit.bom))
    testImplementation(libs.junit.jupiter)
    testRuntimeOnly(libs.junit.platform.launcher)
}

tasks.test {
    useJUnitPlatform()
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Generate patches-list.json from the built MPP"
    dependsOn("buildAndroid")
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
}
