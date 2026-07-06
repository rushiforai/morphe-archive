group = "app.pepper.patches"

patches {
    about {
        name = "Pepper Patches"
        description = "Patches for Pepper.com Group apps (Pepper PL/NL/SE/US, Mydealz, HotUKDeals, Dealabs, PromoDescuentos, Preisjäger, Chollometros)"
        source = "git@github.com:PawiX25/pepper-morphe-patches.git"
        author = "PawiX25"
        contact = "na"
        website = "https://github.com/PawiX25/pepper-morphe-patches"
        license = "GPL-3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    // Used by JsonGenerator.
    implementation(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
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
