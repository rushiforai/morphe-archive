import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    alias(libs.plugins.android.library)
    alias(libs.plugins.binary.compatibility.validator)
    alias(libs.plugins.kotlin.multiplatform)
    alias(libs.plugins.kotlin.serialization)
    `maven-publish`
    signing
}

group = "app.morphe"

// Because access to the project is necessary to authenticate with GitHub,
// the following block must be placed in the root build.gradle.kts file
// instead of the settings.gradle.kts file inside the dependencyResolutionManagement block.
repositories {
    mavenLocal()
    mavenCentral()
    google()
    maven {
        // A repository must be specified for some reason. "registry" is a dummy.
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = project.findProperty("gpr.user") as String? ?: System.getenv("GITHUB_ACTOR")
            password = project.findProperty("gpr.key") as String? ?: System.getenv("GITHUB_TOKEN")
        }
    }
    maven { url = uri("https://jitpack.io") }
}

kotlin {
    jvm {
        compilerOptions {
            jvmTarget = JvmTarget.JVM_11
        }
    }

    androidTarget {
        compilerOptions {
            jvmTarget = JvmTarget.JVM_11
        }

        publishLibraryVariants("release")
    }

    sourceSets {
        androidMain.dependencies {
            implementation(libs.core.ktx)
            implementation(libs.libsu.nio)
            implementation(libs.libsu.service)
        }

        commonMain.dependencies {
            implementation(libs.guava)
            implementation(libs.jadb)
            implementation(libs.kotlin.reflect)
        }

        commonTest.dependencies {
            implementation(libs.kotlin.test.junit)
        }
    }
}

android {
    namespace = "app.morphe.library"
    compileSdk = 35
    defaultConfig {
        minSdk = 26
    }

    buildFeatures {
        aidl = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}

java {
    targetCompatibility = JavaVersion.VERSION_11
}

publishing {
    repositories {
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/morphe-library")
            credentials {
                username = project.findProperty("gpr.user") as String? ?: System.getenv("GITHUB_ACTOR")
                password = project.findProperty("gpr.key") as String? ?: System.getenv("GITHUB_TOKEN")
            }
        }
    }

    // KMP plugin creates a publication already, so just configure the POM.
    publications.all {
        if (this !is MavenPublication) return@all

        pom {
            name = "Morphe Library"
            description = "Library containing common utilities for Morphe"
            url = "https://morphe.software"

            licenses {
                license {
                    name = "GNU General Public License v3.0"
                    url = "https://www.gnu.org/licenses/gpl-3.0.en.html"
                    comments = "Additional conditions under GPL section 7 apply: attribution and project name restrictions. See LICENSE file."
                }
            }

            developers {
                developer {
                    id = "Morphe"
                    name = "Morphe"
                    email = "contact@morphe.software"
                }
            }

            scm {
                connection = "scm:git:git://github.com/MorpheApp/morphe-library.git"
                developerConnection = "scm:git:git@github.com:MorpheApp/morphe-library.git"
                url = "https://github.com/MorpheApp/morphe-library"
            }
        }
    }
}

signing {
    useGpgCmd()
    sign(publishing.publications)
}
