group = "app.hemk651"

patches {
    about {
        name = "Meta Patches"
        description = "Morphe patches for Instagram"
        source = "https://github.com/hemk651/meta-patches"
        author = "hemk651"
        contact = "https://github.com/hemk651"
        website = "https://github.com/hemk651/meta-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.coroutines.core)
}

tasks {
    test {
        // The test sources are verification harnesses with main() entry points
        // (:patches:instagramApkBuild, :patches:dexHierarchyCheck), not JUnit
        // tests, so the test task legitimately discovers none.
        failOnNoDiscoveredTests = false
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("instagramApkBuild") {
        description = "Apply all patches to a stock Instagram APK and verify the DEX"
        dependsOn(compileTestKotlin)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("util.InstagramApkBuildKt")
        // The cross-DEX class hierarchy verification of the large Instagram
        // DEX files needs more than the default heap fraction.
        jvmArgs("-Xmx2g")
    }

    register<JavaExec>("dexHierarchyCheck") {
        description = "Run the cross-DEX class hierarchy verification on a DEX directory"
        dependsOn(compileTestKotlin)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("util.DexHierarchyCheckKt")
        jvmArgs("-Xmx2g")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
