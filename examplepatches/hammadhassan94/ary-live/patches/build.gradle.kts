group = "app.arylive"

patches {
    about {
        name = "ARY Live"
        description = "Community patches for ARY PLUS (com.release.arylive) 3.8.0. Hide ads: interstitial, banner, native, Revive, home feed injectors, IMA preroll."
        source = "git@github.com:hammadhassan94/ary-live.git"
        author = "hammadhassan94"
        contact = "na"
        website = "na"
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
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
