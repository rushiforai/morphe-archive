import groovy.json.JsonSlurper
import java.time.LocalDateTime

group = "app.morphe"

patches {
    about {
        name = "NMAX Patches"
        description = "NmaxConnect dash patches for Google Maps (MicroG-RE 7.3.0) and Waze. Based on fangkampanat/gmaps-patches."
        source = "https://github.com/lamphung-phuc/nmax-patches"
        author = "lamphung-phuc, fangkampanat"
        contact = "https://github.com/lamphung-phuc/nmax-patches/issues"
        website = "https://github.com/lamphung-phuc/nmax-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
    // EmbedGms: the versions morphe-patcher 2.0.0 brings at run time.
    compileOnly("com.github.MorpheApp:ARSCLib:10d0708212")
    compileOnly("com.github.MorpheApp.smali:smali-dexlib2:4220ae75f7")
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

// EmbedGms.java (NmaxConnect runs it on the phone): same bytecode target as the Kotlin code.
tasks.withType<JavaCompile>().configureEach { options.release = 11 }

// Separate configuration so Gson is available when generating patches-list.json
// without bundling it into the patch artifact.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build the patch bundle and generate patches-list.json"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(project.version.toString())
    }

    // Morphe Manager decodes created_at as a kotlinx LocalDateTime, which rejects an offset or "Z".
    // Desktop accepts both, so a wrong value only shows up when a Manager user adds the source.
    val checkPatchesBundle = register("checkPatchesBundle") {
        description = "Check that patches-bundle.json matches the project version and Morphe Manager can parse it"

        val bundleFile = rootProject.file("patches-bundle.json")
        val expectedVersion = project.version.toString()

        doLast {
            @Suppress("UNCHECKED_CAST")
            val bundle = JsonSlurper().parse(bundleFile) as Map<String, Any?>

            val version = bundle["version"]
            if (version != expectedVersion) {
                throw GradleException(
                    "patches-bundle.json version \"$version\" does not match project version \"$expectedVersion\"",
                )
            }

            val createdAt = bundle["created_at"] as? String
            try {
                LocalDateTime.parse(createdAt)
            } catch (e: Exception) {
                throw GradleException(
                    "patches-bundle.json created_at \"$createdAt\" must be UTC with no offset or Z, " +
                        "for example 2026-10-25T17:00:00",
                    e,
                )
            }
        }
    }

    // buildAndroid, build and generatePatchesList all depend on jar.
    jar {
        dependsOn(checkPatchesBundle)
    }
}
