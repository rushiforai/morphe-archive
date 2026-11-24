group = "app.liquidmusic"

patches {
    about {
        name = "LiquidMusic Patches"
        description = "Clean, native Liquid Glass patches for Apple Music on Android"
        source = "git@github.com:EnesCevikdogan/LiquidMusic.git"
        author = "EnesCevikdogan"
        contact = "https://github.com/EnesCevikdogan/LiquidMusic/issues"
        website = "https://github.com/EnesCevikdogan/LiquidMusic"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Generate patches-list.json from built .mpp"
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
