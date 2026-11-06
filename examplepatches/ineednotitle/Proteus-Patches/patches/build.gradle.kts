group = "app.proteus.patches"

patches {
    about {
        name = "Proteus Patches"
        description = "One bundle, patches everywhere. 230+ apps."
        source = "https://github.com/ineednotitle/proteus-patches"
        author = "ineednotitle"
        contact = "https://github.com/ineednotitle"
        website = "https://morphe.software/add-source?github=ineednotitle/proteus-patches"
        license = "GPL-3.0-only"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

val generatedSecretsDir = layout.buildDirectory.dir("generated/secrets/kotlin")

sourceSets {
    main {
        kotlin.srcDir(generatedSecretsDir)
    }
}

fun String.kotlinStringLiteral() = replace("\\", "\\\\").replace("\"", "\\\"")

val generateSecrets by tasks.registering {
    val sharedMapsApiKey = providers.environmentVariable("SHARED_MAPS_API_KEY")
    inputs.property("SHARED_MAPS_API_KEY", sharedMapsApiKey.orElse(""))
    outputs.dir(generatedSecretsDir)

    doLast {
        val outputDir = generatedSecretsDir.get().asFile.resolve("app/template/patches/shared")
        outputDir.mkdirs()
        outputDir.resolve("BuildSecrets.kt").writeText(
            """
            package app.template.patches.shared

            internal object BuildSecrets {
                const val SHARED_MAPS_API_KEY = "${sharedMapsApiKey.orNull.orEmpty().kotlinStringLiteral()}"
            }
            """.trimIndent(),
        )
    }
}

tasks.named("compileKotlin") {
    dependsOn(generateSecrets)
}

tasks.named("sourcesJar") {
    dependsOn(generateSecrets)
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        // buildAndroid adds DEX to the same archive produced by jar. A later
        // Gradle invocation of build can recreate that archive without DEX, so
        // regenerate the Android bundle in the same invocation as the list.
        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    val testPermissionRemoval by registering(JavaExec::class) {
        description = "Test permission options and manifest removal"
        group = "verification"
        dependsOn(testClasses)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.template.patches.shared.manifest.PermissionRemovalTest")
    }

    val testBravePrivacy by registering(JavaExec::class) {
        description = "Test Brave return hooks and locale selection"
        group = "verification"
        dependsOn(testClasses)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.template.patches.brave.BravePrivacyTest")
    }

    check {
        dependsOn(testPermissionRemoval, testBravePrivacy)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
