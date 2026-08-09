group = "app.ang3lo.morphe-patches"

patches {
    about {
        name = "Ang3lo's Patches"
        description = "Patches for apps I use and maintain"
        source = "https://github.com/ang3lo-azevedo/morphe-patches"
        author = "ang3lo-azevedo"
        contact = "https://github.com/ang3lo-azevedo"
        website = "https://github.com/ang3lo-azevedo/morphe-patches"
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
    implementation(libs.morphe.patches.library)
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}
