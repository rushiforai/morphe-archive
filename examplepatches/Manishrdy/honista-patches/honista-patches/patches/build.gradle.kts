import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import java.util.zip.ZipEntry

group = "local.honista"
patches {
    about {
        name = "Honista Local Patches"
        description = "Tested Honista v13 startup fixes and sponsored-content filtering"
        author = "Local workspace"
        source = "https://github.com/Manishrdy/honista-patches"
        contact = "na"
        website = "https://github.com/Manishrdy/honista-patches"
        license = "Local use; upstream app payload retains its original terms"
    }
}

val assemblePayload by tasks.registering(JavaExec::class) {
    classpath = configurations.getByName("runtimeClasspath")
    mainClass.set("com.android.tools.smali.smali.Main")
    val sources = rootProject.file("payload-smali")
    val output = file("src/main/resources/honista/methods.dex")
    args("assemble", "--api", "28", sources.absolutePath, "--output", output.absolutePath)
    inputs.dir(sources)
    outputs.file(output)
}
tasks.named("processResources") { dependsOn(assemblePayload) }
tasks.named("sourcesJar") { dependsOn(assemblePayload) }

val verifyBundle by tasks.registering(JavaExec::class) {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.VerifyBundleKt")
    maxHeapSize = "6g"
    args(file("build/libs/patches-${project.version}.mpp").absolutePath,
        rootProject.file("../apk/Honista_v13.1__x64.apk").absolutePath,
        rootProject.file("../output/Honista-v13.1-sponsored-filter-fixed.apk").absolutePath,
        rootProject.file("../analysis/morphe-verified").absolutePath,
        "accept", rootProject.file("audit/classes.txt").absolutePath)
}
val verifyRejection by tasks.registering(JavaExec::class) {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.VerifyBundleKt")
    maxHeapSize = "6g"
    args(file("build/libs/patches-${project.version}.mpp").absolutePath,
        rootProject.file("../output/Honista-v13.1-sponsored-filter-fixed.apk").absolutePath,
        rootProject.file("../output/Honista-v13.1-sponsored-filter-fixed.apk").absolutePath,
        rootProject.file("../analysis/morphe-rejected").absolutePath,
        "reject")
}

dependencies { testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2") }

val exportBaseline by tasks.registering(JavaExec::class) {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.ExportBaselineKt")
    args(rootProject.file("../apk/Honista_v13.1__x64.apk").absolutePath,
        rootProject.file("audit/classes.txt").absolutePath,
        file("src/main/resources/honista/baseline.tsv").absolutePath,
        file("src/main/resources/honista/baseline.dex").absolutePath)
}

val verifyInput by tasks.registering(JavaExec::class) {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.VerifyInputKt")
    maxHeapSize = "3g"
    args(rootProject.file("../apk/Honista_v13.1__x64.apk").absolutePath,
        rootProject.file("audit/classes.txt").absolutePath)
}

val verifyOriginal by tasks.registering(JavaExec::class) {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.VerifyBundleKt")
    maxHeapSize = "6g"
    args(file("build/libs/patches-${project.version}.mpp").absolutePath,
        rootProject.file("../apk/Honista_v13.1__x64.apk").absolutePath,
        "unused", layout.buildDirectory.dir("verify-original").get().asFile.absolutePath, "apply")
}

val verifyReferences by tasks.registering(JavaExec::class) {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.AuditReferencesKt")
    maxHeapSize = "4g"
    args(rootProject.file("../apk/Honista_v13.1__x64.apk").absolutePath,
        file("src/main/resources/honista/methods.dex").absolutePath,
        file("src/main/resources/honista/helpers.dex").absolutePath,
        layout.buildDirectory.file("reference-audit.txt").get().asFile.absolutePath)
}

// Include the SDK and patcher classpath during D8 desugaring. The older plugin's
// default action omits these and warns about Function1/Supplier on Android.
tasks.named("buildAndroid") {
    actions.clear()
    doLast {
        val sdk = System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
            ?: error("Set ANDROID_HOME to an Android SDK containing build-tools and platform android.jar")
        val sdkRoot = file(sdk)
        val tools = sdkRoot.resolve("build-tools").listFiles()!!.filter { it.resolve("d8").isFile }.maxBy { it.name }
        val androidJar = sdkRoot.resolve("platforms").listFiles()!!.filter { it.resolve("android.jar").isFile }.maxBy { it.name }.resolve("android.jar")
        val bundle = tasks.named<Jar>("jar").get().archiveFile.get().asFile
        val inputJar = layout.buildDirectory.file("morphe/patches-input.jar").get().asFile
        inputJar.parentFile.mkdirs()
        ZipOutputStream(inputJar.outputStream()).use { output ->
            ZipFile(bundle).use { original -> original.entries().asSequence().filter { it.name.endsWith(".class") }.forEach { entry ->
                output.putNextEntry(ZipEntry(entry.name))
                original.getInputStream(entry).use { it.copyTo(output) }
                output.closeEntry()
            } }
        }
        val dexZip = layout.buildDirectory.file("morphe/portable-classes.zip").get().asFile
        dexZip.parentFile.mkdirs()
        val command = mutableListOf(tools.resolve("d8").absolutePath, "--release", "--min-api", "26", "--lib", androidJar.absolutePath)
        configurations.getByName("runtimeClasspath").files.forEach {
            command.addAll(listOf("--classpath", it.absolutePath))
        }
        command.addAll(listOf("--output", dexZip.absolutePath, inputJar.absolutePath))
        val process = ProcessBuilder(command).redirectErrorStream(true).start()
        val diagnostics = process.inputStream.bufferedReader().readText()
        if (diagnostics.isNotBlank()) println(diagnostics)
        check(process.waitFor() == 0) { "D8 failed" }
        val temporary = bundle.resolveSibling(bundle.name + ".tmp")
        ZipOutputStream(temporary.outputStream()).use { output ->
            ZipFile(bundle).use { original ->
                original.entries().asSequence().filterNot { it.name.matches(Regex("classes(?:[0-9]+)?\\.dex")) }.forEach { entry ->
                    output.putNextEntry(ZipEntry(entry.name))
                    original.getInputStream(entry).use { it.copyTo(output) }
                    output.closeEntry()
                }
            }
            ZipFile(dexZip).use { dex -> dex.entries().asSequence().forEach { entry ->
                output.putNextEntry(ZipEntry(entry.name))
                dex.getInputStream(entry).use { it.copyTo(output) }
                output.closeEntry()
            } }
        }
        check(bundle.delete() && temporary.renameTo(bundle))
    }
}
val compareCurrentOutput by tasks.registering(JavaExec::class) {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("local.honista.CompareApkKt")
    maxHeapSize = "6g"
    args(rootProject.file("../output/Honista-v13.1-morphe-default-unsigned.apk").absolutePath,
        rootProject.file("../output/Honista-v13.1-sponsored-filter-fixed.apk").absolutePath,
        rootProject.file("audit/classes.txt").absolutePath)
}
