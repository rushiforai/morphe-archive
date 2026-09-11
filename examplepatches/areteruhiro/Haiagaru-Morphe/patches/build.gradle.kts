group = "app.morphe"

patches {
    about {
        name = "Haiagaru"
        description = "Haiagaru patch for ChMate"
        source = "local"
        author = "areteruhiro"
        contact = "https://discord.com/channels/1392057820316303362/1547235153347092572"
        website = "https://github.com/areteruhiro/Haiagaru-Morphe"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}
