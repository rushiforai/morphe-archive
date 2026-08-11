import org.gradle.api.tasks.JavaExec

group = "app.atharv"

patches {
    about {
        name = "Atharv Patches"
        description = "Custom patches for various apps"
        source = "https://github.com/madhu-gowda6/atharv-patches"
        author = "Atharv"
        contact = "madhuyuva06@gmail.com"
        website = "https://github.com/madhu-gowda6/atharv-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    implementation(libs.gson)
}

tasks.register<JavaExec>("generatePatchesList") {
    description = "Build the patch bundle and generate patches-list.json."
    dependsOn("build")
    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("app.morphe.util.PatchListGeneratorKt")
}
