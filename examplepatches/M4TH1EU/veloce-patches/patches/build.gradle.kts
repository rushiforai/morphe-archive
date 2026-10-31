group = "ch.broillet.veloce.patches"

dependencies {
    testImplementation(kotlin("test-junit"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

patches {
    about {
        name = "Veloce Patches"
        description = "App compatibility patches for the Veloce car host."
        source = "https://github.com/M4TH1EU/veloce-patches"
        author = "Veloce contributors"
        contact = "https://github.com/M4TH1EU/veloce-patches/issues"
        website = "https://github.com/M4TH1EU/veloce-patches"
        license = "License selection pending"
    }
}
