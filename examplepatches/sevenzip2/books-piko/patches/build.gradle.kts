group = "app.bookspiko"

patches {
    about {
        name = "Books Piko"
        description = "Morphe patches for Google Play Books: GmsCore (microG) sign-in without root and custom reader fonts"
        source = "git@github.com:sevenzip2/books-piko.git"
        author = "sevenzip2"
        contact = "na"
        website = "https://github.com/sevenzip2/books-piko"
        license = "GNU General Public License v3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
