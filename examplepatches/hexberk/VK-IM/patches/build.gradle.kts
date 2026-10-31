group = "app.morphe"

patches {
    about {
        name = "VK IM patches"
        description = "Ads and tracking removal for VK Messenger (com.vk.im)"
        source = "https://github.com/hexberk/VK-IM"
        author = "hexberk, based on PerfLite/VK-Zen"
        contact = "na"
        website = "https://github.com/hexberk/VK-IM"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

val patchListGeneratorClasspath: Configuration by configurations.creating

dependencies {
    implementation(libs.guava)
    implementation(libs.kotlinx.coroutines.core)
    implementation(libs.morphe.patcher)
    implementation(libs.morphe.patches.library)
    patchListGeneratorClasspath(libs.gson)
    compileOnly(project(":patches:stub"))
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"
        dependsOn("buildAndroid")
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
