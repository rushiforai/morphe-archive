plugins {
    id("ru.vyarus.animalsniffer")
}

group = "app.crimera"

patches {
    about {
        name = "Piko IG Lite"
        description = "Lean Morphe patches for Instagram"
        source = "git@github.com:crimera/piko-ig-lite.git"
        author = "crimera"
        contact = "na"
        website = "https://github.com/crimera/piko-ig-lite"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    // Patch code runs inside Morphe Manager, whose bundle is dexed with D8 --min-api 26. The
    // supported Instagram builds start at API 28; the extension floor is 26, so the patch gate
    // uses the loosest value that can actually execute (re-check when the oldest target moves).
    add("signature", "com.toasttab.android:gummy-bears-api-26:0.15.0@signature")

    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")

    // Used by JsonGenerator.
    implementation(libs.gson)

    implementation(libs.morphe.patches.library)

    // Shared patch infrastructure and resolver safeguards.
    // https://github.com/crimera/piko-patches-library
    implementation(libs.piko.patches.library)

    // Typed Dalvik emission (https://github.com/crimera/morphe-bytecode).
    implementation("crimera:morphe-bytecode:0.1.3")

    testImplementation(kotlin("test"))
}

tasks {
    matching { it.name == "check" || it.name == "buildAndroid" || it.name == "jar" }.configureEach {
        dependsOn("animalsnifferMain")
    }

    register<JavaExec>("lintResolvers") {
        description = "Checks patch-time resolver code for unsafe candidate selection and nullable fallthrough"
        group = "verification"

        dependsOn(classes)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.crimera.tools.lint.ResolverLinterKt")
        args(
            providers.gradleProperty("resolverSourceRoots").orElse(
                rootProject.projectDir.resolve("patches/src/main/kotlin/app/crimera/patches/instagram").absolutePath,
            ).get()
                .split(','),
        )
        if (providers.gradleProperty("resolverLintReportOnly").isPresent) {
            args("--report-only")
        }
    }

    register<JavaExec>("checkExtensionDescriptors") {
        description = "Checks patch-side extension descriptors against the built extension dex files"
        group = "verification"

        dependsOn(classes)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.crimera.tools.lint.ExtensionDescriptorLinterKt")
        args(
            "--extensions=${layout.buildDirectory.dir("resources/main/extensions").get().asFile.absolutePath}",
            "--sources=${projectDir.resolve("src/main/kotlin").absolutePath}",
        )
        if (providers.gradleProperty("extensionDescriptorReportOnly").isPresent) {
            args("--report-only")
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
