group = "app.morphe"

patches {
    about {
        name = "Patches VK Messenger"
        description = "Patches for VK Messenger (com.vk.im)"
        source = "https://github.com/PerfLite/morphe-patches-vk-messenger"
        author = "PerfLite"
        contact = "na"
        website = "https://github.com/PerfLite/morphe-patches-vk-messenger"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    implementation(libs.guava)
    implementation(libs.kotlinx.coroutines.core)
    implementation(libs.morphe.patcher)
    implementation(libs.morphe.patches.library)
    patchListGeneratorClasspath(libs.gson)
    compileOnly(project(":patches:stub"))
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn("buildAndroid")
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    register<JavaExec>("patchVkMessenger") {
        description = "Applies Morphe patches to VK Messenger APK/APKS and creates vk-messenger-morphe-cloned.apk"
        dependsOn("build")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.patches.vkmessenger.VkMessengerPatcherRunnerKt")
        maxHeapSize = "4g"

        val inputFiles = project.rootProject.projectDir.listFiles { f ->
            f.isFile && (f.name.endsWith(".apks", ignoreCase = true) || (f.name.endsWith(".apk", ignoreCase = true) && !f.name.contains("cloned", ignoreCase = true) && !f.name.contains("merged", ignoreCase = true)))
        }
        val inputApk = inputFiles?.firstOrNull()?.absolutePath ?: project.rootProject.file("vk-messenger.apk").absolutePath
        val outputApk = project.rootProject.file("vk-messenger-morphe-cloned.apk").absolutePath
        args = listOf(inputApk, outputApk)
    }

    publish {
        dependsOn("generatePatchesList")
    }

    named("build") {
        dependsOn("buildAndroid")
    }
}
