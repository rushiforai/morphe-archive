group = "dev.lumi.dcinside"

patches {
    about {
        name = "Lumi DC Inside patches"
        description = "Personal DC Inside APK clean-up patches"
        source = "https://github.com/Lumi-01/dcinside-personal-patches"
        author = "Lumi-01"
        contact = "https://github.com/Lumi-01/dcinside-personal-patches/issues"
        website = "https://github.com/Lumi-01/dcinside-personal-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
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

// Match the patch bundle JVM target when Java helpers are present.
tasks.withType<JavaCompile>().configureEach { options.release.set(17) }
tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinJvmCompile>().configureEach {
    compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
}
