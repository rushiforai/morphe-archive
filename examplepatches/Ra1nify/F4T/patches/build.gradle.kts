import java.util.Properties

group = "app.ra1nify.f4t"

patches {
    about {
        name = "Ra1nify F4T"
        description = "a bundle of Morphe patches"
        source = "na"
        author = "Ra1nify"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Reads machine-specific values from the git-ignored local.properties.
fun localProperty(key: String): String? {
    val props = Properties()
    val local = rootProject.file("local.properties")
    if (!local.isFile) return null
    val text = local.readText(Charsets.UTF_8).removePrefix("\uFEFF")
    props.load(text.reader())
    return props.getProperty(key)?.trim()?.takeIf { it.isNotEmpty() }
}

// Builds the bundle, then patches the configured APK with the given patches.
fun registerPatchTask(
    taskName: String,
    patchNames: List<String>,
    apkKey: String,
    outputName: String,
) = tasks.register<JavaExec>(taskName) {
    group = "patching"
    description = "Apply ${patchNames.joinToString(", ") { "\"$it\"" }} to the APK named by " +
        "local.properties:$apkKey"

    dependsOn("buildAndroid")

    val cli = localProperty("morphe.cli")
    val apk = localProperty(apkKey)
    val outDir = localProperty("morphe.out.dir")
        ?: rootProject.layout.buildDirectory.get().asFile.absolutePath
    val keystore = localProperty("morphe.keystore")
    val alias = localProperty("morphe.keystore.alias")
    val password = localProperty("morphe.keystore.password")

    mainClass.set("app.morphe.MorpheLauncherKt")
    classpath = files(cli ?: "")

    val bundle = layout.buildDirectory.file("libs/patches-${project.version}.mpp")
    inputs.files(bundle)

    args = buildList {
        add("patch")
        add(apk ?: "")
        add("--patches"); add(bundle.get().asFile.absolutePath)
        patchNames.forEach { name ->
            add("-e"); add(name)
        }
        add("-o"); add("$outDir/$outputName")
        if (keystore != null) {
            add("--keystore"); add(keystore)
            if (alias != null) {
                add("--keystore-entry-alias"); add(alias)
            }
            if (password != null) {
                add("--keystore-password"); add(password)
                add("--keystore-entry-password"); add(password)
            }
        }
    }

    doFirst {
        val missing = buildList {
            if (cli == null) add("morphe.cli")
            if (apk == null) add(apkKey)
        }
        if (missing.isNotEmpty()) {
            throw GradleException(
                "missing local.properties entr${if (missing.size == 1) "y" else "ies"}: " +
                    missing.joinToString(", ")
            )
        }
    }
}

registerPatchTask(
    taskName = "patchBilibili",
    patchNames = listOf("Bypass", "No Limit", "Alert"),
    apkKey = "morphe.apk.bilibili",
    outputName = "bilibili-patched.apk",
)

registerPatchTask(
    taskName = "patchVirtualTablet",
    patchNames = listOf("Lifetime Pro", "Alert"),
    apkKey = "morphe.apk.virtualtablet",
    outputName = "virtualtablet-patched.apk",
)

registerPatchTask(
    taskName = "patchKeyboard",
    patchNames = listOf("Change Identity", "Enable Inline Autofill", "Bypass Stock Limit"),
    apkKey = "morphe.apk.keyboard",
    outputName = "keyboard-patched.apk",
)
