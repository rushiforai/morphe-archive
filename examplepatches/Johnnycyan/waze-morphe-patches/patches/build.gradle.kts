group = "app.waze.elevenlabs"

// The app versions this bundle targets live in upstream.lock, which scripts/sync.sh keeps equal
// to the newest versions nl-morphe-patches targets.
val lock = providers.fileContents(rootProject.layout.projectDirectory.file("upstream.lock")).asText
fun lockValue(key: String) = lock.map { text ->
    Regex("""(?m)^$key=([0-9.]+)\s*$""").find(text)?.groupValues?.get(1) ?: error("upstream.lock has no $key")
}
val targets = mapOf(
    "WAZE_VERSION" to lockValue("WAZE_VERSION"),
    "MAPS_VERSION" to lockValue("MAPS_VERSION"),
    "MAPS_VERSION_CODE" to lockValue("MAPS_VERSION_CODE"),
    "MAPS_MIN_SDK" to lockValue("MAPS_MIN_SDK"),
)
val generatedTarget = layout.buildDirectory.dir("generated/app-targets/kotlin")
kotlin.sourceSets.main { kotlin.srcDir(generatedTarget) }
val generateTargets = tasks.register("generateTargets") {
    targets.forEach { (key, value) -> inputs.property(key, value) }
    outputs.dir(generatedTarget)
    doLast {
        val file = generatedTarget.get().asFile.resolve("app/waze/elevenlabs/Targets.kt")
        file.parentFile.mkdirs()
        val value = { key: String -> targets.getValue(key).get() }
        file.writeText(
            """
            |package app.waze.elevenlabs
            |
            |internal const val WAZE_VERSION = "${value("WAZE_VERSION")}"
            |internal const val MAPS_VERSION = "${value("MAPS_VERSION")}"
            |internal const val MAPS_VERSION_CODE = ${value("MAPS_VERSION_CODE")}
            |internal const val MAPS_MIN_SDK = ${value("MAPS_MIN_SDK")}
            |""".trimMargin()
        )
    }
}
tasks.named("compileKotlin") { dependsOn(generateTargets) }
tasks.named("sourcesJar") { dependsOn(generateTargets) }

patches {
    about {
        name = "ElevenLabs Voice"
        description = "Speaks Waze and Google Maps navigation through ElevenLabs voices, configured from each app's own settings"
        source = "https://github.com/Johnnycyan/waze-morphe-patches"
        author = "Johnnycyan"
        contact = "https://github.com/Johnnycyan/waze-morphe-patches/issues"
        website = "https://github.com/Johnnycyan/waze-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available to generatePatchesList but never bundled.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Writes patches-list.json for the built bundle"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
