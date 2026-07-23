group = "app.dbtcoach.patches"

patches {
    about {
        name = "DBT Coach Morphe Patches"
        description = "Patches Morphe pour l'application DBT Coach — déverrouille les fonctionnalités premium."
        source = "https://github.com/mxkrgt/dbtcoach-morphe-patches"
        author = "mxkrgt"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

dependencies {
    compileOnly(libs.morphe.patcher)
    implementation(libs.gson)
    implementation(libs.guava)
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}
