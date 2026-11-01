plugins { base }

// Public, hash-pinned toolchains avoid requiring a GitHub Packages PAT.
// Compile against the Morphe API distributed with Desktop; building does not execute its APK patcher.
val buildAndroid by tasks.registering(Exec::class) {
    description = "Compile and test the JVM+DEX .mpp bundle."
    group = "build"
    commandLine("python3", "scripts/build.py")
}
tasks.named("build") { dependsOn(buildAndroid) }
tasks.register("generatePatchesList") { dependsOn(buildAndroid) }
