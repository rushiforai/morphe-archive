group = "suchi.morphe"

patches {
    about {
        name = "Suchi Patches"
        description = "A personal collection of experimental app patches"
        source = "git@github.com:MangoTornado/morphe-patches-suchi.git"
        author = "MangoTornado"
        contact = "mangoinsight@gmail.com"
        website = "https://github.com/MangoTornado/morphe-patches-suchi"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.morphe.patcher)
    testImplementation("junit:junit:4.13.2")
}

sourceSets["test"].java.srcDirs(
    "../tests",
    "../extensions/renshuu/src/main/java",
    "../extensions/duchinese/src/main/java",
)

tasks {
    withType<JavaCompile>().configureEach {
        options.release.set(17)
    }

    withType<org.jetbrains.kotlin.gradle.tasks.KotlinJvmCompile>().configureEach {
        compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }

    test {
        useJUnit()
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
