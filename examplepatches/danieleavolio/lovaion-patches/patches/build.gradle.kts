group = "app.daniele"

patches {
    about {
        name = "Lovaion Patches"
        description = "Morphe patches for Cinemaniac, Column, GuitarTuna and Tickdrop. " +
            "Patched by Morphe."
        source = "https://github.com/danieleavolio/lovaion-patches"
        author = "Daniele Avolio"
        contact = "https://github.com/danieleavolio"
        website = "https://github.com/danieleavolio/lovaion-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

val e2eRuntime = configurations.create("e2eRuntime")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Used only by the e2eVerify harness, which drives the real patcher engine.
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    e2eRuntime(libs.morphe.patcher)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    /**
     * Applies the Tickdrop patches to an APK with the real patcher engine, to check
     * that the fingerprints still match and that the output dex is valid:
     *
     *   .\gradlew.bat :patches:e2eVerify -Papk=<input.apk> -Pout=<patched.apk>
     */
    register<JavaExec>("e2eVerify") {
        description = "Apply the Tickdrop patches to an APK and write the patched file"

        classpath = sourceSets["main"].output + e2eRuntime
        mainClass.set("util.E2eMainKt")

        // Resolved only when the task runs, so a build that does not use it (CI, :tasks)
        // never fails on the missing properties.
        doFirst {
            val apk = providers.gradleProperty("apk").orNull
                ?: error("Pass -Papk=<input.apk> -Pout=<output.apk>")
            val out = providers.gradleProperty("out").orNull
                ?: error("Pass -Pout=<output.apk>")

            args(apk, out)
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
