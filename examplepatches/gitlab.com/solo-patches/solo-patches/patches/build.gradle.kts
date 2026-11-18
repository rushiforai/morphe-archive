group = "app.saketh"

patches {
    about {
        name = "Solo Patches"
        description = "WebNovel appearance, navigation, ad and privacy controls"
        source = "https://gitlab.com/solo-patches/solo-patches"
        author = "sakethkanchi"
        contact = "https://gitlab.com/solo-patches/solo-patches/-/issues"
        website = "https://gitlab.com/solo-patches/solo-patches"
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
    processResources {
        from(rootProject.files("LICENSE", "NOTICE")) {
            into("META-INF/licenses/solo-patches")
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        maxHeapSize = "512m"
        jvmArgs("-XX:ActiveProcessorCount=2")
    }

    register<JavaExec>("verifyBundleSignature") {
        description = "Verify the Android bundle against the published signing key"
        dependsOn("buildAndroid")
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("util.VerifyBundleSignatureKt")
        maxHeapSize = "512m"
        jvmArgs("-XX:ActiveProcessorCount=2")
        doFirst {
            args(
                named<Jar>("jar").get().archiveFile.get().asFile.absolutePath,
                rootProject.file("morphe-signing.pub").absolutePath,
            )
        }
    }

    register<Exec>("checkPatchListGenerator") {
        description = "Check bundle metadata generation without changing release files"
        dependsOn("buildAndroid", "generatePatchesList")
        workingDir(rootProject.projectDir)
        doFirst {
            commandLine(
                "python3", rootProject.file("scripts/check_patch_list_generator.py"),
                (sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath).asPath,
            )
        }
    }

    register<Exec>("checkBundleSignature") {
        description = "Reject altered, unsigned and unexpected-key bundles with the real verifier"
        dependsOn("verifyBundleSignature")
        workingDir(rootProject.projectDir)
        doFirst {
            commandLine(
                "python3", rootProject.file("scripts/check_bundle_signature.py"),
                sourceSets["main"].runtimeClasspath.asPath,
            )
        }
    }
}
