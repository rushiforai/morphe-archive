group = "app.morphe"

patches {
    about {
        name = "Remove Permanent Ban Banner Patch"
        description = "A small third-party Morphe patch source for the official Reddit Android app."
        source = "https://github.com/bernardo7894/remove-permaban-banner-patch"
        author = "Bernardo Santos"
        contact = "na"
        website = "https://github.com/bernardo7894/remove-permaban-banner-patch"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    implementation(libs.gson)
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)
    compileOnly(project(":patches:stub"))
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
