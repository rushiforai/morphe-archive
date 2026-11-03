group = "app.ytmextras"

patches {
    about {
        name = "YTM Extras Pitch"
        description = "Pitch control from -2 to +2 semitones for YouTube Music"
        source = "https://github.com/AnTo88-svg/ytm-extras-pitch"
        author = "YTM Extras"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// The license terms require these files to be included with the binaries.
tasks.processResources {
    from(rootDir.parentFile) {
        include("LICENSE", "NOTICE")
    }
}
