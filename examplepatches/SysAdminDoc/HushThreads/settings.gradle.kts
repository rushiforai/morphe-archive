import org.gradle.api.artifacts.Configuration
import org.gradle.api.artifacts.component.ModuleComponentIdentifier
import org.gradle.api.artifacts.component.ModuleComponentSelector
import org.gradle.api.artifacts.repositories.MavenArtifactRepository
import org.gradle.api.artifacts.result.ResolvedDependencyResult
import org.gradle.api.artifacts.result.UnresolvedDependencyResult
import java.security.MessageDigest

rootProject.name = "hushthreads"

pluginManagement {
    val allowLocalPlugins = providers.gradleProperty("allowMavenLocal")
        .map(String::toBoolean)
        .getOrElse(false)
    repositories {
        // Local plugin artifacts are useful while developing the plugin, but they must never
        // silently override the reviewed repositories used for a release build.
        if (allowLocalPlugins) mavenLocal()
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
            }
        }
        // baksmali and smali come from a source build, resolved as com.github.MorpheApp.smali
        // rather than from Maven Central. The comment used to name iBotPeaches/smali, which the
        // build stopped using when the patches plugin switched forks at 1.3.2.
        //
        // google/smali 3.0.10 shipped officially on 2026-08-20, so "until official releases come
        // out again" is no longer the reason to keep this. The reason is that the pin has to be
        // whatever the patcher was built against: two copies of dexlib2 on the R8 classpath fail
        // buildAndroid with "Classpath type already present".
        maven { url = uri("https://jitpack.io") }
    }
}

// app.morphe:morphe-patches-gradle-plugin 2.1.0 brings kotlin-gradle-plugin 2.4.21 as a
// runtimeElements dependency, outside CVE-2026-53914 (GHSA-r937-wjx7-w2jp, the Kotlin build
// cache's deserialisation flaw, fixed in 2.4.20), so the settings classpath no longer forces a
// Kotlin version. 1.3.4 brought 2.4.10, inside it, and was forced to 2.4.20 here.
// gradle/verification-metadata.xml says which version actually resolved.
//
// The same classpath brings Bouncy Castle 1.79, by way of the patcher's 1.77 pin and the
// Android build tools' own 1.79 request: 1.77 is inside all six advisories (CVE-2025-8916
// 1.44 to 1.78, CVE-2026-5588 1.67 to 1.83, CVE-2025-14813, CVE-2026-0636 fixed in 1.84,
// CVE-2026-8763, CVE-2026-13506 fixed in 1.85) and 1.79 is inside all but CVE-2025-8916.
// :patches and :extensions:threads each force their own graphs to
// the reviewed release, but neither reaches this one: a force on a project configuration cannot
// touch the classpath the plugins themselves resolve on, and that classpath is where the
// signing code actually runs. 1.86 is spelled out here rather than read from
// gradle/libs.versions.toml because the version catalog does not exist yet at this point in the
// build; the catalog pins the same value and says why it is that one. Move both together.
//
// The Android Gradle plugin brings jose4j 0.9.5 and jdom2 2.0.6 here, inside GHSA-3677-xxcr-wjqv
// (CVE-2024-29371, fixed in jose4j 0.9.6) and GHSA-2363-cqg2-863c (CVE-2021-33813, fixed in jdom2
// 2.0.6.1). Both fixes are patch releases of the same line. Only those two requests are replaced,
// so a later plugin asking for a newer version gets it, and any other vulnerable one is the build
// classpath inventory's to show and the release receipt's to refuse. Take a force out once the
// plugin asks for a fixed version.
//
// The plugins ask for Guava from 18.0 up to 33.5.0-jre, and 33.5.0-jre is inside GHSA-xxph-c9ww-hj94
// (CVE-2026-102554, 4.0 to 33.7.1, fixed in 33.7.2): deserializing a CompactHashMap, CompactHashSet
// or MapMakerInternalMap can allocate without bound. A constraint is a floor rather than a force, so
// a plugin that later asks for a newer Guava gets it. :patches pins the same 33.7.2-jre through
// gradle/libs.versions.toml; move both together, and take this out once the plugins ask for a fixed
// version. Gradle keeps its own embedded Guava from plugin class loaders, so this changes only the
// copy the plugins load, and :buildClasspathInventory records which jar that is (see below).
//
// The Morphe plugin asks for commons-lang3 3.16.0, inside GHSA-j288-q9x7-2f5v (CVE-2025-48924,
// 3.0 to 3.17.0, fixed in 3.18.0): ClassUtils.getClass recurses without bound on a long name. It's
// a floor for the same reason, so it stops mattering once the plugin asks for 3.18.0 or later.
buildscript {
    dependencies {
        constraints {
            classpath("com.google.guava:guava:33.7.2-jre") {
                because("GHSA-xxph-c9ww-hj94 affects Guava 4.0 to 33.7.1.")
            }
            classpath("org.apache.commons:commons-lang3:3.18.0") {
                because("GHSA-j288-q9x7-2f5v affects commons-lang3 3.0 to 3.17.0.")
            }
        }
    }
    configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.group == "org.bouncycastle") {
                useVersion("1.86")
            }
            if (requested.group == "org.bitbucket.b_c" && requested.name == "jose4j" && requested.version == "0.9.5") {
                useVersion("0.9.6")
            }
            if (requested.group == "org.jdom" && requested.name == "jdom2" && requested.version == "2.0.6") {
                useVersion("2.0.6.1")
            }
        }
    }
}

val allowMavenLocal = providers.gradleProperty("allowMavenLocal")
    .map(String::toBoolean)
    .getOrElse(false)

plugins {
    id("app.morphe.patches") version "2.1.0"
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"

        // Must resolve to an absolute path (not relative),
        // otherwise the extensions in subfolders will fail to find the proguard config.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

if (!allowMavenLocal) {
    val localMavenUrl = file(System.getProperty("user.home"))
        .resolve(".m2/repository")
        .toURI()
        .toString()
        .removeSuffix("/")
    val localRepositories = dependencyResolutionManagement.repositories.filter { repository ->
        repository is MavenArtifactRepository
                && repository.url.toString().removeSuffix("/") == localMavenUrl
    }
    localRepositories.forEach { repository ->
        dependencyResolutionManagement.repositories.remove(repository)
    }
}

include(":patches:stub")

// The classpath the plugins above load from, which builds and signs the bundle: the Morphe
// patches plugin and everything it brings, the Android Gradle plugin, R8 and apksig among them.
// The release SBOM leaves it out on purpose, since it lists what the bundle carries, so it's
// written down here instead: :buildClasspathInventory puts it in build/build-classpath/inventory.json,
// and scripts/build-release-receipt.ps1 asks OSV about it apart from the SBOM. Only this script
// sees this classpath. Each project's own buildscript classpath goes in too, though no project
// declares a plugin version of its own today. A version here is the one Gradle's resolution
// chose. That says nothing about which classes a plugin actually loads from it, except for Guava,
// whose loaded jar the probe below records.
//
// A request for another version than the one chosen is listed with the reasons Gradle gives (the
// forces above, or conflict resolution), so a vulnerable version that was only asked for shows as
// asked for, not as present. A dependency that didn't resolve is listed as such, and the receipt
// refuses the inventory rather than reading it as clean.
val buildClasspathLimit = 4000
val buildClasspathGraphs = sortedMapOf<String, Map<String, Any?>>()

fun buildClasspathPurlSegment(text: String): String = buildString {
    for (byte in text.toByteArray(Charsets.UTF_8)) {
        val c = byte.toInt() and 0xff
        val plain = c in 'a'.code..'z'.code || c in 'A'.code..'Z'.code || c in '0'.code..'9'.code ||
            c == '.'.code || c == '-'.code || c == '_'.code || c == '~'.code
        if (plain) append(c.toChar()) else append("%%%02X".format(c))
    }
}

fun buildClasspathGraph(name: String, configuration: Configuration): Map<String, Any?> {
    class Edge(val requested: String, val outcome: String) {
        val requestedBy = sortedSetOf<String>()
        val reasons = sortedSetOf<String>()
    }
    val root = configuration.incoming.resolutionResult.root
    val components = sortedMapOf<String, ModuleComponentIdentifier>()
    val conflicts = sortedMapOf<String, Edge>()
    val unresolved = sortedMapOf<String, Edge>()
    val seen = mutableSetOf<Any>()
    val queue = ArrayDeque(listOf(root))
    while (queue.isNotEmpty()) {
        val component = queue.removeFirst()
        if (!seen.add(component.id)) continue
        val id = component.id as? ModuleComponentIdentifier
        val from = if (id == null) name else "${id.group}:${id.module}:${id.version}"
        if (id != null) components[from] = id
        for (dependency in component.dependencies) {
            if (dependency.isConstraint) continue
            val requested = dependency.requested
            if (dependency is UnresolvedDependencyResult) {
                val failure = dependency.failure.message.orEmpty().lineSequence().firstOrNull().orEmpty().take(300)
                unresolved.getOrPut(requested.displayName) { Edge(requested.displayName, failure) }.requestedBy += from
                continue
            }
            val selected = (dependency as ResolvedDependencyResult).selected
            queue.addLast(selected)
            val chosen = selected.id as? ModuleComponentIdentifier ?: continue
            if (requested !is ModuleComponentSelector) continue
            val asked = if (requested.version.isBlank()) "${requested.group}:${requested.module}"
                else "${requested.group}:${requested.module}:${requested.version}"
            val got = "${chosen.group}:${chosen.module}:${chosen.version}"
            if (asked == got || (requested.version.isBlank() && asked == "${chosen.group}:${chosen.module}")) continue
            val conflict = conflicts.getOrPut("$asked $got") { Edge(asked, got) }
            conflict.requestedBy += from
            for (reason in selected.selectionReason.descriptions) conflict.reasons += "${reason.cause}: ${reason.description}"
        }
    }
    if (components.size > buildClasspathLimit) {
        throw GradleException("The $name holds ${components.size} components, more than the inventory's bound of $buildClasspathLimit.")
    }
    fun listed(edges: Map<String, Edge>, outcome: String) = edges.values.map {
        linkedMapOf("requested" to it.requested, outcome to it.outcome,
            "requestedBy" to it.requestedBy.take(20), "requestedByCount" to it.requestedBy.size,
            "reasons" to it.reasons.take(10))
    }
    return linkedMapOf(
        "name" to name,
        "components" to components.values.map {
            linkedMapOf("group" to it.group, "name" to it.module, "version" to it.version,
                "purl" to "pkg:maven/${buildClasspathPurlSegment(it.group)}/${buildClasspathPurlSegment(it.module)}@" +
                    buildClasspathPurlSegment(it.version))
        },
        "conflicts" to listed(conflicts, "resolved"),
        "unresolved" to listed(unresolved, "failure"),
    )
}

fun buildClasspathJson(value: Any?, indent: String = ""): String {
    val inner = "$indent  "
    return when (value) {
        null -> "null"
        is String -> buildString {
            append('"')
            for (ch in value) when {
                ch == '\\' -> append("\\\\")
                ch == '"' -> append("\\\"")
                ch.code < 0x20 || ch.code > 0x7e -> append("\\u%04x".format(ch.code))
                else -> append(ch)
            }
            append('"')
        }
        is Number, is Boolean -> value.toString()
        is Map<*, *> -> if (value.isEmpty()) "{}" else value.entries.joinToString(",\n", "{\n", "\n$indent}") {
            inner + buildClasspathJson(it.key.toString()) + ": " + buildClasspathJson(it.value, inner)
        }
        is Iterable<*> -> if (!value.iterator().hasNext()) "[]" else value.joinToString(",\n", "[\n", "\n$indent]") {
            inner + buildClasspathJson(it, inner)
        }
        else -> throw GradleException("The build classpath inventory can't hold a ${value::class.java.simpleName}.")
    }
}

buildClasspathGraphs["settings classpath"] = buildClasspathGraph("settings classpath", buildscript.configurations.getByName("classpath"))
// SHA-256 of a file's raw bytes as lowercase hex, the format scripts/release-advisories.ps1 gets from
// Get-FileHash. The inventory ties itself to these four files, and the receipt refuses one whose
// hashes differ from the checkout it builds from.
fun buildClasspathFileSha256(relative: String): String {
    val file = settingsDir.resolve(relative)
    if (!file.isFile) throw GradleException("The build classpath inventory can't hash $relative, which isn't there.")
    return MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString("") { "%02x".format(it) }
}
val buildClasspathSettingsSha256 = buildClasspathFileSha256("settings.gradle.kts")
val buildClasspathInputs = linkedMapOf(
    "settings.gradle.kts" to buildClasspathSettingsSha256,
    "patches/build.gradle.kts" to buildClasspathFileSha256("patches/build.gradle.kts"),
    "gradle/libs.versions.toml" to buildClasspathFileSha256("gradle/libs.versions.toml"),
    "gradle/verification-metadata.xml" to buildClasspathFileSha256("gradle/verification-metadata.xml"),
)
val buildClasspathGradleVersion = gradle.gradleVersion

// Which jar the plugins' code actually takes Guava from. A version in a graph is only what Gradle's
// resolution chose, so this asks the class loaders the Morphe and Android Gradle plugins run in for
// the three classes GHSA-xxph-c9ww-hj94 names, without initialising them, and records the jar each
// came from. Six lookups, nothing else loaded. Gradle keeps its own embedded Guava from plugin class
// loaders, so a jar named here is the copy the plugins use, and the inventory task refuses one that
// isn't the Guava the settings classpath resolved. A plugin or class that can't be found records no
// jar rather than failing here, so every other task still configures and only the inventory refuses.
fun buildClasspathGuavaLoads(): List<Map<String, Any?>> {
    val android = try {
        Class.forName("com.android.build.gradle.LibraryPlugin", false, javaClass.classLoader).classLoader
    } catch (missing: ClassNotFoundException) {
        null
    } catch (missing: LinkageError) {
        null
    }
    val loaders = linkedMapOf("app.morphe.patches plugin" to plugins.findPlugin("app.morphe.patches")?.javaClass?.classLoader,
        "Android Gradle plugin" to android)
    val classes = listOf("com.google.common.collect.CompactHashMap", "com.google.common.collect.CompactHashSet",
        "com.google.common.collect.MapMakerInternalMap")
    return loaders.flatMap { (who, loader) ->
        classes.map { name ->
            val jar = if (loader == null) null else try {
                Class.forName(name, false, loader).protectionDomain?.codeSource?.location?.path?.substringAfterLast('/')
            } catch (missing: ClassNotFoundException) {
                null
            } catch (missing: LinkageError) {
                null
            }
            linkedMapOf("loader" to who, "class" to name, "jar" to jar)
        }
    }
}
val buildClasspathLoads = buildClasspathGuavaLoads()

fun buildClasspathProjectGraphName(path: String) =
    if (path == ":") "root project buildscript classpath" else "$path buildscript classpath"

gradle.allprojects {
    val graphName = buildClasspathProjectGraphName(path)
    // After the project's script has run, when its own plugins block has resolved, and in its own
    // context, which Gradle wants for resolving a project's configuration. A project this build
    // doesn't evaluate (configure-on-demand, an isolated-projects run) never gets here, so the
    // inventory task checks that every project's graph arrived.
    afterEvaluate {
        val graph = buildClasspathGraph(graphName, buildscript.configurations.getByName("classpath"))
        synchronized(buildClasspathGraphs) { buildClasspathGraphs[graphName] = graph }
    }
}

gradle.rootProject {
    tasks.register("buildClasspathInventory") {
        group = "verification"
        description = "Writes the plugin classpaths this build resolved to build/build-classpath/inventory.json"
        val output = layout.buildDirectory.file("build-classpath/inventory.json")
        val loads = buildClasspathLoads
        val document = provider {
            val graphs = synchronized(buildClasspathGraphs) { buildClasspathGraphs.values.toList() }
            buildClasspathJson(linkedMapOf(
                "schema" to "hushthreads-build-classpath-1",
                "gradle" to buildClasspathGradleVersion,
                "settingsScript" to linkedMapOf("path" to "settings.gradle.kts", "sha256" to buildClasspathSettingsSha256),
                "buildInputs" to buildClasspathInputs,
                "covers" to ("The classpath settings.gradle.kts resolved for its plugins block, which the build's " +
                    "plugins and tools run from, and every project's buildscript classpath. Each version is the one " +
                    "Gradle's resolution chose. A request for another version is listed under conflicts."),
                "leavesOut" to ("What the release bundle carries (the release SBOM lists that), the patcher-provided " +
                    "classpath, the compile-only, test and lint graphs, and the advisory comparator."),
                "loads" to loads,
                "graphs" to graphs,
            )) + "\n"
        }
        val expectedGraphs = listOf("settings classpath") + project.allprojects.map { buildClasspathProjectGraphName(it.path) }
        val missingGraphs = provider {
            val gathered = synchronized(buildClasspathGraphs) { buildClasspathGraphs.keys.toSet() }
            expectedGraphs.filter { it !in gathered }
        }
        // The Guava the plugins load has to be the one the settings classpath resolved.
        val resolvedGuava = provider {
            @Suppress("UNCHECKED_CAST")
            val settingsComponents = synchronized(buildClasspathGraphs) {
                buildClasspathGraphs["settings classpath"]?.get("components") as? List<Map<String, Any?>>
            }.orEmpty()
            settingsComponents.filter { it["group"] == "com.google.guava" && it["name"] == "guava" }.map { "guava-${it["version"]}.jar" }
        }
        inputs.property("inventory", document)
        outputs.file(output)
        doLast {
            // A refusal below must not leave an earlier run's inventory looking like this one's.
            val file = output.get().asFile
            file.delete()
            val missing = missingGraphs.get()
            if (missing.isNotEmpty()) {
                throw GradleException("The build classpath inventory has no graph for " + missing.joinToString(", ") +
                    ". Those projects weren't evaluated in this build; run it without configure-on-demand.")
            }
            val expected = resolvedGuava.get()
            if (expected.size != 1) {
                throw GradleException("The settings classpath resolved ${expected.size} Guava versions, not one: $expected")
            }
            val strays = loads.filter { it["jar"] != expected[0] }
            if (strays.isNotEmpty()) {
                throw GradleException("The plugins load Guava from somewhere other than the ${expected[0]} the settings classpath " +
                    "resolved: " + strays.joinToString("; ") { "${it["loader"]} ${it["class"]} from ${it["jar"] ?: "nowhere"}" })
            }

            file.parentFile.mkdirs()
            file.writeText(document.get(), Charsets.UTF_8)
        }
    }
}
