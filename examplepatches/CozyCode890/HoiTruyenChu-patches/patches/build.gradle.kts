group = "app.hoitruyenchu"

patches {
    about {
        name = "HoiTruyenChu Patches"
        description = "Fix nghe truyện (TTS) chạy nền, sau cuộc gọi, nút play bị đứng và tự động đồng bộ lịch sử đọc cho app iTruyenChu"
        source = "git@github.com:CozyCode890/HoiTruyenChu-patches.git"
        author = "HoiTruyenChu"
        contact = "na"
        website = "https://github.com/CozyCode890/HoiTruyenChu-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
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
        mainClass.set("app.hoitruyenchu.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
