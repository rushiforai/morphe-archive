group = "app.morphe.patches.foxxo"

patches {
    about {
        name = "Foxxo Patches"
        description = "Custom Morphe patches by Foxxo - AI Plant Doctor Premium & PairIP Bypass"
        source = "https://github.com/FoxxoOwO/foxxo-patches"
        author = "FoxxoOwO"
        website = "https://github.com/FoxxoOwO/foxxo-patches"
        license = "GPL-3.0"
    }
}

dependencies {
    implementation("app.morphe:morphe-patches-library:1.6.2")
    implementation("com.google.guava:guava:33.6.0-jre")
    implementation("com.google.code.gson:gson:2.14.0")
}
