group = "app.morphe"

patches {
    about {
        name = "BlueIT TikTok Patches"
        description = "BlueIT Service patches for TikTok 46.4.3, built for Morphe."
        source = "https://github.com/BlueDragon4251/tiktok-patches-for-morphe"
        author = "BlueIT"
        contact = "https://github.com/BlueDragon4251/tiktok-patches-for-morphe/issues"
        website = "https://github.com/BlueDragon4251/tiktok-patches-for-morphe"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    compileOnly(libs.morphe.patcher)

    // Used by JsonGenerator.
    implementation(libs.gson)

    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
        args(project.version.toString())
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
}
