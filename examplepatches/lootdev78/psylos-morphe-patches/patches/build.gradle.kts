val repositorySlug = System.getenv("GITHUB_REPOSITORY")
    ?.takeIf { it.isNotBlank() }
    ?: "lootdev78/psylos-morphe-patches"

group = "psylos.morphe"

patches {
    about {
        name = "Psylos Morphe Patches"
        description = "SoundCloud-only patches for use with Morphe"
        source = "https://github.com/$repositorySlug"
        author = "Psylos"
        contact = "https://github.com/lootdev78"
        website = "https://github.com/$repositorySlug"
        license = "GPLv3"
    }
}

repositories {
    google()
    mavenCentral()
    maven {
        name = "GitHubPackages"
        url = uri("https://maven.pkg.github.com/MorpheApp/registry")
        credentials {
            username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
            password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
        }
    }
    maven { url = uri("https://jitpack.io") }
}

dependencies {
    // Needed at runtime by the patch list generator.
    implementation(libs.gson)

    // Required by the current smali dependency graph.
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)

    compileOnly(project(":patches:stub"))
    compileOnly(libs.android.all)
    compileOnly(libs.slf4j.api)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
    jvmToolchain(17)
}

java {
    targetCompatibility = JavaVersion.VERSION_17
    sourceCompatibility = JavaVersion.VERSION_17
}
