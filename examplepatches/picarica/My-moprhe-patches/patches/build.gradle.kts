group = "dev.bucek.android"

patches {
    about {
        name = "Android No-GMS / No-Play Patches"
        description = "App-specific patches for running AFFiNE and Stick War: Legacy without mandatory Google services"
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

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
