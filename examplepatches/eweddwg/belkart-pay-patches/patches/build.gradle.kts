group = "app.belkart"

patches {
    about {
        name = "Патчи для Белкарт Pay"
        description = "Добавляет реальную основную карту Белкарт Pay в системный кошелёк Android и запускает штатный экран оплаты: плитка в быстрых настройках, ярлык на экране блокировки и жест кнопки питания"
        source = "git@github.com:eweddwg/belkart-pay-patches.git"
        author = "eweddwg"
        contact = "na"
        website = "https://github.com/eweddwg/belkart-pay-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// auto-generated patch list but never bundled into the APK.
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

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
