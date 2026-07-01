import org.jetbrains.kotlin.gradle.dsl.JvmTarget

configurations {
    create("toRelocate")
    create("bundleAsIs")
}

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
    implementation(libs.kotlinx.coroutines.core)
    implementation(libs.kotlinx.coroutines.swing)
    implementation(libs.bundles.logging)
    implementation(libs.bundles.scripting)

    implementation(libs.bundles.morphe)
    "toRelocate"(libs.bundles.morphe)

    testImplementation(platform(libs.junit.bom))
    testImplementation(libs.junit.jupiter)
    testImplementation(libs.kotlin.test)
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
        archiveBaseName.set(rootProject.name)
        archiveClassifier.set("")

        configurations = listOf(project.configurations["toRelocate"])

        relocate("com.android.tools.smali", "shadow.com.android.tools.smali")

        // Also include your own compiled classes
        from(sourceSets.main.get().output)
    }

    register<Copy>("copyUnbundledDeps") {
        from(provider {
            val toRelocate = configurations["toRelocate"]
                .resolvedConfiguration.resolvedArtifacts
                .map { it.file }
                .toSet()

            configurations.runtimeClasspath.get().filter { it !in toRelocate }
        })
        into(shadowJar.get().destinationDirectory)
    }

    register<Zip>("dist") {
        dependsOn(shadowJar, "copyUnbundledDeps")

        archiveBaseName.set(rootProject.name)

        from(shadowJar.get().destinationDirectory)
        include("*.jar")

        destinationDirectory.set(layout.buildDirectory.dir("dist"))
    }
}