group = "app.morphe"

patches {
    about {
        name = "Maps Patches"
        description = "Google Maps MicroG patch for ReVanced GmsCore, applied with Morphe Manager"
        source = "https://github.com/fangkampanat/gmaps-patches"
        author = "fangkampanat"
        contact = "https://github.com/fangkampanat/gmaps-patches/issues"
        website = "https://github.com/fangkampanat/gmaps-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
