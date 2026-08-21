plugins {
    kotlin("jvm") version "2.2.21"
    `maven-publish`
}

group = "anxyis.morphe"

repositories {
    mavenLocal()
    google()
    mavenCentral()
    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR") ?: "anxyis"
            password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
        }
    }
    maven {
        url = uri("https://jitpack.io")
        content {
            includeGroup("com.github.MorpheApp.smali")
            includeGroup("com.github.REAndroid")
        }
    }
}

val d8Configuration = configurations.create("d8Configuration")

dependencies {
    implementation("app.morphe:morphe-patcher:1.9.0")
    implementation("com.google.code.gson:gson:2.11.0")
    implementation("com.google.guava:guava:33.3.1-jre")
    implementation("com.github.MorpheApp.smali:smali:d856bad65f")
    implementation("com.github.REAndroid:arsclib:a28c6fb2a7")

    "d8Configuration"("com.android.tools:r8:8.8.27")

    testImplementation(kotlin("test"))
    testImplementation("org.junit.jupiter:junit-jupiter:5.10.1")
}

kotlin {
    jvmToolchain(17)
    compilerOptions {
        freeCompilerArgs.addAll(
            "-Xcontext-receivers",
            "-opt-in=app.morphe.patcher.InternalApi"
        )
    }
}

tasks {
    test {
        useJUnitPlatform()
    }

    val dexOutDir = layout.buildDirectory.dir("dex")

    val dexClasses = register<JavaExec>("dexClasses") {
        dependsOn("classes")
        classpath = d8Configuration
        mainClass.set("com.android.tools.r8.D8")
        jvmArgs = listOf("-Xmx512m")
        
        doFirst {
            val out = dexOutDir.get().asFile
            out.mkdirs()
            val classFiles = sourceSets["main"].output.classesDirs.asFileTree.files.filter { it.extension == "class" }
            args = listOf(
                "--output", out.absolutePath,
                "--min-api", "26"
            ) + classFiles.map { it.absolutePath }
        }
    }

    // Build .mpp patch bundle matching semantic-release naming and containing classes.dex
    register<Jar>("buildPatchBundle") {
        dependsOn(dexClasses)
        archiveBaseName.set("patches")
        archiveVersion.set(project.version.toString())
        archiveExtension.set("mpp")
        from(sourceSets["main"].output)
        from(dexOutDir)

        manifest {
            attributes(
                "Name" to "anxy Morphe Patches",
                "Version" to project.version.toString(),
                "Description" to "Popup suppression patches for After Motion Z+ and Alight Motion Pro",
                "Author" to "anxyis",
                "License" to "GPLv3",
                "Patcher-Version" to "1.8.0"
            )
        }
    }

    build {
        dependsOn("buildPatchBundle")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("anxyis.morphe.util.PatchListGeneratorKt")
        jvmArgs = listOf("-Xmx512m")
    }
}
