// The app.morphe.patches settings plugin (see settings.gradle.kts) provides
// the real "buildAndroid" task on :patches and wires up the Kotlin/JVM
// plugin, the morphe-patcher dependency, and the extensions merge step by
// convention. Nothing needs to be declared here.

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
