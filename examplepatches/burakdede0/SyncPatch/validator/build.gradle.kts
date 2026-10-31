plugins {
    kotlin("jvm")
    application
}

// Runtime dependencies of the locally built app.morphe:morphe-patcher jar.
// Normally these would come transitively from its Maven publication; declaring them
// here keeps the build self-contained for a jar checked into libs/.
dependencies {
    implementation(files("$rootDir/libs/morphe-patcher-1.15.1.jar"))

    implementation("org.jetbrains.kotlin:kotlin-stdlib:2.4.10")
    implementation("org.jetbrains.kotlin:kotlin-reflect:2.4.10")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.1")
    implementation("org.bouncycastle:bcpkix-jdk18on:1.77")
    implementation("com.google.guava:guava:33.5.0-jre")
    implementation("com.android.tools.build:apksig:9.1.1")
    implementation("com.android.tools.build:apkzlib:9.1.1")
    implementation("com.github.MorpheApp:ARSCLib:9b742c412d")
    implementation("com.github.MorpheApp.smali:smali-dexlib2:d856bad65f")
    implementation("com.github.MorpheApp.smali:smali:d856bad65f")
}

application {
    mainClass = "app.syncpatches.validator.ValidatePatchesKt"
    applicationDefaultJvmArgs = listOf(
        "-Dvalidate.apk=$rootDir/sync.apk",
        "-Dvalidate.mpp=$rootDir/patches.mpp",
    )
}

task("printRuntimeClasspath") {
    doLast {
        println(sourceSets["main"].runtimeClasspath.asPath)
    }
}
