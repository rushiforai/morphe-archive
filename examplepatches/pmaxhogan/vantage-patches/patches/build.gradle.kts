group = "app.vantage"

patches {
    about {
        name = "Vantage"
        description = "Vantage-only patches stacked on top of the anddea bundle"
        source = "git@github.com:pmaxhogan/vantage-patches.git"
        author = "pmaxhogan"
        contact = "na"
        website = "https://github.com/pmaxhogan/vantage-patches"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    implementation(libs.morphe.patches.library)
}

kotlin {
    compilerOptions {
        // Fingerprint.method and the InstructionExtensions helpers are context
        // parameters in morphe-patcher 1.6.0.
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
