patches {
    about {
        name = "Shuffle+ for Spotify"
        description = "True random shuffle: long-press Now Playing's shuffle button to play the current playlist, album or Liked Songs in Fisher-Yates order"
        source = "https://github.com/farbener/shuffle-plus-spotify"
        author = "farbener (based on Spicetify Shuffle+)"
        contact = "na"
        website = "https://github.com/farbener/shuffle-plus-spotify"
        license = "GPLv3"
    }
}

tasks.named<JavaCompile>("compileJava") {
    sourceCompatibility = "11"
    targetCompatibility = "11"
}
