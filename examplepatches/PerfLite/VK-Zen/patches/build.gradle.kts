group = "app.morphe"

patches {
    about {
        name = "Patches Vk"
        description = "Patches for VKontakte (com.vkontakte.android)"
        source = "https://github.com/PerfLite/VK-Zen"
        author = "PerfLite"
        contact = "na"
        website = "https://github.com/PerfLite/VK-Zen"
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

    register<JavaExec>("patchVk") {
        description = "Applies Morphe patches to vk.apk and creates vk-morphe-cloned.apk"
        dependsOn("build")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.patches.vk.VkPatcherRunnerKt")
        maxHeapSize = "4g"

        val inputApk = project.rootProject.file("vk.apk").absolutePath
        val outputApk = project.rootProject.file("vk-morphe-cloned.apk").absolutePath
        args = listOf(inputApk, outputApk)
    }

    register<JavaExec>("injectIconsAndSign") {
        description = "Injects custom Zen icons and signs vk-morphe-cloned.apk"
        dependsOn("compileKotlin")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.patches.vk.misc.IconSignerKt")
        maxHeapSize = "2g"
    }

    publish {
        dependsOn("generatePatchesList")
    }

    named("build") {
        dependsOn("buildAndroid")
    }
}
