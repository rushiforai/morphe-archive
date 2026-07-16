group = "app.jouss"

patches {
    about {
        name = "Jouss Patches"
        description = "Community-maintained Android app patches"
        source = "https://github.com/Joussflls10/Jouss-Patches"
        author = "Joussflls10"
        contact = "https://github.com/Joussflls10/Jouss-Patches/issues"
        website = "https://github.com/Joussflls10/Jouss-Patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    implementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    publish {
        dependsOn("generatePatchesList")
    }
}
