extension {
    name = "extensions/linimal.mpe"
}

android {
    namespace = "dev.utaa.linimal.extension"
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

// 既存のテストは日本語の文言を前提にするため、実行環境の言語によらず日本語で動かします。
tasks.withType<Test>().configureEach {
    systemProperty("user.language", "ja")
    systemProperty("user.country", "JP")
}
