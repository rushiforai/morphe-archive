group = "app.mtcapsule"

patches {
    about {
        name = "Mben Morphe Patches"
        description = "Patches for MT Capsule (incl. universal spoof/strip patches), Device Info, Masareef (ads, telemetry, branding, pro unlock) and StayFree (telemetry, unlocks, login/Inbox Control removal) Windy (premium unlock), AliExpress (AMOLED dark mode, ads/popups/sponsored removal, update and promo push blocking) Infinity for Reddit+ (OAuth client spoofing, paywall removal) and Google Contacts (microG sign-in support)"
        source = "git@github.com:MorpheApp/morphe-patches-template.git"
        author = "mbenanaya"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
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

// Scratch configuration used by the local ":patches:applyToApk" verification task.
val patchApplyClasspath = configurations.create("patchApplyClasspath")

dependencies {
    patchApplyClasspath("app.morphe:morphe-patcher:1.11.0")
    patchApplyClasspath("com.github.MorpheApp.smali:smali:d92701d947")
    patchApplyClasspath("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks {
    register<JavaExec>("applyToApk") {
        description = "Applies the patches to a local APK to verify they resolve and execute"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchApplyClasspath
        mainClass.set("util.ApplyToApkKt")
    }
}

