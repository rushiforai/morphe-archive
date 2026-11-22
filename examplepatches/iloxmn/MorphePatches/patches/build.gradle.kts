import org.gradle.jvm.tasks.Jar

group = "app.template"

val duolingoAppVersion = "6.105"

patches {
    about {
        name = "Duolingo Patches"
        description = "Morphe patches for Duolingo"
        source = "git@github.com:iloxmn/MorphePatches.git"
        author = "iloxmn"
        contact = "https://github.com/iloxmn"
        website = "https://github.com/iloxmn/MorphePatches"
        license = "GPLv3"
    }
}

tasks.withType<Jar>().configureEach {
    archiveBaseName.set("Duolingo-$duolingoAppVersion")
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
