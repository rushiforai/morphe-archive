group = "dev.utaa.cutlog"

patches {
    about {
        name = "cutlog"
        description = "setlog Android 向けの、投稿前編集パッチ。"
        source = "https://github.com/uta-a/cutlog"
        author = "cutlog contributors"
        contact = "https://github.com/uta-a/cutlog/issues"
        website = "https://github.com/uta-a/cutlog"
        license = "GPLv3"
    }
}

// APK にバンドルせずに generatePatchesList で Gson を利用できるようにする。
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    // 配布する .mpp にもライセンスと NOTICE を入れる。
    withType<Jar>().configureEach {
        from(files(rootProject.file("LICENSE"), rootProject.file("NOTICE"))) {
            into("META-INF")
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch bundle metadata"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
