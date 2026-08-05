group = "dev.alastorkaneki"

patches {
    about {
        name = "Alastor Kaneki Morphe Patches"
        description = "Morphe patches for downloading raw Opera GX mod packages."
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
