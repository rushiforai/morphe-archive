import org.gradle.api.tasks.compile.JavaCompile
import org.gradle.jvm.tasks.Jar

extension { name = "extensions/videoland.mpe" }
android { namespace = "nl.johninnl.patches.videoland" }

// Pure Java helpers use the app's pinned runtime/ABI. Do not inject another
// un-obfuscated Kotlin standard library alongside its existing implementation.
configurations.configureEach { exclude(group = "org.jetbrains.kotlin") }

// These declarations describe only the pinned app ABI. They are compile-only:
// no vendor/stub class is included in the extension DEX.
val compileAppAbi = tasks.register<JavaCompile>("compileAppAbi") {
    source(fileTree("stubs") { include("**/*.java") })
    classpath = files() // ABI declarations reference JDK types and one another only.
    destinationDirectory.set(layout.buildDirectory.dir("app-abi/classes"))
    sourceCompatibility = "1.8"
    targetCompatibility = "1.8"
}
val appAbi = tasks.register<Jar>("appAbi") {
    dependsOn(compileAppAbi)
    from(compileAppAbi.flatMap { it.destinationDirectory })
    // macOS folds Bv/ and bv/ on disk; retain the declared package in the JAR.
    eachFile { if (path == "bv/x.class") path = "Bv/x.class" }
    inputs.property("abiPackageCasing", 1)
    archiveFileName.set("videoland-compile-only-abi.jar")
    destinationDirectory.set(layout.buildDirectory.dir("app-abi"))
}
dependencies { compileOnly(files(appAbi)) }
