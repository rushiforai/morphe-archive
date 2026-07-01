import org.gradle.plugins.signing.Sign

group = "app.morphe"

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

tasks.withType<JavaCompile>().configureEach {
    options.release.set(17)
}

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    kotlinOptions.jvmTarget = "17"
}

val skipSigning = providers.gradleProperty("skipSigning")
    .map(String::toBoolean)
    .orElse(false)

tasks.withType<Sign>().configureEach {
    onlyIf { !skipSigning.get() }
}

patches {
    about {
        name = "TIDAL Debug Menu Patches"
        description = "Patches to enable TIDAL's debug menu"
        source = "https://github.com/eyalm2000/tidal-debug-menu"
        author = "eyalm"
        contact = "https://github.com/eyalm2000/tidal-debug-menu/issues"
        website = "https://github.com/eyalm2000/tidal-debug-menu"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    implementation(project(":shared-core"))
}

sourceSets {
    main {
        java.srcDir("../shared-core/src/main/java")
    }
}

configurations.configureEach {
    resolutionStrategy.eachDependency {
        if (requested.group == "com.github.iBotPeaches.smali" && requested.name == "smali") {
            useVersion("b6365a84f4")
            because("Morphe patcher currently resolves smali from JitPack commit coordinates")
        }
    }
}
