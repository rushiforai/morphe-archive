import java.util.Properties

group = "com.sj010.gboardclipboard"

// The about block and the shell build (scripts/build-mpp.sh) must describe the
// bundle the same way, so both read patches/about.properties. The literal
// fallbacks keep the build working when the file is missing.
//
// The import is needed because the project scope has a `java` extension, which
// would shadow the `java` package inside a build script.
val aboutProperties = Properties().apply {
    val aboutFile = file("about.properties")
    if (aboutFile.exists()) {
        aboutFile.inputStream().use { stream -> load(stream) }
    }
}

fun aboutValue(key: String, fallback: String): String =
    aboutProperties.getProperty(key)?.takeIf { it.isNotBlank() } ?: fallback

patches {
    about {
        name = aboutValue("name", "Gboard Clipboard History")
        description = aboutValue(
            "description",
            "Standalone clipboard history manager for Gboard with text export and a read-only ContentProvider API.",
        )
        source = aboutValue("source", "https://github.com/ShubhamJ010/gboard-clipboard-history")
        author = aboutValue("author", "sj010")
        contact = aboutValue("contact", "https://github.com/ShubhamJ010/gboard-clipboard-history/issues")
        website = aboutValue("website", "https://github.com/ShubhamJ010/gboard-clipboard-history")
        license = aboutValue("license", "GPLv3")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// The Gradle build packages the metadata from src/main/resources. The copies in
// the repository root are the ones the shell scripts use and the ones that get
// reviewed, so copy them over before the bundle is assembled. A metadata file
// that exists in only one place would ship a bundle nobody looked at.
val metadataRoot = rootProject.projectDir
val metadataResources = File(projectDir, "src/main/resources")
val metadataNames = listOf("patches-list.json", "patches-bundle.json")

tasks.matching { it.name == "buildAndroid" }.configureEach {
    doFirst {
        metadataNames.forEach { name ->
            val source = File(metadataRoot, name)
            val target = File(metadataResources, name)
            if (!source.exists()) return@forEach
            val bytes = source.readBytes()
            if (!target.exists() || !bytes.contentEquals(target.readBytes())) {
                target.parentFile.mkdirs()
                target.writeBytes(bytes)
                logger.lifecycle("synced $name into patches/src/main/resources")
            }
        }
    }
}
