import org.gradle.language.jvm.tasks.ProcessResources

val ricardo = rootProject.layout.projectDirectory.dir("extensions/ricardo")
val libgdx = ricardo.dir("native/libgdx")
val ndkRevision = "27.2.12479018"
val ndkHome = providers.environmentVariable("ANDROID_NDK_HOME").orElse(
    providers.environmentVariable("ANDROID_HOME").map { "$it/ndk/$ndkRevision" }
)
val nativeRevision = providers.exec {
    commandLine("git", "-C", libgdx.asFile.absolutePath, "rev-parse", "HEAD")
}.standardOutput.asText.map { it.trim() }
val ricardoResources = layout.buildDirectory.dir("generated/ricardoResources")

val buildRicardoNative = tasks.register<Exec>("buildRicardoNative") {
    description = "Build Ricardo's libGDX 1.1.0 ARM64 libraries from source."
    inputs.files(fileTree(libgdx) {
        include("gdx/jni/**/*.c", "gdx/jni/**/*.cpp", "gdx/jni/**/*.h")
        include("extensions/gdx-box2d/gdx-box2d/jni/**/*.cpp")
        include("extensions/gdx-box2d/gdx-box2d/jni/**/*.h")
        include("LICENSE")
    }).withPathSensitivity(PathSensitivity.RELATIVE)
    inputs.files(ricardo.file("build.py"), ricardo.file("LICENSE-libgdx.txt"))
        .withPathSensitivity(PathSensitivity.RELATIVE)
    inputs.property("sourceRevision", nativeRevision)
    inputs.property("ndkRevision", ndkRevision)
    inputs.file(ndkHome.map { file("$it/source.properties") })
    outputs.dir(ricardoResources.map { it.dir("ricardo") })
    doFirst {
        commandLine(
            "python3", ricardo.file("build.py").asFile,
            "--ndk", ndkHome.get(),
            "--output", ricardoResources.get().dir("ricardo").asFile
        )
    }
}

extensions.configure<SourceSetContainer> {
    named("main") {
        // Every resource consumer, including sourcesJar, needs the native build output.
        resources.srcDir(files(ricardoResources).builtBy(buildRicardoNative))
    }
}

tasks.named<ProcessResources>("processResources") {
    exclude("**/.objects/**")
}
