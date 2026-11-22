group = "h19e8p"

patches {
    about {
        name = "h19e8p Patches"
        description = "X (Twitter) 12.19.1 向けのパッチ集。「ポストをさらに表示」の自動読み込み、フラグを探す道具、投稿画面の元に戻す・やり直す"
        source = "git@github.com:h19e8p/h19e8p-patches.git"
        author = "h19e8p"
        contact = "https://github.com/h19e8p/h19e8p-patches/issues"
        website = "https://github.com/h19e8p/h19e8p-patches"
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

tasks.processResources {
    // 拡張の診断ログと設定画面の「情報」にパッチの版を出すため、バンドルの版をリソースに埋め込む。
    val bundleVersion = project.version.toString()
    inputs.property("version", bundleVersion)
    filesMatching("**/bundle-version.txt") { expand("version" to bundleVersion) }
}
