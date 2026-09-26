group = "non7043"
version = "1.0.0"


patches {
    about {
        name = "365Score Patches"
        description = "Morphe patches for the 365Score sports app"
        source = "git@github.com:non7043/365score-patches.git"
        author = "non7043"
        contact = "na"
        website = "https://github.com/non7043/365score-patches"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")

    // Used by JsonGenerator.
    implementation(libs.gson)

    implementation(libs.morphe.patches.library)
}
