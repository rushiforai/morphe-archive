group = "app.parchefacemoji"

patches {
    about {
        name = "Parche Facemoji"
        description = "Parches en español para Facemoji AI Emoji Keyboard (com.simejikeyboard)"
        source = "https://github.com/Minecraco/Parche-facemoji"
        author = "Minecraco"
        contact = "https://github.com/Minecraco/Parche-facemoji/issues"
        website = "https://github.com/Minecraco/Parche-facemoji"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    // El patcher trae coroutines en tiempo de ejecucion, pero no las expone al compilar.
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Aplica el bundle a una APK real para comprobar que el parcheo no rompe nada:
    //   APK_A_VERIFICAR=/ruta/facemoji.apkm ./gradlew verificarParcheo
    register<JavaExec>("verificarParcheo") {
        group = "verification"
        description = "Aplica los parches a la APK indicada en APK_A_VERIFICAR"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("verificar.VerificarParcheo")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
