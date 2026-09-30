group = "h19e8p"

patches {
    about {
        name = "Auto Expand for X"
        description = "X の「ポストをさらに表示」を自動で読み込み、ボタンを隠すパッチ"
        source = "git@github.com:h19e8p/auto-expand-for-x.git"
        author = "h19e8p"
        contact = "na"
        website = "https://github.com/h19e8p/auto-expand-for-x"
        license = "GNU General Public License v3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

tasks.withType<Jar>().configureEach {
    // これが無いと、以前のビルドで残った空のフォルダがバンドルに入ってしまう。
    includeEmptyDirs = false
}
