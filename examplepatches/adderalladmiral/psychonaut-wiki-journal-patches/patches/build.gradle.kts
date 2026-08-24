group = "com.journal"

patches {
    about {
        name = "Journal Patches"
        description = "Personal learning patches for my own Journal APK builds."
        source = "local"
        author = "coderadicaltexas"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

dependencies {
    implementation(libs.morphe.patches.library)
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}
