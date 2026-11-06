import java.util.zip.ZipFile
import org.gradle.jvm.tasks.Jar

group = "io.github.ikuradachi.kagebili"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Kagebili"
        description = "Patches for the BiliBili/Bstation Android app, for use with Morphe."
        source = "git@github.com:Ikuradachi/Kagebili.git"
        author = "Ikuradachi"
        contact = "https://github.com/Ikuradachi/Kagebili/issues"
        website = "https://github.com/Ikuradachi/Kagebili"
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

        // jar recreates the MPP; buildAndroid must add DEX before catalog generation.
        dependsOn(build, "buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(project.tasks.named<Jar>("jar").flatMap { it.archiveFile }.get().asFile.absolutePath)
    }

    named("buildAndroid") {
        doLast {
            ZipFile(project.tasks.named<Jar>("jar").get().archiveFile.get().asFile).use { bundle ->
                check(bundle.getEntry("classes.dex") != null) {
                    "Android patch bundle is missing classes.dex"
                }
            }
        }
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
