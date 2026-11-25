extension {
    name = "extensions/waze.mpe"
}

// Consume only the native API: the AAR's Java facade has an unrelated compileSdk 37 floor.
val nativeShadowHook by configurations.creating {
    isCanBeConsumed = false
    isTransitive = false
}
val shadowHookDirectory = layout.buildDirectory.dir("generated/shadowhook")
val unpackNativeShadowHook = tasks.register<Sync>("unpackNativeShadowHook") {
    from(nativeShadowHook.map { zipTree(it) })
    include("prefab/modules/shadowhook/include/**", "jni/arm64-v8a/*.so")
    into(shadowHookDirectory)
}

// ShadowHook must dlopen its helper after installing constructor observation. Keep the
// helper off DT_NEEDED and let the dependency find it beside itself in extracted assets.
val shadowHookRuntime = layout.buildDirectory.dir("generated/shadowhook-runtime/jni/arm64-v8a")
val prepareNativeShadowHook = tasks.register("prepareNativeShadowHook") {
    dependsOn(unpackNativeShadowHook)
    inputs.dir(shadowHookDirectory.map { it.dir("jni/arm64-v8a") })
    outputs.dir(shadowHookRuntime)
    doLast {
        val destination = shadowHookRuntime.get().asFile
        destination.mkdirs()
        for (name in listOf("libshadowhook.so", "libshadowhook_nothing.so")) {
            shadowHookDirectory.get().file("jni/arm64-v8a/$name").asFile.copyTo(destination.resolve(name), overwrite = true)
        }
        // Direct process arguments preserve the ELF token; no shell expansion is involved.
        // patchelf is not packaged for Windows; without it the helper simply keeps its original
        // rpath, which only affects the Waze tile-camera native bridge, not the Maps patches.
        try {
            providers.exec {
                commandLine("patchelf", "--set-rpath", "\$ORIGIN", destination.resolve("libshadowhook.so").absolutePath)
            }.result.get().assertNormalExitValue()
        } catch (missing: Exception) {
            logger.warn("patchelf unavailable; libshadowhook.so keeps its original rpath")
        }
    }
}

dependencies {
    add(nativeShadowHook.name, "com.bytedance.android:shadowhook:2.0.1@aar")
    compileOnly(project(":extensions:waze:stub"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
    testImplementation("androidx.car.app:app:1.8.0-rc01")
}

android {
    ndkVersion = "27.2.12479018"
    externalNativeBuild {
        cmake { path = file("src/main/cpp/CMakeLists.txt"); version = "3.22.1" }
    }
    sourceSets.getByName("main").jniLibs.srcDir(shadowHookRuntime.get().asFile.parentFile)
    namespace = "app.wazeytm.extension.waze"
    sourceSets.getByName("main").java.srcDir(rootProject.file("support/navigation-startup/src/main/java"))
    sourceSets.getByName("main").java.srcDir(rootProject.file("support/navigation/src/main/java"))
    sourceSets.getByName("main").java.srcDir(rootProject.file("support/navigation-alerts/src/main/java"))
    defaultConfig {
        minSdk = 32
        ndk { abiFilters += "arm64-v8a" }
        externalNativeBuild { cmake {
            arguments += "-DANDROID_STL=c++_static"
            arguments += "-DSHADOWHOOK_ROOT=${shadowHookDirectory.get().asFile.absolutePath}"
            arguments += "-DSHADOWHOOK_LIBRARY=${shadowHookRuntime.get().file("libshadowhook.so").asFile.absolutePath}"
        } }
    }
    testOptions { unitTests.isIncludeAndroidResources = true }
    buildTypes { getByName("release") { proguardFiles("proguard-rules.pro") } }
}
tasks.named("preBuild") { dependsOn(prepareNativeShadowHook) }
tasks.configureEach {
    if (name.startsWith("configureCMake") || name.startsWith("buildCMake")) dependsOn(prepareNativeShadowHook)
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
