// Samsung Keyboard runtime helpers (SystemAccess, OneUi, Services, LocalClipboard, Downloads,
// Gifs, Java21, Fallbacks, Sem) and the stand-ins for One UI classes the keyboard uses. Ported from
// bearinmindcat/morphe-patches (GPL-3.0, commit 5f79152). The stand-ins keep their real android.* /
// com.samsung.* packages on purpose: the patched app resolves them by those names. Builds
// extensions/samsungkeyboard.mpe.
extension {
    name = "extensions/samsungkeyboard.mpe"
}

android {
    namespace = "app.template.extension.samsungkeyboard"

    defaultConfig {
        // Samsung Keyboard 5.9 itself requires Android 13 (API 33).
        minSdk = 33
    }
}

dependencies {
    // HevalSettings (controls/). compileOnly: one copy of the core, from hevalcontrols.mpe.
    compileOnly(project(":extensions:hevalcontrols:core"))
}

// Pure-Java extension. AGP's built-in Kotlin adds kotlin-stdlib by default, which would grow the
// .mpe by ~2 MB and merge an unobfuscated Kotlin stdlib into the target app's dex.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}