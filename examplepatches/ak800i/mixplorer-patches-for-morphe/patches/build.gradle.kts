group = "dev.local.mixplorer"

patches {
    about {
        name = "MiXplorer Sharing Fix"
        description = "Fixes unreadable filesystem paths in externally shared file metadata."
        author = "MiXplorer Sharing Fix contributors"
        source = "https://github.com/ak800i/mixplorer-patches-for-morphe"
        contact = "https://github.com/ak800i/mixplorer-patches-for-morphe/issues"
        website = "https://github.com/ak800i/mixplorer-patches-for-morphe"
        license = "GPLv3"
    }
}

val patchListGenerator = sourceSets.create("patchListGenerator")

dependencies {
    add(patchListGenerator.implementationConfigurationName, libs.morphe.patcher)
    add(patchListGenerator.implementationConfigurationName, libs.gson)
    testImplementation(libs.morphe.patcher)
    testImplementation(platform("org.junit:junit-bom:5.13.4"))
    testImplementation(kotlin("test-junit5"))
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

tasks.test {
    useJUnitPlatform()
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Generate the community catalogue from the current patch bundle."
    group = "build"
    dependsOn("buildAndroid", patchListGenerator.classesTaskName)
    classpath = patchListGenerator.runtimeClasspath
    mainClass.set("dev.local.mixplorer.PatchListGeneratorKt")

    val bundle = layout.buildDirectory.file("libs/patches-${project.version}.mpp")
    val catalogue = rootProject.layout.projectDirectory.file("patches-list.json")
    inputs.file(bundle)
    outputs.file(catalogue)
    args(bundle.get().asFile.absolutePath, catalogue.asFile.absolutePath)
}

tasks.named("publish") {
    dependsOn(tasks.test, "generatePatchesList")
}