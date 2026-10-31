group = "app.morphe.patches.esexplorer"
version = "1.0.0"

patches {
    about {
        name = "ES File Explorer Optimized Suite"
        description = "Unlocks Lifetime VIP, blocks all ads, disables telemetry & tracking, and strips bloatware for ultra-lightweight performance."
        source = "https://github.com/azkiabenington/es-file-explorer-morphe-patches"
        author = "azkiabenington"
        contact = "https://github.com/azkiabenington"
        website = "https://morphe.software"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}
