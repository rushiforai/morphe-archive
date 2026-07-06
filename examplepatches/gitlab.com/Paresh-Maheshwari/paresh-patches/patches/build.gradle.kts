group = "app.paresh"

patches {
    about {
        name = "Paresh Patches"
        description = "Patches by Paresh"
        source = "https://github.com/Paresh-Maheshwari/paresh-patches"
        author = "Paresh"
        contact = "https://github.com/Paresh-Maheshwari/paresh-patches/issues"
        website = "https://github.com/Paresh-Maheshwari/paresh-patches"
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
