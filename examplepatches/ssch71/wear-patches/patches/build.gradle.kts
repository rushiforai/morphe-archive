group = "app.ssch71"

patches {
    about {
        name = "Wear Patches"
        description = "폰 앱을 Wear OS 워치에 맞게 바꾸는 패치"
        source = "git@github.com:ssch71/wear-patches.git"
        author = "ssch71"
        contact = "https://github.com/ssch71"
        website = "https://github.com/ssch71/wear-patches"
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
