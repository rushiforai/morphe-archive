import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group = "app.nyandex"

patches {
    about {
        name = "Nyandex"
        description = "Патчи на Яндекс Музыку: кастомные тексты песен LRCLIB, Monet тема, кастомизация и приватность."
        source = "git@github.com:Ser1-1y/nyandex.git"
        author = "Nyandex contributors"
        contact = "https://github.com/Ser1-1y/nyandex/issues"
        website = "https://github.com/Ser1-1y/nyandex"
        license = "GPLv3"
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Morphe's universal signature spoof, used by "Spoof app signature".
    implementation(libs.morphe.patches.library)

    testImplementation(kotlin("test"))
    testImplementation(libs.kotlinx.coroutines.core)
    testRuntimeOnly(libs.junit.jupiter.engine)
}

tasks {
    test {
        useJUnitPlatform()
        // The integration tests need a stock APK and are skipped otherwise:
        // YM_APK=/path/to/base.apk ./gradlew :patches:test
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
