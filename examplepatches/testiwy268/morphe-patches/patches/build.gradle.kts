group = "com.dualspace"

patches {
    about {
        name = "testiwy268 patches"
        description = "Security assessment patches for Dualspace - forces premium entitlement"
        source = "https://github.com/testiwy268/morphe-patches.git"
        author = "testiwy268"
        contact = "na"
        website = "https://github.com/testiwy268/morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish {
        dependsOn("generatePatchesList")
    }
}

