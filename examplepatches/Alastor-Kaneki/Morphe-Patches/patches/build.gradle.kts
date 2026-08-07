import org.gradle.api.tasks.Exec

group = "dev.alastorkaneki"

val gxIconPackResourceDirectory = layout.projectDirectory.dir("src/main/resources/gx-icon-pack")
val prepareGxIconPack by tasks.registering(Exec::class) {
    group = "build setup"
    description = "Fetches and verifies Opera Software's GX Icon Pack v1.7."
    workingDir(rootProject.projectDir)
    commandLine("python3", rootProject.file("tools/prepare-gx-icon-pack.py").absolutePath)
    inputs.file(rootProject.file("tools/prepare-gx-icon-pack.py"))
    outputs.files(
        gxIconPackResourceDirectory.file("index.txt"),
        gxIconPackResourceDirectory.file("source.json"),
        gxIconPackResourceDirectory.file("gx-icon-pack-basic.zip"),
        gxIconPackResourceDirectory.file("gx-icon-pack-holo.zip"),
        gxIconPackResourceDirectory.file("gx-icon-pack-holo-gx.zip"),
        gxIconPackResourceDirectory.file("gx-icon-pack-neon.zip")
    )
}

tasks.matching { it.name == "processResources" }.configureEach {
    dependsOn(prepareGxIconPack)
}

patches {
    about {
        name = "Alastor Kaneki Morphe Patches"
        description = "Morphe patches for Suno timestamped-lyrics export, a standalone Opera GX launcher icon selector, Opera GX raw mod downloads, and a cloneable Chrome Android Material You userscript manager with a Violentmonkey-derived parser and Greasy Fork/Sleazy Fork support."
        source = "https://github.com/Alastor-Kaneki/Morphe-Patches"
        author = "Alastor Kaneki"
        contact = "https://github.com/Alastor-Kaneki"
        website = "https://github.com/Alastor-Kaneki/Morphe-Patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}
