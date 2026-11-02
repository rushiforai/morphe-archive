group = "app.morphe"

patches {
    about {
        name = "Marketplace Patches"
        description = "Facebook Marketplace-only patches for Morphe"
        source = "git@github.com:MegaTheLEGEND/Facebook-Marketplace.git"
        author = "MegaTheLEGEND"
        contact = "na"
        website = "https://github.com/MegaTheLEGEND/Facebook-Marketplace"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    // Required due to smali, or the build fails (same as the Morphe template).
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)

    // Android API stubs.
    compileOnly(project(":patches:stub"))
}
