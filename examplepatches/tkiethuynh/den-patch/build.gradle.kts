plugins {
    kotlin("jvm") version "2.2.21"
    `maven-publish`
}

group = "app.tkiethuynh.denpatch"
version = providers.gradleProperty("version").getOrElse("1.0.0")

repositories {
    mavenLocal()
    mavenCentral()
    google()
    maven { url = uri("https://jitpack.io") }
    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR") ?: "token"
            password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
        }
    }
}

val d8 by configurations.creating
val patchListGeneratorClasspath by configurations.creating

dependencies {
    compileOnly("app.morphe:morphe-patcher:1.5.1")
    compileOnly("com.github.MorpheApp.smali:smali:b6365a84f4")
    compileOnly("com.google.code.gson:gson:2.11.0")
    patchListGeneratorClasspath("app.morphe:morphe-patcher:1.5.1")
    patchListGeneratorClasspath("com.github.MorpheApp.smali:smali:b6365a84f4")
    patchListGeneratorClasspath("com.google.code.gson:gson:2.11.0")
    d8("com.android.tools:r8:8.3.37")
}

sourceSets {
    main {
        java.srcDirs("patches/src/main/kotlin")
        resources.srcDirs("patches/src/main/resources")
    }
}

tasks.jar {
    archiveBaseName.set("den-patch")
    manifest.attributes(
        "Implementation-Title" to "Den Patches",
        "Implementation-Version" to project.version,
        "Version" to project.version,
        "Main-Class" to "",
        "Author" to "Kiet Huynh",
        "Source" to "https://github.com/tkiethuynh/den-patch",
        "License" to "GNU General Public License v3.0",
        "Patcher-Version" to "1.5.1"
    )
}

kotlin {
    compilerOptions.freeCompilerArgs.add("-Xcontext-parameters")
}

val dex = tasks.register<JavaExec>("dex") {
    dependsOn(tasks.jar)
    classpath = d8
    mainClass.set("com.android.tools.r8.D8")

    val jarFile = tasks.jar.flatMap { it.archiveFile }
    val outputDir = layout.buildDirectory.dir("dex")

    inputs.file(jarFile)
    outputs.dir(outputDir)

    doFirst {
        outputDir.get().asFile.mkdirs()
    }

    argumentProviders.add(CommandLineArgumentProvider {
        listOf(
            "--output", outputDir.get().asFile.absolutePath,
            "--min-api", "26",
            jarFile.get().asFile.absolutePath
        )
    })
}

val bundleMpp = tasks.register<Zip>("bundleMpp") {
    dependsOn(tasks.jar, dex)
    archiveBaseName.set("patches")
    archiveVersion.set(project.version.toString())
    archiveExtension.set("mpp")
    destinationDirectory.set(layout.buildDirectory.dir("libs"))

    from(zipTree(tasks.jar.flatMap { it.archiveFile }))
    from(layout.buildDirectory.dir("dex")) {
        include("classes.dex")
    }
}

tasks.register("buildAndroid") {
    dependsOn(tasks.jar, bundleMpp)
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Build patch with patch list"
    dependsOn("buildAndroid")
    classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
    mainClass.set("util.PatchListGeneratorKt")
}

tasks.named("publish") {
    dependsOn("generatePatchesList")
}


