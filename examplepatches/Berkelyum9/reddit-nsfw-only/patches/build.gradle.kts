group = "io.github.redditnsfwonly"

patches {
    about {
        name = "Reddit NSFW Only"
        description = "Keeps mature Reddit content and filters confirmed non-NSFW feed posts"
        source = "https://github.com/Berkelyum9/reddit-nsfw-only"
        author = "Berkelyum9"
        contact = "https://github.com/Berkelyum9/reddit-nsfw-only/issues"
        website = "https://github.com/Berkelyum9/reddit-nsfw-only"
        license = "GNU General Public License v3.0, with preserved upstream NOTICE requirements"
    }
}

dependencies {
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)
}
