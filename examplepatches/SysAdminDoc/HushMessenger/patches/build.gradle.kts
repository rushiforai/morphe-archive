import org.gradle.jvm.tasks.Jar

group = "com.sysadmindoc.hushmessenger"

patches {
    about {
        name = "HushMessenger"
        description = "Messenger patches with exact-version compatibility checks."
        source = "https://github.com/SysAdminDoc/HushMessenger"
        author = "SysAdminDoc"
        contact = "https://github.com/SysAdminDoc/HushMessenger/issues"
        website = "https://github.com/SysAdminDoc/HushMessenger"
        license = "GPLv3"
    }
}

dependencies {
    testImplementation(kotlin("test-junit5"))
    testImplementation("org.junit.jupiter:junit-jupiter:5.13.4")
    // Reuse the patcher's JSON version only in local tooling and tests.
    testImplementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.1")
}

tasks.test {
    useJUnitPlatform()
}

tasks.named<Jar>("jar") {
    manifest.attributes["Timestamp"] = providers.gradleProperty("bundleTimestampMillis").get()
    from(listOf(rootProject.file("LICENSE"), rootProject.file("NOTICE"))) { into("META-INF") }
}

dependencyLocking {
    lockAllConfigurations()
}

for ((taskName, mode) in mapOf("generatePatchCatalog" to "generate", "checkPatchCatalog" to "check")) {
    tasks.register<JavaExec>(taskName) {
        group = "verification"
        description = "$mode the public catalog against the built Android patch bundle."
        dependsOn("buildAndroid", "testClasses")
        // Exclude main output: the loader must read the MPP, never stale loose classes.
        classpath = sourceSets["test"].output + configurations["testRuntimeClasspath"]
        mainClass.set("app.hushmessenger.tools.CatalogTool")
        args(mode, tasks.named<Jar>("jar").get().archiveFile.get().asFile.absolutePath, rootDir.absolutePath)
    }
}

tasks.check { dependsOn("checkPatchCatalog") }

tasks.register<Exec>("verifyReleaseMetadata") {
    group = "verification"
    description = "Check the bundle hash and all public release versions before publication."
    dependsOn("checkPatchCatalog")
    workingDir(rootDir)
    commandLine("python", "scripts/check_release.py")
}
