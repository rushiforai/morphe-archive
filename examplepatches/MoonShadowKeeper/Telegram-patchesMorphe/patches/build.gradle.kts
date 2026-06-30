group = "app.moonshadow"

patches {
    about {
        name = "Telegram Patches"
        description = "Telegram patches for Morphe Manager by MoonShadowKeeper"
        source = "https://github.com/MoonShadowKeeper/Telegram-patchesMorphe"
        author = "MoonShadowKeeper"
        contact = "https://github.com/MoonShadowKeeper/Telegram-patchesMorphe/issues"
        website = "https://github.com/MoonShadowKeeper/Telegram-patchesMorphe"
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
