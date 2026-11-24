group = "app.morphe.patches.pixelcamera.gallery"
version = "0.1.6"

patches {
    about {
        name = "Johnnyboy’s Morphe Patches"
        description = "Open Pixel Camera previews in Immich and browse Apple Music artist albums in Android Auto."
        source = "https://github.com/0xJohnnyboy/morphe-patches"
        author = "0xJohnnyboy"
        contact = "na"
        website = "https://github.com/0xJohnnyboy/morphe-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    compileOnly(libs.morphe.patcher)
    compileOnly(libs.smali)
    patchListGeneratorClasspath(libs.gson)
}

sourceSets.main {
    resources.exclude("TomteInitHelper.dex")
}

tasks.named("jar") { finalizedBy("buildAndroid") }
tasks.named("assemble") { dependsOn("buildAndroid") }
