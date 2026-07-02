group = "app.android.patches"

patches {
    about {
        name = "Android Patches"
        description = "Dark mode and premium patches for various apps"
        source = ""
        author = "alex"
        contact = ""
        website = ""
        license = "GPLv3"
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
        dependsOn(build)
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
