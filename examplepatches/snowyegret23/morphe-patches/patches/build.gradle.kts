group = "app.s.chzzk"

patches {
    about {
        name = "S Chzzk Patches"
        description = "치지직 채팅과 시청 환경을 개선하는 패치"
        source = System.getenv("GITHUB_REPOSITORY")?.let { "https://github.com/$it" } ?: ""
        author = "Snowyegret"
        contact = ""
        website = ""
        license = "GPL-3.0"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}
tasks {
    withType<Jar>().configureEach {
        manifest.attributes["Patcher-Version"] = libs.versions.morphe.patcher.get()
        from(rootProject.file("LICENSE")) { into("licenses") }
        from(rootProject.file("NOTICE")) { into("licenses") }
        from(rootProject.file("THIRD_PARTY_NOTICES")) { into("licenses") }
    }
    register<JavaExec>("generatePatchesList") {
        dependsOn(build)
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
    publish { dependsOn("generatePatchesList") }
}
