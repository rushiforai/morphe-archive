import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins { kotlin("jvm") }
group = "app.airofit"
version = rootProject.version
repositories { mavenCentral(); google() }
val morpheDesktop = rootProject.files("tooling/lib/morphe-desktop-1.16.0-all.jar")
val d8 = configurations.create("d8")

dependencies {
    compileOnly(morpheDesktop)
    d8("com.android.tools:r8:9.4.24")
}
kotlin { compilerOptions { jvmTarget.set(JvmTarget.JVM_11) } }
java { sourceCompatibility = JavaVersion.VERSION_11; targetCompatibility = JavaVersion.VERSION_11 }

val jvmBundle = tasks.named<Jar>("jar") {
    archiveBaseName.set("airofit-patches-jvm")
    manifest.attributes(
        "Name" to "Airofit experimental Pro 2 name-gate patches",
        "Description" to "Experimental discovery/factory name gates only; BLE protocol compatibility not proven.",
        "Version" to project.version.toString(),
        "Patcher-Version" to "1.14.0",
        "License" to "GPLv3"
    )
}
val dexDir = layout.buildDirectory.dir("morphe/dex")
val dex = tasks.register<JavaExec>("dex") {
    dependsOn(jvmBundle)
    classpath = d8
    mainClass.set("com.android.tools.r8.D8")
    inputs.file(jvmBundle.flatMap { it.archiveFile })
    outputs.dir(dexDir)
    doFirst {
        dexDir.get().asFile.mkdirs()
        args("--release", "--min-api", "26", "--classpath", morpheDesktop.singleFile.absolutePath,
            "--output", dexDir.get().asFile.absolutePath,
            jvmBundle.get().archiveFile.get().asFile.absolutePath)
    }
}
// Official format: JAR classes + manifest + classes.dex, with .mpp extension.
tasks.register<Zip>("buildAndroid") {
    dependsOn(dex)
    archiveBaseName.set("airofit-patches")
    archiveExtension.set("mpp")
    destinationDirectory.set(layout.buildDirectory.dir("libs"))
    from(jvmBundle.map { zipTree(it.archiveFile) })
    from(dexDir)
}
