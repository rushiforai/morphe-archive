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

val nativeBridgeOutput = layout.buildDirectory.dir("generated/native-settings")
val nativeBridgeAssembler = configurations.create("nativeBridgeAssembler")
dependencies {
    nativeBridgeAssembler("com.github.MorpheApp.smali:smali:d92701d947")
}
val assembleNativeSettings = tasks.register<JavaExec>("assembleNativeSettings") {
    classpath = nativeBridgeAssembler
    mainClass.set("com.android.tools.smali.smali.Main")
    inputs.dir("src/main/smali")
    outputs.dir(nativeBridgeOutput)
    doFirst { nativeBridgeOutput.get().dir("extensions").asFile.mkdirs() }
    args("assemble", "src/main/smali", "--api", "24", "--output",
        nativeBridgeOutput.get().file("extensions/settings.dex").asFile.absolutePath)
}
sourceSets.main { resources.srcDir(assembleNativeSettings) }

tasks.named<JavaCompile>("compileJava") {
    sourceCompatibility = "11"
    targetCompatibility = "11"
}

tasks.register<JavaExec>("testSettingsArtifactVerifier") {
    description = "Check settings verifier refusal cases against a privately supplied combined APK"
    dependsOn(tasks.testClasses)
    classpath = sourceSets.test.get().runtimeClasspath
    mainClass.set("VerifySettingsDexTest")
    doFirst {
        args(providers.gradleProperty("settingsApk").get())
    }
}
