import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.dsl.KotlinVersion
plugins { kotlin("jvm") version "2.4.10" }
group = "local.wazemaps"
version = "2.0.0"
val bundleVersion = providers.gradleProperty("bundleVersion").orElse("1.17.0")
val wazeVersion = providers.gradleProperty("wazeVersion").orElse("5.26.0.0")
val generatedTarget = layout.buildDirectory.dir("generated/waze-target")
val generateTarget by tasks.registering {
    inputs.property("wazeVersion", wazeVersion)
    inputs.file("ci/compatibility_fixtures.json")
    outputs.dir(generatedTarget)
    doLast {
        val target = wazeVersion.get()
        require(target.matches(Regex("[0-9]+(\\.[0-9]+){3}"))) { "Invalid Waze version" }
        @Suppress("UNCHECKED_CAST")
        val fixtures = groovy.json.JsonSlurper().parse(file("ci/compatibility_fixtures.json")) as List<Map<String, Any>>
        val supported = (listOf(target) + fixtures.filter { "unsupported_patches" !in it }.map { it.getValue("version") as String }).distinct()
        require(supported.all { it.matches(Regex("[0-9]+(\\.[0-9]+){3}")) }) { "Invalid fixture version" }
        val versions = supported.joinToString(", ") { "\"$it\"" }
        generatedTarget.get().file("local/wazemaps/BuildTarget.kt").asFile.apply {
            parentFile.mkdirs()
            writeText("package local.wazemaps\ninternal const val TARGET_WAZE_VERSION = \"$target\"\ninternal val TESTED_WAZE_VERSIONS = listOf($versions)\n")
        }
    }
}
kotlin.sourceSets.main { kotlin.srcDir(generatedTarget) }
sourceSets.main { resources.srcDir(layout.buildDirectory.dir("generated/native-icons")) }
tasks.named("compileKotlin") { dependsOn(generateTarget) }
repositories { mavenCentral() }
dependencies { compileOnly(files("tools/morphe-desktop.jar")) }
kotlin { compilerOptions {
    jvmTarget.set(JvmTarget.JVM_11)
    languageVersion.set(KotlinVersion.KOTLIN_2_2)
    apiVersion.set(KotlinVersion.KOTLIN_2_2)
} }
java { targetCompatibility = JavaVersion.VERSION_11; sourceCompatibility = JavaVersion.VERSION_11 }
tasks.jar {
    exclude("local/wazemaps/CompanionInstallerKt*.class")
    exclude("local/wazemaps/AndroidAutoPatchKt*.class")
    exclude("local/wazemaps/PoliceAlertDistancePatchKt*.class")
    exclude("local/wazemaps/CameraSoundPatchKt*.class")
    exclude("local/wazemaps/AndroidAutoResources*.class")
    exclude("local/wazemaps/IconPackPatchKt*.class")
    exclude("local/wazemaps/IconPackResources*.class")
    exclude("local/wazemaps/ManifestResourcesKt*.class")
    exclude("local/wazemaps/ReportIconAssets*.class")
    exclude("local/wazemaps/ReportIconSizingPatchKt*.class")
    exclude("local/wazemaps/ReportIconSizingResources*.class")
    exclude("local/wazemaps/DriverIconsPatchKt*.class")
    exclude("local/wazemaps/VehicleModelsPatchKt*.class")
    exclude("local/wazemaps/BadgeSelectorPatchKt*.class")
    exclude("local/wazemaps/ThemeSelectorPatchKt*.class")
    exclude("local/wazemaps/SelectableThemeResources*.class")
    manifest.attributes(
        "Name" to "Waze Maps Skin",
        "Description" to "Sampled Google Maps colours with explicit Waze renderer overrides",
        "Version" to project.version,
        "Author" to "Local custom patches",
        "License" to "GPL-3.0",
        "Patcher-Version" to "1.15.0"
    )
}

tasks.register<Jar>("themesJar") {
    from(sourceSets.main.get().output)
    include("local/wazemaps/BuildTargetKt*.class")
    include("local/wazemaps/WazeBindingsKt*.class")
    include("local/wazemaps/ReportIconAssets*.class")
    include("local/wazemaps/ReportIconSizingPatchKt*.class")
    include("local/wazemaps/ReportIconSizingResources*.class")
    include("local/wazemaps/ThemeSelectorPatchKt*.class")
    include("local/wazemaps/SelectableThemeResources*.class")
    include("local/wazemaps/ThemeColoursKt*.class")
    include("local/wazemaps/CompanionInstallerKt*.class")
    include("local/wazemaps/AndroidAutoPatchKt*.class")
    include("local/wazemaps/PoliceAlertDistancePatchKt*.class")
    include("local/wazemaps/CameraSoundPatchKt*.class")
    include("local/wazemaps/AndroidAutoResources*.class")
    include("local/wazemaps/IconPackPatchKt*.class")
    include("local/wazemaps/IconPackResources*.class")
    include("local/wazemaps/ManifestResourcesKt*.class")
    include("local/wazemaps/BadgeSelectorPatchKt*.class")
    include("local/wazemaps/DriverIconsPatchKt*.class")
    include("themes/**")
    include("iconpacks/**")
    exclude("themes/legacy/**")
    archiveBaseName.set("waze-theme-selector")
    archiveVersion.set(bundleVersion)
    manifest.attributes("Name" to "Waze Theme Selector", "Version" to bundleVersion.get(),
        "Description" to "Independent themes, icons, sizing, badges, moods, Android Auto setup, alert distance and camera sound",
        "Author" to "Local custom patches", "License" to "GPL-3.0", "Patcher-Version" to "1.15.0")
}

tasks.register<Jar>("badgesJar") {
    from(sourceSets.main.get().output)
    include("local/wazemaps/BuildTargetKt*.class")
    include("local/wazemaps/WazeBindingsKt*.class")
    include("local/wazemaps/ManifestResourcesKt*.class")
    include("local/wazemaps/ThemeColoursKt*.class")
    include("local/wazemaps/BadgeSelectorPatchKt*.class")
    archiveBaseName.set("waze-badge-selector")
    archiveVersion.set("1.0.0")
    manifest.attributes("Name" to "Waze Badge Selector", "Version" to "1.0.0",
        "Description" to "Local Waze badge appearance selector", "Author" to "Local custom patches",
        "License" to "GPL-3.0", "Patcher-Version" to "1.15.0")
}

tasks.register<Jar>("vehiclesJar") {
    from(sourceSets.main.get().output)
    include("local/wazemaps/VehicleModelsPatchKt*.class")
    archiveBaseName.set("waze-vehicle-models")
    archiveVersion.set("1.0.0")
    manifest.attributes("Name" to "Waze Vehicle Models", "Version" to "1.0.0",
        "Description" to "Expose bundled Waze vehicle models", "Author" to "Local custom patches",
        "License" to "GPL-3.0", "Patcher-Version" to "1.15.0")
}

tasks.register<Jar>("iconsJar") {
    from(sourceSets.main.get().output)
    include("local/wazemaps/BuildTargetKt*.class")
    include("local/wazemaps/WazeBindingsKt*.class")
    include("local/wazemaps/ManifestResourcesKt*.class")
    include("local/wazemaps/ThemeColoursKt*.class")
    include("local/wazemaps/DriverIconsPatchKt*.class")
    archiveBaseName.set("waze-driver-icons")
    archiveVersion.set("1.0.0")
    manifest.attributes(
        "Name" to "Waze Driver Icons", "Version" to "1.0.0",
        "Description" to "Unlock local Waze driver moods and editor icons",
        "Author" to "Local custom patches", "License" to "GPL-3.0",
        "Patcher-Version" to "1.15.0"
    )
}
