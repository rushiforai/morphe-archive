import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group = "app.morphe.addon.m3redesign"

patches {
    about {
        name = "M3-Redesign"
        description = "Standalone Material 3 Expressive navigation bar and miniplayer redesign add-on for YouTube Music"
        source = "https://github.com/iAmGodKiller/M3-Redesign"
        author = "iAmGodKiller"
        contact = "https://github.com/iAmGodKiller/M3-Redesign/issues"
        website = "https://github.com/iAmGodKiller/M3-Redesign"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

configurations.compileClasspath {
    attributes {
        attribute(LibraryElements.LIBRARY_ELEMENTS_ATTRIBUTE, objects.named(LibraryElements.JAR))
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }

    sourceSets {
        named("main") {
            kotlin.setIncludes(
                listOf(
                    "app/morphe/patches/music/layout/miniplayer/m3navigation/**",
                    "app/morphe/patches/music/misc/playservice/**",
                    "app/morphe/patches/music/shared/Constants.kt",
                    "app/morphe/patches/music/misc/gms/Constants.kt",
                    "app/morphe/patches/youtube/layout/fullscreen/**",
                    "app/morphe/patches/youtube/shared/Constants.kt",
                    "app/morphe/patches/all/misc/version/**",
                    "app/morphe/util/**"
                )
            )
        }
        named("test") {
            kotlin.setIncludes(emptyList())
        }
    }
}

dependencies {
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)
    patchListGeneratorClasspath(libs.gson)
    compileOnly(project(":patches:stub"))
}

tasks {
    processResources {
        exclude(
            "extensions/youtube.mpe",
            "extensions/shared-youtube.mpe",
            "extensions/shared.mpe",
            "extensions/reddit.mpe",
            "extensions/all/**"
        )
    }

    test {
        enabled = false
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
