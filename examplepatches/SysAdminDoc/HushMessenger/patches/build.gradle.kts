import org.apache.tools.ant.filters.FixCrLfFilter
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

val nativeFixtureRoot = providers.environmentVariable("HUSH_NATIVE_FIXTURES").getOrElse("")
val requireNativeFixtures = tasks.register("requireNativeFixtures") {
    group = "verification"
    description = "Require private stock inputs for the complete compatibility gate."
    doLast {
        require(nativeFixtureRoot.isNotBlank() && file(nativeFixtureRoot).isDirectory) {
            "Set HUSH_NATIVE_FIXTURES to the exact stock APK directory before running :patches:check. Use :patches:test for unit-only work."
        }
    }
}

tasks.test {
    useJUnitPlatform()
    mustRunAfter(requireNativeFixtures)
    inputs.property("nativeFixtureRoot", nativeFixtureRoot)
    if (nativeFixtureRoot.isNotBlank()) inputs.files(fileTree(nativeFixtureRoot) { include("*.apk") })
        .withPropertyName("nativeApks").withPathSensitivity(PathSensitivity.RELATIVE)
    inputs.dir(rootProject.file("scripts/profiles")).withPropertyName("stockProfiles")
    inputs.files(rootProject.files("README.md", "patches-bundle.json", "scripts/CompatReport.java"))
        .withPropertyName("compatibilitySources")
}

tasks.named<Jar>("jar") {
    manifest.attributes["Timestamp"] = providers.gradleProperty("bundleTimestampMillis").get()
    from(listOf(rootProject.file("LICENSE"), rootProject.file("NOTICE"))) {
        into("META-INF")
        // Git writes LF or CRLF depending on the checkout; the bundle bytes must not.
        filter(mapOf("eol" to FixCrLfFilter.CrLf.newInstance("lf")), FixCrLfFilter::class.java)
    }
}

dependencyLocking {
    lockAllConfigurations()
}

// The patcher and the Android build tools bring Bouncy Castle 1.77 and 1.79 into this graph.
// See gradle/libs.versions.toml for the advisories and why 1.86.
val safeBouncyCastleVersion = libs.versions.bouncycastle.get()
configurations.configureEach {
    resolutionStrategy.eachDependency {
        if (requested.group == "org.bouncycastle") useVersion(safeBouncyCastleVersion)
    }
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

tasks.check { dependsOn("checkPatchCatalog", requireNativeFixtures) }

for (taskName in listOf("checkFrozenPatchCatalog", "checkRebuiltApk")) tasks.register<JavaExec>(taskName) {
    group = "verification"
    description = "Check a frozen bundle without running any bundle producer."
    // Materialize plain paths. Kotlin's test compilation graph also depends on jar.
    // The required preceding test run supplies these classes; validation must never rebuild them.
    val toolClasses = sourceSets["test"].output.classesDirs.files
    mustRunAfter("compileTestKotlin", "compileTestJava")
    classpath = files(toolClasses, configurations["testRuntimeClasspath"].files)
    doFirst {
        val compiled = toolClasses.map { it.resolve("app/hushmessenger/tools/CatalogTool.class") }.firstOrNull { it.isFile }
        require(compiled != null && compiled.lastModified() >= file("src/test/kotlin/app/hushmessenger/tools/CatalogTool.kt").lastModified()) {
            "Run :patches:test before validating a frozen bundle. The catalog tool is missing or stale."
        }
    }
    mainClass.set("app.hushmessenger.tools.CatalogTool")
    maxHeapSize = "1024m"
    jvmArgs("-XX:ActiveProcessorCount=2")
    if (taskName == "checkRebuiltApk") {
        description = "Parse a rebuilt APK without running any bundle producer."
        args("apk", providers.gradleProperty("validationApk").getOrElse(""),
            providers.gradleProperty("validationAapt2").getOrElse(""))
    } else {
        args("check", providers.gradleProperty("validationBundle").getOrElse(""), rootDir.absolutePath,
            providers.gradleProperty("validationEvidence").getOrElse(""))
    }
}

tasks.register<JavaExec>("scanDex") {
    group = "verification"
    description = "Scan a stock Messenger APK for hookable method anchors."
    dependsOn("testClasses")
    classpath = sourceSets["test"].output + configurations["testRuntimeClasspath"]
    mainClass.set("app.hushmessenger.tools.DexScanner")
    val apkPath = providers.gradleProperty("apkPath").orNull
    val feature = providers.gradleProperty("feature").orNull ?: "all"
    args(listOfNotNull(apkPath, feature))
}

tasks.register<JavaExec>("inspectDex") {
    group = "verification"
    description = "Deep-inspect specific classes/methods in a stock Messenger APK."
    dependsOn("testClasses")
    classpath = sourceSets["test"].output + configurations["testRuntimeClasspath"]
    mainClass.set("app.hushmessenger.tools.DexInspector")
    val apkPath = providers.gradleProperty("apkPath").orNull
    val target = providers.gradleProperty("target").orNull ?: "all"
    args(listOfNotNull(apkPath, target))
}

tasks.register<Exec>("verifyReleaseMetadata") {
    group = "verification"
    description = "Check the bundle hash and all public release versions before publication."
    dependsOn("checkPatchCatalog")
    workingDir(rootDir)
    commandLine("python", "scripts/check_release.py")
}
