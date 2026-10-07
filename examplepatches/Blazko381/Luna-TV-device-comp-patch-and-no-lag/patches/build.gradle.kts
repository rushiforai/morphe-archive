group = "app.morphe"

patches {
    about {
        name = "Luna TV Patches"
        description = "Compatibility and lag fix patch for Amazon Luna TV"
        source = "https://github.com/Blazko381/Luna-TV-device-comp-patch-and-no-lag"
        author = "Blazko381"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    implementation("app.revanced:revanced-patcher:18.0.0")
    implementation("com.android.tools.smali:smali-dexlib2:3.0.3")
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