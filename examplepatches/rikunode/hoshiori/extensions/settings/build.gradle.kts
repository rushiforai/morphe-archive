android {
    namespace = "dev.rikunode.settings"
}
extension {
    name = "extensions/settings.mpe"
}

// Compile against the host fragment ABI without packaging or replacing it.
val compileHostStub by tasks.registering(JavaCompile::class) {
    source = fileTree("compile-stubs") { include("**/*.java") }
    classpath = files()
    destinationDirectory.set(layout.buildDirectory.dir("host-stubs/classes"))
    options.release.set(8)
}
val hostStubJar by tasks.registering(Jar::class) {
    from(compileHostStub.flatMap { it.destinationDirectory })
    archiveFileName.set("hatena-fragment-compile-only.jar")
    destinationDirectory.set(layout.buildDirectory.dir("host-stubs"))
}
dependencies {
    compileOnly(files(hostStubJar))
}
