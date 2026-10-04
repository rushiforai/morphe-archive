group = "app.mohamedelnaggar.morphe-patches"

patches {
    about {
        name = "TikTok Lite Negro patches"
        description = "TikTok Lite patches for Morphe."
        source = "https://github.com/MohamedElnaggar00/morphe-patches-tiktok-lite-only"
        author = "MohamedElnaggar00"
        contact = "https://github.com/MohamedElnaggar00"
        website = "https://morphe.software/add-source?github=MohamedElnaggar00/morphe-patches-tiktok-lite-only"
        license = "GPLv3"
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

    doLast {
        val outputDir = generatedSecretsDir.get().asFile.resolve("app/template/patches/shared")
        outputDir.mkdirs()
        outputDir.resolve("BuildSecrets.kt").writeText(
            """
            package app.template.patches.shared

            internal object BuildSecrets {
                const val SHARED_MAPS_API_KEY = "__API_KEY_PLACEHOLDER__"
            }
            """.trimIndent().replace("__API_KEY_PLACEHOLDER__", sharedMapsApiKey.orNull.orEmpty().kotlinStringLiteral()),
        )
    }
}

tasks.named("compileKotlin") {
    dependsOn(generateSecrets)
}

tasks.named("sourcesJar") {
    dependsOn(generateSecrets)
}

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generate patches-list.json from the compiled .mpp"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
