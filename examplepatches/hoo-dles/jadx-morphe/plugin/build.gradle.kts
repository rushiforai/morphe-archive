import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    alias(libs.plugins.kotlin)
    `java-library`
    alias(libs.plugins.shadow)
}

dependencies {
    val isJadxSnapshot = libs.versions.jadx.toString().endsWith("-SNAPSHOT")
    compileOnly(libs.bundles.jadx) {
        isChanging = isJadxSnapshot

    }
    implementation(libs.flatlaf)
    implementation(libs.flatlaf.extras)
    implementation(libs.rsyntaxtextarea)
    implementation(libs.autocomplete)

    implementation(libs.bundles.logging)
    implementation(libs.bundles.scripting)

    api(libs.bundles.morphe)

    testImplementation(platform(libs.junit.bom))
    testImplementation(libs.junit.jupiter)
    testImplementation(libs.kotlin.test)
    implementation(libs.kotlinx.coroutines.core)
    implementation(libs.kotlinx.coroutines.swing)
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}
kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_11)
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
    jvmToolchain(11)
}

sourceSets {
    main {
        resources.srcDirs("resources")
    }
}

tasks {
    test {
        useJUnitPlatform()
        testLogging {
            events("passed", "skipped", "failed")
        }
    }
    shadowJar {
        archiveBaseName.set("jadx-morphe")
        archiveClassifier.set("")
        // Make sure service files are properly merged
        mergeServiceFiles()
        relocate("com.google.common", "shadow.com.google.common")
    }

    // copy result jar into "build/dist" directory
    register<Copy>("dist") {
        dependsOn(shadowJar)
        dependsOn(withType(Jar::class))

        from(shadowJar)
        into(layout.buildDirectory.dir("dist"))
    }
}