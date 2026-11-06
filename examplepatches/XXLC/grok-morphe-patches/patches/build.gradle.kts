group = "io.github.xxlc"

patches {
    about {
        name = "XXLC Grok Patches"
        description = "Bản vá Grok Android: bỏ kiểm tra giấy phép và tải tất cả media Imagine."
        source = "https://github.com/XXLC/grok-morphe-patches"
        author = "XXLC"
        contact = "https://github.com/XXLC/grok-morphe-patches/issues"
        website = "https://github.com/XXLC/grok-morphe-patches"
        license = "GPLv3"
    }
}

// Chỉ đưa Gson vào lúc chạy tác vụ sinh danh sách patch, không đóng gói vào APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Biên dịch bản vá và sinh danh sách patch"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Được gradle-semantic-release-plugin sử dụng.
    publish {
        dependsOn("generatePatchesList")
    }
}
