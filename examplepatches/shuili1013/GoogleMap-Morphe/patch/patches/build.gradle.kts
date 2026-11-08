group = "tw.maps.experimental"

patches {
    about {
        name = "Maps two-wheeler experiment"
        description = "Exact-version projected CAR routing experiment; no on-device validation."
        source = "local workspace"
        author = "Local research project"
        contact = "not published"
        website = "not published"
        license = "Unlicensed; local research only"
    }
}

sourceSets.main { java.srcDir("../core/src/main/java") }
tasks.withType<JavaCompile>().configureEach { options.release.set(11) }
