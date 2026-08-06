group = "dev.alastorkaneki"

patches {
    about {
        name = "Alastor Kaneki Morphe Patches"
        description = "Morphe patches for Opera GX raw mod downloads and a cloneable Chrome Android Material You userscript manager with a Violentmonkey-derived parser and installer plus Greasy Fork and Sleazy Fork support."
        source = "https://github.com/Alastor-Kaneki/Morphe-Patches"
        author = "Alastor Kaneki"
        contact = "https://github.com/Alastor-Kaneki"
        website = "https://github.com/Alastor-Kaneki/Morphe-Patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}
