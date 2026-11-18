patches {
    about {
        name = "Kero309x Patches"
        description = "Independent, clean-room patches for the Morphe framework, built for multiple applications. Current targets: Anghami 8.0.28 and Ana Vodafone 2026.11.1."
        author = "Kero309x"
        // The plugin writes every one of these into the bundle manifest and fails
        // on a null value, so none of them may be omitted. A profile URL is used
        // here to avoid publishing a personal address; replace it with a contact
        // address if you want one in the manifest.
        contact = "https://github.com/Kero309x"
        source = "https://github.com/Kero309x/Kero309x-Patches"
        website = "https://github.com/Kero309x/Kero309x-Patches"
        license = "GPL-3.0-only"
    }
}

dependencies {
    // Needed only to name the coroutines type the framework's patch runner
    // returns. The patcher already ships it at run time, so nothing is bundled
    // into the patch file and no code of ours is compiled against it.
    testCompileOnly(libs.kotlinx.coroutines.core)

    // Test-only assertions for the registry checks. Test scope never reaches the
    // bundle.
    testImplementation(libs.kotlin.test)
}

tasks.withType<Test>().configureEach {
    // The registry test reads the behaviour specs from the repository, so it must
    // run from the repository root rather than from this module.
    workingDir = rootDir
}

// Captured outside the task block so the configuration cache stores values rather
// than references to this build script.
val verifyApkPath = providers.gradleProperty("apk").orElse("")
val verifyOutPath = providers.gradleProperty("out").orElse("")
val verifyRuntimeClasspath = sourceSets["test"].runtimeClasspath

/**
 * Regenerates `patches-list.json` at the repository root.
 *
 * The manager reads `patches-bundle.json`; community indexes read this file to
 * build their application and patch tables. Both are generated from the same
 * catalogue, so an index cannot advertise a patch the bundle does not ship.
 * Lives in the test source set, like [verifyPatches], because it is tooling that
 * must not be bundled into the patch file.
 */
tasks.register<JavaExec>("generatePatchesList") {
    group = "documentation"
    description = "Regenerates patches-list.json for third-party patch indexes."

    dependsOn(tasks.named("testClasses"))
    classpath = verifyRuntimeClasspath
    mainClass.set("app.keropatches.tools.PatchListGeneratorKt")
    args = listOf(
        project.version.toString(),
        rootProject.layout.projectDirectory.file("patches-list.json").asFile.absolutePath,
    )
}

// Every bundle build refreshes the index file, so it cannot drift from the
// catalogue. CI then fails when the committed file is stale.
tasks.named("buildAndroid") {
    dependsOn("generatePatchesList")
}

/**
 * Applies every patch of the supplied APK's application so a fingerprint that no
 * longer resolves fails here instead of at a user's patch run.
 *
 * The check is deliberately not part of `build`: it needs a proprietary APK that
 * is never committed, so a checkout without one must still compile.
 */
tasks.register<JavaExec>("verifyPatches") {
    group = "verification"
    description = "Runs every patch for the supplied APK's application against that unmodified APK (-Papk=<path>)."

    classpath = verifyRuntimeClasspath
    mainClass.set("app.keropatches.verification.VerifyPatchesKt")
    // Read eagerly: JavaExec does not resolve a Provider passed to systemProperty.
    systemProperty("keropatches.apk", verifyApkPath.get())
    systemProperty("keropatches.out", verifyOutPath.get())
}
