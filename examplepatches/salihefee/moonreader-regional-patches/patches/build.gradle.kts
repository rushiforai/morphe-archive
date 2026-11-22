import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import java.security.MessageDigest
import java.net.URI

plugins { kotlin("jvm") version "2.4.21" }
group = "local.moonreader"
version = "1.0.1"
repositories { mavenCentral() }

// Public release contains the exact patcher API and its dependencies, so no GitHub PAT is needed.
val desktopJar = rootProject.layout.projectDirectory.file("tools/morphe-desktop-2.2.0-all.jar")
val downloadTools = tasks.register("downloadTools") {
    outputs.file(desktopJar)
    doLast {
        val target = desktopJar.asFile
        target.parentFile.mkdirs()
        if (!target.isFile) URI("https://github.com/MorpheApp/morphe-desktop/releases/download/v2.2.0/morphe-desktop-2.2.0-all.jar").toURL().openStream().use { input ->
            target.outputStream().use { input.copyTo(it) }
        }
        val digest = MessageDigest.getInstance("SHA-256").digest(target.readBytes()).joinToString("") { "%02x".format(it) }
        require(digest == "5ca0320ee05481df1ae3afd2f003bba3ff994d11d1f66ae48811ced71355e4fe") { "Morphe Desktop dependency checksum mismatch" }
    }
}

dependencies { compileOnly(files(desktopJar)); testImplementation(files(desktopJar)); testImplementation(platform("org.junit:junit-bom:5.12.2")); testImplementation(kotlin("test-junit5")); testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine"); testRuntimeOnly("org.junit.platform:junit-platform-launcher") }
java { sourceCompatibility = JavaVersion.VERSION_11; targetCompatibility = JavaVersion.VERSION_11 }
kotlin { compilerOptions { jvmTarget.set(JvmTarget.JVM_11) } }
tasks.compileKotlin { dependsOn(downloadTools) }
tasks.test { dependsOn(downloadTools); useJUnitPlatform() }

tasks.jar {
    archiveBaseName.set("moonreader-regional-patches")
    manifest.attributes(mapOf(
        "Name" to "Moon Reader Regional Patches", "Version" to project.version,
        "Description" to "Remove locale and fixed expiration restrictions in regional Moon+ Reader Pro builds",
        "Author" to "salihefee", "Source" to "https://github.com/salihefee/moonreader-regional-patches", "License" to "GPLv3", "Patcher-Version" to "2.4.0"
    ))
    from(rootProject.file("LICENSE"))
    from(rootProject.file("NOTICE"))
}

val dexOutput = layout.buildDirectory.dir("android-dex")
val dexBundle = tasks.register<JavaExec>("dexBundle") {
    dependsOn(tasks.jar)
    val sdk = providers.environmentVariable("ANDROID_SDK_ROOT").orElse(providers.environmentVariable("ANDROID_HOME"))
    val tools = providers.environmentVariable("ANDROID_BUILD_TOOLS").orElse("35.0.0")
    classpath = files(sdk.map { "$it/build-tools/${tools.get()}/lib/d8.jar" })
    mainClass.set("com.android.tools.r8.D8")
    inputs.file(tasks.jar.flatMap { it.archiveFile })
    outputs.dir(dexOutput)
    doFirst {
        require(sdk.isPresent) { "Set ANDROID_SDK_ROOT to an Android SDK with build-tools 35.0.0 (or set ANDROID_BUILD_TOOLS)." }
        dexOutput.get().asFile.mkdirs()
        args("--release", "--min-api", "26", "--classpath", desktopJar.asFile.absolutePath,
            "--output", dexOutput.get().asFile.absolutePath, tasks.jar.get().archiveFile.get().asFile.absolutePath)
    }
}

tasks.register<Jar>("buildAndroid") {
    dependsOn(dexBundle)
    archiveBaseName.set("moonreader-regional-patches")
    archiveExtension.set("mpp")
    destinationDirectory.set(layout.buildDirectory.dir("libs"))
    from(zipTree(tasks.jar.get().archiveFile.get())) { exclude("META-INF/MANIFEST.MF") }
    from(dexOutput)
    manifest.from(tasks.jar.get().manifest)
}
