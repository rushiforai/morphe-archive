group = "app.ytvr"

patches {
    about {
        name = "YouTube VR Patches"
        description = "Morphe patches for YouTube VR on Meta Quest"
        source = "https://github.com/WalkTheEarth/morphe-ytvr-patches.git"
        author = "WalkTheEarth"
        contact = "https://github.com/WalkTheEarth"
        website = "https://github.com/WalkTheEarth/morphe-ytvr-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

// Locates a tool jar without baking anybody's home directory into this file:
// -P<propertyName>=<path>, else $<envName>, else <tools dir>/<relative> where the
// tools dir is $TOOLS_DIR or ~/tools. Override per machine, not in the repository.
fun toolJar(propertyName: String, envName: String, relative: String): File {
    providers.gradleProperty(propertyName).orNull?.let { return file(it) }
    providers.environmentVariable(envName).orNull?.let { return file(it) }
    val toolsDir = providers.environmentVariable("TOOLS_DIR").orNull
        ?: File(System.getProperty("user.home"), "tools").absolutePath
    return file("$toolsDir/$relative")
}

// Android platform jar, needed once the extension touches Android APIs (WebView,
// Looper, ...). Pass -PandroidJar=<path> or $ANDROID_JAR, or keep it at ~/tools/android.
val androidJar = toolJar("androidJar", "ANDROID_JAR", "android/android.jar")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // The tests exercise the compiled patch classes (SettingsXmlKt) and, through the
    // extension sources added to the test source set below, the extension's own Java. The
    // patcher is needed for PatchException; whether the plugin hands it to `implementation`
    // or `compileOnly` is its business, so the test needs its own explicit copy.
    testImplementation(libs.junit.jupiter)
    testImplementation(libs.morphe.patcher)
    // The Morphe plugin does not put the main output on the test compilation's classpath (the
    // default java-plugin wiring does not survive its source-set reconfiguration), so the tests
    // that exercise the patch's own classes -- SettingsXmlKt -- need it added by hand.
    testImplementation(files(sourceSets["main"].output))
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
    // The extension sources import android.* but the tested paths are pure statics that
    // never touch a runtime object -- the stubbed android.jar is enough to compile, and the
    // test JVM needs it too just to load (and then skip) the classes that do import android.
    testCompileOnly(files(androidJar))
    testRuntimeOnly(files(androidJar))
}

// The headless harnesses that used to live in gitignored build/probe tested the extension's
// Java (SponsorBlockSettings, VerboseLog) by compiling it against the stubbed android.jar;
// as JUnit tests they live with the code, and `check` runs them on every build.
sourceSets["test"].java.srcDir(rootDir.resolve("extensions/src"))

tasks.withType<Test>().configureEach {
    useJUnitPlatform()
    // Sequential in one JVM: SponsorBlockSettings and VerboseLog carry static state
    // (the configured behaviour map, the log gate) and one test's configuration must not
    // leak into the next class in the suite.
    systemProperty("junit.jupiter.execution.parallel.enabled", "false")
}

// The plugin configures javac for the extension dex (a lower target for minApi); the tests
// run on the build JVM, so they need the full release -- and the Kotlin test compilation must
// agree, or the JVM-target validation fails the pair.
tasks.named<JavaCompile>("compileTestJava") {
    sourceCompatibility = "21"
    targetCompatibility = "21"
}
tasks.matching { it.name == "compileTestKotlin" }.configureEach {
    (this as org.jetbrains.kotlin.gradle.tasks.KotlinCompile).compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21)
    }
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

// --- Extension dex (see docs/INTERNALS.md) -------------------------------------
// Compiles extensions/src/*.java, dexes it with d8, and ships the dex inside the
// patch bundle as `ytvr-extension.dex`, where the injection patch streams it into
// the app via BytecodePatchBuilder.extendWith.
// d8 comes from R8, which is not part of any Android SDK here: pass
// -Pr8Jar=<path> or $R8_JAR, or keep it at ~/tools/r8/r8.jar.
val extensionClassesDir = layout.buildDirectory.dir("extension/classes")
val extensionDexDir = layout.buildDirectory.dir("extension/dex")
val extensionResourceDir = layout.buildDirectory.dir("generated/extension-resources")

fun jdkTool(name: String): String =
    File(System.getProperty("java.home"), "bin/$name").absolutePath

val compileExtension by tasks.registering(Exec::class) {
    description = "Compiles the YouTube VR patch extension sources."
    val sources = fileTree("$rootDir/extensions/src") { include("**/*.java") }
    inputs.files(sources)
    inputs.file(androidJar)
    outputs.dir(extensionClassesDir)
    doFirst {
        check(androidJar.exists()) {
            "android.jar not found at ${androidJar.path}. Download an SDK platform and " +
                "pass -PandroidJar=<path>; see README.md (Requirements and tooling)."
        }
        // javac does not delete classes whose sources are gone, and the extension dex is built
        // from this directory -- so a deleted source kept shipping inside the bundle (a removed
        // ProtoUrlRewriter.class did exactly that). Always compile from a clean directory.
        extensionClassesDir.get().asFile.deleteRecursively()
        extensionClassesDir.get().asFile.mkdirs()
        commandLine(
            jdkTool("javac"),
            "-Xlint:all",
            "-classpath", androidJar.absolutePath,
            "-d", extensionClassesDir.get().asFile.absolutePath,
            *sources.files.map { it.absolutePath }.sorted().toTypedArray()
        )
    }
}

val dexyExtension by tasks.registering(Exec::class) {
    description = "Dexes the extension with d8."
    dependsOn(compileExtension)
    val r8Jar = toolJar("r8Jar", "R8_JAR", "r8/r8.jar")
    // d8 rejects a bare directory here; hand it the class files individually.
    val classFiles = fileTree(extensionClassesDir) { include("**/*.class") }
    inputs.files(classFiles)
    inputs.file(r8Jar)
    inputs.file(androidJar)
    outputs.dir(extensionDexDir)
    doFirst {
        check(r8Jar.exists()) {
            "d8 not found at ${r8Jar.path}. Download R8 from Google Maven " +
                "(com.android.tools:r8) and pass -Pr8Jar=<path>; see README.md (Requirements and tooling)."
        }
        check(classFiles.files.isNotEmpty()) {
            "No extension classes found in ${extensionClassesDir.get().asFile.path}."
        }
        extensionDexDir.get().asFile.mkdirs()
        commandLine(
            jdkTool("java"), "-cp", r8Jar.absolutePath,
            "com.android.tools.r8.D8", "--min-api", "26", "--release",
            "--lib", androidJar.absolutePath,
            "--output", extensionDexDir.get().asFile.absolutePath,
            *classFiles.files.map { it.absolutePath }.sorted().toTypedArray()
        )
    }
}

val packageExtensionDex by tasks.registering(Copy::class) {
    description = "Puts the extension dex into the bundle resources."
    dependsOn(dexyExtension)
    from(extensionDexDir) {
        include("classes.dex")
        rename { "ytvr-extension.dex" }
    }
    into(extensionResourceDir)
}

sourceSets["main"].resources.srcDir(extensionResourceDir)
tasks.named("processResources") { dependsOn(packageExtensionDex) }

// The build plugin's `sourcesJar` also consumes this source set's resources, so the dependency
// has to be declared explicitly. Without it Gradle 9 fails the build with an "implicit
// dependency" validation problem on `patches/build/generated/extension-resources`, which breaks
// `generatePatchesList` -- the very task the release pipeline runs before publishing, so every
// release aborted before it could create a release.
tasks.matching { it.name == "sourcesJar" }.configureEach { dependsOn(packageExtensionDex) }

// `generatePatchesList` writes the patch list but takes the version from somewhere other than
// `gradle.properties` (it emitted 1.0.0 while the property said 1.1.0), so running it outside a
// release silently downgraded the published index. Stamp the version the project actually has;
// the release pipeline's `jq` step writes the same value, and `gradle.properties` is where
// semantic-release keeps it.
tasks.matching { it.name == "generatePatchesList" }.configureEach {
    doLast {
        val listFile = rootProject.file("patches-list.json")
        if (!listFile.exists()) return@doLast
        val declared = providers.gradleProperty("version").getOrElse(project.version.toString())
        val text = listFile.readText()
        val stamped = Regex("(\"version\"\\s*:\\s*\")[^\"]*(\")").replaceFirst(text, "$1$declared$2")
        if (stamped != text) {
            listFile.writeText(stamped)
            logger.lifecycle("generatePatchesList: stamped patches-list.json with version $declared")
        }
    }
}
