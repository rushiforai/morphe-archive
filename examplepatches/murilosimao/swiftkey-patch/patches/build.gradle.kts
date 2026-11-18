import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins { kotlin("jvm") }
java { sourceCompatibility = JavaVersion.VERSION_11; targetCompatibility = JavaVersion.VERSION_11 }
kotlin { compilerOptions { jvmTarget = JvmTarget.JVM_11; freeCompilerArgs.add("-Xcontext-parameters") } }
dependencies { compileOnly(files(rootProject.extra["desktopJar"])) }
val extensionBundle = project(":extensions:swiftkey").layout.buildDirectory.file("bundle/swiftkey.mpe")
tasks.jar {
    dependsOn(":extensions:swiftkey:bundle")
    from(extensionBundle) { into("extensions") }
    manifest.attributes(mapOf("Name" to "Murilo's SwiftKey Clean Patches", "Version" to project.version,
        "Description" to "Private SwiftKey customisation with local toolbar preferences",
        "Author" to "Murilo; SwiftKey privacy patches adapted from arandomhooman",
        "Source" to "https://github.com/murilosimao/swiftkey-patch",
        "Website" to "https://github.com/murilosimao/swiftkey-patch",
        "License" to "GPLv3", "Patcher-Version" to "2.3.0"))
}
val dexDir = layout.buildDirectory.dir("dex")
val dex by tasks.registering(JavaExec::class) {
    dependsOn(tasks.jar)
    classpath = files(rootProject.extra["d8Jar"]); mainClass = "com.android.tools.r8.D8"
    inputs.file(tasks.jar.flatMap { it.archiveFile }); outputs.dir(dexDir)
    doFirst {
        dexDir.get().asFile.mkdirs()
        args = listOf("--release", "--min-api", "26", "--lib", rootProject.extra["androidJar"].toString(),
            "--classpath", rootProject.extra["desktopJar"].toString(), "--output", dexDir.get().asFile.path,
            tasks.jar.get().archiveFile.get().asFile.path)
    }
}
tasks.register<Jar>("buildAndroid") {
    dependsOn(dex)
    archiveBaseName = "swiftkey-clean-patches"; archiveExtension = "mpp"
    from(zipTree(tasks.jar.get().archiveFile)); from(dexDir)
    manifest.from(tasks.jar.get().manifest)
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}
