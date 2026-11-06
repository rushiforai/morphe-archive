group = "app.template"

patches {
    about {
        name = "Dumpert No Ads Patches"
        description = "Patches for Dumpert"
        source = "https://github.com/ns1207/nl.dumpert.nopatch"
        author = "ns1207"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath =
    configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(
        fileTree(
            mapOf(
                "dir" to "../libs",
                "include" to listOf("*.jar")
            )
        )
    )

    compileOnly(
        fileTree(
            mapOf(
                "dir" to "libs",
                "include" to listOf("*.jar")
            )
        )
    )

    implementation("com.google.code.gson:gson:2.10.1")
    patchListGeneratorClasspath("com.google.code.gson:gson:2.10.1")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)

        classpath =
            sourceSets["main"].runtimeClasspath +
                    patchListGeneratorClasspath

        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}