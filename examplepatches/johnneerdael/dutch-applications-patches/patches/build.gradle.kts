import java.security.MessageDigest

group = "nl.neerdael.patches.buienalarm"

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

patches {
    about {
        name = "Dutch applications patches"
        description = "App-specific controls for advertising, publisher promotions, tracking, onboarding and article delivery in Dutch applications"
        source = "https://github.com/johnneerdael/dutch-applications-patches"
        author = "johnneerdael"
        contact = "https://github.com/johnneerdael/dutch-applications-patches/issues"
        website = "https://github.com/johnneerdael/dutch-applications-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
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
