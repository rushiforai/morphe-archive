// Third-party patch bundle, so the group is namespaced under the author rather than "app.morphe".
group = "dev.nosini"

patches {
    about {
        name = "Disable Shorts Repeat"
        description = "Stops YouTube Shorts from automatically repeating."
        source = "https://github.com/nosini/disable-shorts-repeat"
        author = "nosini"
        contact = "na"
        website = "https://github.com/nosini/disable-shorts-repeat"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped. (Same as upstream.)
    implementation("com.google.guava:guava:33.6.0-jre")

    implementation("app.morphe:morphe-patches-library:1.5.1-dev.2")
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
