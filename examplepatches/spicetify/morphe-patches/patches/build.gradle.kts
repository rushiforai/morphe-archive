group = "app.spicetify"

patches {
    about {
        name = "Spicetify Android patches"
        description = "Spotify Android customization patches compatible with Morphe"
        source = "https://github.com/spicetify/morphe-patches"
        author = "Spicetify"
        contact = "na"
        website = "https://github.com/spicetify/morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    testImplementation("org.junit.jupiter:junit-jupiter:5.11.4")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
    testImplementation(libs.morphe.patcher)
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

sourceSets.test {
    java.srcDir(rootProject.file("scripts"))
}

tasks.named<JavaCompile>("compileTestJava") {
    sourceCompatibility = "21"
    targetCompatibility = "21"
}

tasks.named<org.jetbrains.kotlin.gradle.tasks.KotlinJvmCompile>("compileTestKotlin") {
    compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21)
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

tasks.test {
    useJUnitPlatform()
    dependsOn("testArtifactVerifier")
}

tasks.register<JavaExec>("testArtifactVerifier") {
    dependsOn(tasks.testClasses)
    classpath = sourceSets.test.get().runtimeClasspath
    mainClass.set("VerifySharingDexTest")
}
