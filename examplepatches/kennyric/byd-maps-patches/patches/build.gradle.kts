import java.security.MessageDigest

group = "nl.johninnl.patches"

// Match the patch bundle's Kotlin JVM 11 target for the checked Java DEX hook helpers.
tasks.withType<org.gradle.api.tasks.compile.JavaCompile>().configureEach {
    options.release.set(11)
}
tasks.named<org.gradle.api.tasks.javadoc.Javadoc>("javadoc") {
    // The checked Java hook helper is intentionally package-private.
    options.memberLevel = org.gradle.external.javadoc.JavadocMemberLevel.PACKAGE
}

// Publish only Google Maps patches (and shared helpers) in this fork.
kotlin.sourceSets.main {
    kotlin.exclude { entry ->
        !entry.isDirectory &&
            entry.path.startsWith("patches/") &&
            !entry.path.startsWith("patches/googlemaps/") &&
            !entry.path.startsWith("patches/shared/")
    }
}
val testExclude: (FileTreeElement) -> Boolean = { entry ->
    !entry.isDirectory &&
        entry.path.startsWith("patches/") &&
        !entry.path.startsWith("patches/googlemaps/") &&
        entry.path != "patches/shared/CarParkedAppManifestTest.kt"
}
kotlin.sourceSets.test {
    kotlin.exclude(testExclude)
}
sourceSets.named("test") {
    java.exclude(testExclude)
}
tasks.named<org.gradle.language.jvm.tasks.ProcessResources>("processResources") {
    exclude { entry ->
        entry.path.startsWith("extensions/") &&
            entry.path != "extensions/maps.mpe" &&
            entry.path != "extensions/maps-gearslip.mpe"
    }
}

val mapsKeySource = providers.environmentVariable("SHARED_MAPS_API_KEY")
    .orElse(providers.fileContents(rootProject.layout.projectDirectory.file(".community-maps-api-key")).asText)
val generatedMapsKey = layout.buildDirectory.dir("generated/maps-key/kotlin")
kotlin.sourceSets.main { kotlin.srcDir(generatedMapsKey) }
val generateMapsKey = tasks.register("generateMapsKey") {
    val digest = mapsKeySource.map { key ->
        MessageDigest.getInstance("SHA-256").digest(key.trim().toByteArray())
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    }
    inputs.property("mapsKeyDigest", digest.orElse("missing"))
    outputs.dir(generatedMapsKey)
    doLast {
        val destination = generatedMapsKey.get().asFile.resolve("patches/buienalarm/CommunityMapsKey.kt")
        destination.parentFile.mkdirs()
        val key = mapsKeySource.orNull?.trim()
        // A fork has no shared key; the constant stays empty and only the Buienalarm patch is
        // affected, so the rest of the bundle still builds.
        require(key == null || key.isEmpty() || Regex("AIza[0-9A-Za-z_-]{35}").matches(key)) {
            "Set SHARED_MAPS_API_KEY or the Git-ignored .community-maps-api-key file"
        }
        destination.writeText("package patches.buienalarm\ninternal object CommunityMapsKey { const val value = \"${key.orEmpty()}\" }\n")
    }
}
tasks.named("compileKotlin") { dependsOn(generateMapsKey) }
tasks.named("sourcesJar") { dependsOn(generateMapsKey) }

// Bright article-signing preflight status, generated from the same git-ignored
// engineering input the extension module uses. Only a digest reaches build
// logs; a missing key fails the article control without affecting privacy
// controls.
val brightKeySource = providers.environmentVariable("BRIGHT_ARTICLE_SIGNING_KEY")
    .orElse(providers.fileContents(rootProject.layout.projectDirectory.file(".bright-article-signing-key")).asText)
val generatedBrightKeyStatus = layout.buildDirectory.dir("generated/bright-key/kotlin")
kotlin.sourceSets.main { kotlin.srcDir(generatedBrightKeyStatus) }
val generateBrightKeyStatus = tasks.register("generateBrightKeyStatus") {
    val digest = brightKeySource.map { key ->
        if (key.isBlank()) "missing" else MessageDigest.getInstance("SHA-256").digest(key.trim().toByteArray())
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    }
    inputs.property("brightKeyDigest", digest.orElse("missing"))
    outputs.dir(generatedBrightKeyStatus)
    doLast {
        val raw = brightKeySource.orNull?.trim()
        val available = !raw.isNullOrEmpty() && Regex("[A-Za-z0-9_-]{16,128}").matches(raw)
        val destination = generatedBrightKeyStatus.get().asFile.resolve("patches/bright/ArticleKeyStatus.kt")
        destination.parentFile.mkdirs()
        destination.writeText(
            """
            |// GENERATED from the git-ignored engineering key input; digest only.
            |package patches.bright
            |
            |internal object ArticleKeyStatus {
            |    const val available = $available
            |    const val digest = "${if (available) digest.get() else "none"}"
            |}
            """.trimMargin()
        )
    }
}
tasks.named("compileKotlin") { dependsOn(generateBrightKeyStatus) }
tasks.named("sourcesJar") { dependsOn(generateBrightKeyStatus) }

patches {
    about {
        name = "BYD Maps Patches"
        description = "Google Maps patches for Android Auto with BYD battery and arrival state of charge via byd-open-remote"
        source = "https://github.com/kennyric/byd-maps-patches"
        author = "kennyric"
        contact = "https://github.com/kennyric/byd-maps-patches/issues"
        website = "https://github.com/kennyric/byd-maps-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("junit:junit:4.13.2")
    testImplementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
