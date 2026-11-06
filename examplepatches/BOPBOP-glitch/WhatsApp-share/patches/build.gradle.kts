group = "app.whatsappmorphe"

patches {
    about {
        name = "WhatsApp Morphe Patches"
        description = "Experimental no-root Morphe patches for WhatsApp privacy and media behavior."
        source = "https://github.com/BOPBOP-glitch/WhatsApp-share"
        author = "BOPBOP-glitch"
        contact = "https://github.com/BOPBOP-glitch/WhatsApp-share/issues"
        website = "https://github.com/BOPBOP-glitch/WhatsApp-share"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
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
