import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    alias(libs.plugins.kotlin)
    `java-gradle-plugin`
    `maven-publish`
    signing
}

group = "app.morphe"

repositories {
    mavenLocal()
    mavenCentral()
    google()
}

dependencies {
    implementation(libs.android.application)
    implementation(libs.guava)
    implementation(libs.kotlin)

    implementation(gradleApi())
    implementation(gradleKotlinDsl())
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11

    withSourcesJar()
    withJavadocJar()
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_11)
    }
}

gradlePlugin {
    website = "https://morphe.software"
    vcsUrl = "ssh://git@github.com:MorpheApp/morphe-patches-gradle-plugin.git"

    plugins {
        create("patchesSettingsPlugin") {
            id = "app.morphe.patches"
            implementationClass = "app.morphe.patches.gradle.SettingsPlugin"
            version = version
            description = "Plugin to configure a Morphe Patches project."
            displayName = "Morphe Patches Gradle settings plugin"
        }
    }
}

publishing {
    repositories {
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/morphe-patches-gradle-plugin")
            credentials {
                username = System.getenv("GITHUB_ACTOR")
                password = System.getenv("GITHUB_TOKEN")
            }
        }
    }
}

signing {
    useGpgCmd()

    sign(publishing.publications)
}
