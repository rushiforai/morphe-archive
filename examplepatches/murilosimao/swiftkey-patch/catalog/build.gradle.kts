plugins { kotlin("jvm") }
dependencies {
    implementation(files(rootProject.extra["desktopJar"]))
    implementation("com.google.code.gson:gson:2.15.0")
}
tasks.register<JavaExec>("generatePatchesList") {
    dependsOn(":patches:buildAndroid", tasks.classes)
    classpath = sourceSets.main.get().runtimeClasspath
    mainClass = "util.PatchListGeneratorKt"
    workingDir = rootProject.projectDir
    val bundle = rootProject.file("patches/build/libs/swiftkey-clean-patches-${project.version}.mpp")
    val catalog = rootProject.file("patches-list.json")
    inputs.file(bundle); inputs.file(rootProject.file("patches-bundle.json")); outputs.file(catalog)
    args(bundle.absolutePath, catalog.absolutePath)
}
