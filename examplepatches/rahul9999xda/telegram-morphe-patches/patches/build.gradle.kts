group = "app.telegrammorphe.morphe-patches"

patches {
    about {
        name = "Telegram Morphe Patches"
        description = "Telegram-only patches for Morphe."
        source = "https://github.com/rahul9999xda/telegram-morphe-patches"
        author = "rahul9999xda"
        contact = "https://github.com/rahul9999xda"
        website = "https://morphe.software/add-source?github=rahul9999xda/telegram-morphe-patches"
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

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    register("buildTelegramMpp") {
        group = "build"
        description = "Build the Telegram-only Morphe patch bundle (.mpp)."
        dependsOn("buildAndroid")
    }
}
