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
        val key = mapsKeySource.orNull?.trim()
        require(key != null && Regex("AIza[0-9A-Za-z_-]{35}").matches(key)) {
            "Set SHARED_MAPS_API_KEY or the Git-ignored .community-maps-api-key file"
        }
        val destination = generatedMapsKey.get().asFile.resolve("patches/buienalarm/CommunityMapsKey.kt")
        destination.parentFile.mkdirs()
        destination.writeText("package patches.buienalarm\ninternal object CommunityMapsKey { const val value = \"$key\" }\n")
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
        name = "Dutch App Patches"
        description = "App-specific controls for advertising, publisher promotions, tracking, onboarding and article delivery in Dutch applications"
        source = "https://github.com/johninnl/nl-morphe-patches"
        author = "johninnl"
        contact = "https://github.com/johninnl/nl-morphe-patches/issues"
        website = "https://github.com/johninnl/nl-morphe-patches"
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
