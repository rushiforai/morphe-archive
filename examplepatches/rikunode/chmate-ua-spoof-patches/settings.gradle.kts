rootProject.name = "chmate-ua-spoof-patches"
pluginManagement {
    // Pinned Morphe build logic as Git submodules (public MorpheApp sources), so building
    // does not need GitHub Packages credentials for the plugin or patcher.
    includeBuild("build-logic/morphe-patches-gradle-plugin")
    repositories {
        gradlePluginPortal()
        google()
        maven { url = uri("https://jitpack.io") }
    }
}
plugins { id("app.morphe.patches") version "1.3.3" }

includeBuild("build-logic/morphe-patcher")

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"
        // Must be absolute so subproject extensions resolve it.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
