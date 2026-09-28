group = "app.patches.ldp924"

patches {
    about {
        name = "LDP924 QQMusic Patches"
        description = "Patches for QQ Music"
        source = "https://github.com/LDP924/qqmusic-proxy"
        author = "LDP924"
        contact = "na"
        website = "na"
        license = "MIT"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.guava)
    implementation(libs.morphe.patches.library)
    patchListGeneratorClasspath("com.google.code.gson:gson:2.14.0")
    compileOnly(project(":patches:stub"))
}
