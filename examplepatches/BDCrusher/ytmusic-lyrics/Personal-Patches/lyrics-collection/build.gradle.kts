/* Copyright 2026 BDCrusher. GPL-3.0. */
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

group = "app.bdcrusher.ytmusic"
patches {
    about {
        name = "BDCrusher YT-Music Lyrics"
        description = "Personal Full Collection with optional Shaders and Playlist downloads. Expanded Lyrics and Shaders diagnostics."
        source = "https://github.com/BDCrusher/ytmusic-lyrics"
        contact = "na"
        website = "https://github.com/BDCrusher/ytmusic-lyrics"
        author = "BDCrusher; MorpheApp and Better Lyrics contributors"
        license = "GNU GPL v3; upstream notices apply"
    }
}
java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
    toolchain { languageVersion.set(JavaLanguageVersion.of(17)) }
}
kotlin {
    compilerOptions { jvmTarget.set(JvmTarget.JVM_17) }

}
// D8 accepts .jar classpath archives; Morphe's plugin names its JVM archive .mpp.
// Keep that plugin and the separate Full output unchanged, and provide a local alias.
val collectionBase = tasks.register<Copy>("prepareCollectionBase") {
    dependsOn(":patches:jar")
    from(project(":patches").tasks.named<Jar>("jar").flatMap { it.archiveFile })
    into(layout.buildDirectory.dir("classpath"))
    rename { "full-collection.jar" }
}
dependencies {
    implementation(files(layout.buildDirectory.file("classpath/full-collection.jar")).builtBy(collectionBase))
}
tasks.named<Jar>("jar") {
    // Preserve Full's declared compatibility semantics (partial-string fingerprints).
    // The release is verified on Patcher 2.0.0, which honors this legacy declaration.
    dependsOn(collectionBase, ":lyrics-addon:prepareRuntime")
    // The plugin bundles resolved module artifacts; this deliberate local file dependency
    // must also be included explicitly in the single collection archive.
    from(provider { zipTree(layout.buildDirectory.file("classpath/full-collection.jar").get().asFile) })
    // Dependencies may have been built for Android already. Re-dex this bundle once.
    exclude("classes*.dex")
    from(rootProject.file("patches/src/main/resources/copyvideolinkbutton/drawable/morphe_yt_copy_bold.xml")) { into("drawable") }
    from(rootProject.file("patches/src/main/resources/romanisationbutton/drawable/morphe_yt_romanize.xml")) { into("drawable") }
    // Guava already owns license/; avoid a file/directory case collision on Android/Windows.
    from(rootProject.file("LICENSE")) { rename { "COPYING-GPL.txt" } }
    from(rootProject.file("NOTICE"))
}
