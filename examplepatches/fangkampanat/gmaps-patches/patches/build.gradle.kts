import groovy.json.JsonSlurper
import java.time.LocalDateTime

group = "app.morphe"

patches {
    about {
        name = "Maps Patches"
        description = "Google Maps patch for MicroG-RE 7.2.2, applied with Morphe Desktop"
        source = "https://github.com/fangkampanat/gmaps-patches"
        author = "fangkampanat"
        contact = "https://github.com/fangkampanat/gmaps-patches/issues"
        website = "https://github.com/fangkampanat/gmaps-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

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
