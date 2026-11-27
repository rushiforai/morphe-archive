import org.gradle.jvm.tasks.Jar

group = "dev.abotmaker.ramblerenhancements"

val patchMetadataSourceSet = sourceSets.create("patchMetadata") {
    java.srcDir("src/patchMetadata/kotlin")
}
patchMetadataSourceSet.compileClasspath += sourceSets.main.get().output
patchMetadataSourceSet.runtimeClasspath += sourceSets.main.get().output

val utf8Bom = byteArrayOf(0xEF.toByte(), 0xBB.toByte(), 0xBF.toByte())

configurations.named(patchMetadataSourceSet.implementationConfigurationName) {
    extendsFrom(configurations["implementation"])
}

patches {
    about {
        name = "Gboard Rambler Enhancements"
        description = "Hex waveforms + Rambler productivity suite for Gboard: Long-press Spacebar trigger, Smart Search Bars, Toolbar button, Fix & Learn, Per-App Instructions, Snippets, Find & Replace, Dictation Stats/History, Personal Dictionary, Contacts & JSON Backup."
        source = "git@github.com:abotmaker/gboard-rambler-enhancements.git"
        author = "abotmaker"
        contact = "https://github.com/abotmaker/gboard-rambler-enhancements/issues"
        website = "https://github.com/abotmaker/gboard-rambler-enhancements"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    implementation(libs.gson)
    add(patchMetadataSourceSet.implementationConfigurationName, libs.gson)
    testImplementation(libs.gson)
    testImplementation("junit:junit:4.13.2")
}

tasks {
    val syncExtensionTask = project(":extensions:extension").tasks.named("syncExtension")

    named<Jar>("jar") {
        dependsOn(syncExtensionTask)
    }

    named<Test>("test") {
        dependsOn(named<Jar>("jar"), syncExtensionTask)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Generate patches-list.json from the built Morphe patch bundle."
        dependsOn(build, patchMetadataSourceSet.classesTaskName)
        classpath = patchMetadataSourceSet.runtimeClasspath
        mainClass.set("dev.abotmaker.ramblerenhancements.util.PatchListGeneratorKt")
    }

    register("normalizePatchMetadataEncoding") {
        description = "Ensure generated patch metadata JSON files use UTF-8 without BOM."
        doLast {
            listOf(
                rootProject.file("patches-bundle.json"),
                rootProject.file("patches-list.json"),
            ).forEach { jsonFile ->
                if (!jsonFile.exists()) return@forEach
                val bytes = jsonFile.readBytes()
                if (bytes.size >= utf8Bom.size &&
                    utf8Bom.indices.all { index -> bytes[index] == utf8Bom[index] }
                ) {
                    jsonFile.writeBytes(bytes.copyOfRange(utf8Bom.size, bytes.size))
                }
            }
        }
    }

    named("generatePatchesList") {
        finalizedBy("normalizePatchMetadataEncoding")
    }
}
