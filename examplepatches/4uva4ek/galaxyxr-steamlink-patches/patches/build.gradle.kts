group = "io.github.4uva4ek"
patches {
    extensionsProjectPath = null
    about {
        name = "Galaxy XR Steam Link Patches"
        description = "4uva4ek's controller, Galaxy XR vendor-driver and OpenXR BOOST patches for Steam Link VR"
        source = "https://github.com/4uva4ek/galaxyxr-steamlink-patches"
        author = "4uva4ek"
        contact = "https://github.com/4uva4ek"
        website = "https://github.com/4uva4ek/galaxyxr-steamlink-patches"
        license = "GPLv3"
    }
}
kotlin { compilerOptions { freeCompilerArgs.add("-Xcontext-parameters") } }
dependencies {
    compileOnly(libs.gson)
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
    runtimeOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
    testImplementation(kotlin("test-junit"))
    testImplementation(libs.gson)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
}
configurations.named("compileClasspath") {
    shouldResolveConsistentlyWith(configurations.getByName("runtimeClasspath"))
}
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
dependencies { patchListGeneratorClasspath(libs.gson) }
tasks.register<JavaExec>("generatePatchesList") {
    dependsOn("buildAndroid")
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
    systemProperty("morphe.patchArchiveDirectory", layout.buildDirectory.dir("libs").get().asFile.absolutePath)
    args("all")
}
tasks.test {
    // Exact-base audits depend on optional external inputs. Never replay cached test verdicts.
    outputs.upToDateWhen { false }
    outputs.cacheIf { false }
    System.getenv("STEAMLINK_APK")?.let { environment("STEAMLINK_APK", it) }
}
listOf("velocity", "throw", "time", "shizuku", "conflict", "driver", "boost", "driverBoost").forEach { scenario ->
    tasks.register<JavaExec>("audit" + scenario.replaceFirstChar { it.uppercase() }) {
        dependsOn("testClasses", "buildAndroid")
        // Load production classes/resources from the actual MPP, never the source build tree.
        classpath = files(sourceSets["test"].output) + configurations["testRuntimeClasspath"]
        mainClass.set("audit.StandaloneApkAudit")
        doFirst {
            val apk = providers.gradleProperty("auditApk").get()
            val output = providers.gradleProperty("auditOutput").get()
            val code = providers.gradleProperty("auditCode").getOrElse("5002527")
            args(apk, layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
                "$output/$scenario", scenario, code)
        }
    }
}
