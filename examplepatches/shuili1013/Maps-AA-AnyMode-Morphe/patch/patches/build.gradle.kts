group = "tw.maps"

patches {
    about {
        name = "Maps-AA-AnyMode-Morphe"
        description = "Google Maps 26.44.06.1006895251: native Android Auto navigation with two-wheeler routes. " +
            "Includes the required Dutch App Patches (JohninNL, GPLv3) Maps patches."
        source = "https://github.com/shuili1013/Maps-AA-AnyMode-Morphe"
        author = "shuili1013; includes Dutch App Patches by JohninNL"
        contact = "https://github.com/shuili1013/Maps-AA-AnyMode-Morphe/issues"
        website = "https://github.com/shuili1013/Maps-AA-AnyMode-Morphe"
        license = "GPL-3.0"
    }
}

tasks.withType<JavaCompile>().configureEach { options.release.set(11) }
