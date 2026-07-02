group = "app.morphe"

patches {
    about {
        name = "Trakt Patches"
        description = "Patches for Trakt.tv"
        source = "https://github.com/KoljaCzornik/trakt-patches"
        author = "KoljaCzornik"
        contact = "na"
        website = "na"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-receivers")
    }
}
