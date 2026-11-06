group = "app.morphe.bilibili"
patches {
    about {
        name = "Bilibili danmaku add-on"
        description = "Bilibili danmaku add-on for Morphe YouTube"
        source = "https://github.com/RizkLee/morphe-bilibili-danmaku"
        author = "RizkLee"
        contact = "https://github.com/RizkLee/morphe-bilibili-danmaku/issues"
        website = "https://github.com/RizkLee/morphe-bilibili-danmaku"
        license = "GPL-3.0"
    }
}
java { toolchain { languageVersion.set(JavaLanguageVersion.of(17)) } }
sourceSets.main {
    resources.srcDir("../../patches/src/main/resources/bilibilidanmakubutton/drawable")
    resources.srcDir("../build/generated/resources")
}
