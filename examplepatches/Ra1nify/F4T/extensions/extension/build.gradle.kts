

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.ra1nify.f4t.extension"
}

// The Kotlin standard library is unused here and would add ~2 MB to every patched APK.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib-jdk7")
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib-jdk8")
}

// The notice re-arms per bundle version, so the extension needs that version at runtime.
val generatedVersionDir = layout.buildDirectory.dir("generated/bundleVersion/java").get().asFile

val generateBundleVersion = tasks.register("generateBundleVersion") {
    val outputDir = generatedVersionDir
    val versionString = project.version.toString()
    outputs.dir(outputDir)
    doLast {
        val packageDir = File(outputDir, "app/ra1nify/f4t/extension")
        packageDir.mkdirs()
        File(packageDir, "BuildInfo.java").writeText(
            """
            package app.ra1nify.f4t.extension;

            final class BuildInfo {
                static final String VERSION = "$versionString";

                private BuildInfo() {
                }
            }
            """.trimIndent() + "\n"
        )
    }
}

android.sourceSets.getByName("main").java.srcDir(generatedVersionDir)

// Compile tasks read the generated source, so they have to wait for it.

tasks.withType<JavaCompile>().configureEach {
    options.encoding = "UTF-8"
}

tasks.configureEach {
    if (name.startsWith("compile")) dependsOn(generateBundleVersion)
}
