import java.security.KeyFactory
import java.security.MessageDigest
import java.security.Signature
import java.security.spec.EdECPrivateKeySpec
import java.security.spec.NamedParameterSpec
import java.security.spec.X509EncodedKeySpec
import java.util.Base64
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
    // The native replay holds one stock APK's dex files at a time, which outgrows the 512 MB default on 582.
    maxHeapSize = "2g"
    jvmArgs("-XX:ActiveProcessorCount=2")
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

// MorpheSig1, the bundle signature morphe-patcher 2.1 checks and Morphe Manager 2.3 pins per source:
// Ed25519 over "MorpheSig1" and the SHA-256 of the archive with an empty comment, stored in the zip
// comment as "MorpheSig1 <public key> <signature>". scripts/bundle_signature.py checks it the same
// way. MORPHE_SIGNING_KEY is the Base64 private key, as the Morphe patches plugin 2.1 reads it, and
// release.ps1 sets it. Without it the bundle stays unsigned, which only a release refuses.
fun signBundle(bundle: File, privateKey: String?, publicKey: String) {
    val bytes = bundle.readBytes()
    // The end of central directory record is the last one whose comment reaches the end.
    fun length(at: Int) = (bytes[at].toInt() and 0xFF) or ((bytes[at + 1].toInt() and 0xFF) shl 8)
    val end = (bytes.size - 22 downTo maxOf(0, bytes.size - 22 - 0xFFFF)).firstOrNull {
        bytes[it] == 0x50.toByte() && bytes[it + 1] == 0x4b.toByte() && bytes[it + 2] == 5.toByte() &&
            bytes[it + 3] == 6.toByte() && length(it + 20) == bytes.size - it - 22
    } ?: throw GradleException("$bundle is not a zip archive")
    // A rerun of buildAndroid rewrites the archive, so an earlier signature no longer applies.
    val unsigned = bytes.copyOf(end + 22).also { it[end + 20] = 0; it[end + 21] = 0 }
    if (privateKey.isNullOrBlank()) {
        if (unsigned.size != bytes.size) bundle.writeBytes(unsigned)
        return
    }
    val message = "MorpheSig1".toByteArray(Charsets.US_ASCII) + MessageDigest.getInstance("SHA-256").digest(unsigned)
    val keys = KeyFactory.getInstance("Ed25519")
    val signature = Signature.getInstance("Ed25519").run {
        initSign(keys.generatePrivate(EdECPrivateKeySpec(NamedParameterSpec.ED25519, Base64.getDecoder().decode(privateKey.trim()))))
        update(message)
        sign()
    }
    // A raw Ed25519 public key behind its fixed X.509 prefix.
    val x509 = byteArrayOf(0x30, 0x2a, 0x30, 0x05, 0x06, 0x03, 0x2b, 0x65, 0x70, 0x03, 0x21, 0x00) +
        Base64.getDecoder().decode(publicKey)
    val matches = Signature.getInstance("Ed25519").run {
        initVerify(keys.generatePublic(X509EncodedKeySpec(x509)))
        update(message)
        verify(signature)
    }
    if (!matches) throw GradleException("MORPHE_SIGNING_KEY is not the key morphe-signing.pub publishes")
    val comment = "MorpheSig1 $publicKey ${Base64.getEncoder().encodeToString(signature)}".toByteArray(Charsets.US_ASCII)
    unsigned[end + 20] = (comment.size and 0xFF).toByte()
    unsigned[end + 21] = (comment.size shr 8).toByte()
    bundle.writeBytes(unsigned + comment)
}

tasks.named("buildAndroid") {
    val bundle = tasks.named<Jar>("jar").flatMap { it.archiveFile }
    val privateKey = providers.environmentVariable("MORPHE_SIGNING_KEY")
    val publicKey = rootProject.file("morphe-signing.pub")
    // After the plugin's own action, which writes classes.dex into the archive.
    doLast { signBundle(bundle.get().asFile, privateKey.orNull, publicKey.readText().trim()) }
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

tasks.register<JavaExec>("benchmarkWifiIdentity") {
    group = "verification"
    description = "Compare Wi-Fi finder time, allocation and heap peaks on one exact stock APK."
    dependsOn("testClasses")
    classpath = sourceSets["test"].output + sourceSets["main"].output + configurations["testRuntimeClasspath"]
    mainClass.set("app.hushmessenger.patches.controls.WifiIdentityBenchmark")
    maxHeapSize = "2g"
    jvmArgs("-XX:ActiveProcessorCount=2")
    args(providers.gradleProperty("apkPath").getOrElse(""))
    workingDir(projectDir)
}

tasks.register<Exec>("verifyReleaseMetadata") {
    group = "verification"
    description = "Check the bundle hash and all public release versions before publication."
    dependsOn("checkPatchCatalog")
    workingDir(rootDir)
    commandLine("python", "scripts/check_release.py")
}
