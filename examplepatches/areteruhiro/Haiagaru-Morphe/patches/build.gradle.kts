group = "app.morphe"

patches {
    about {
        name = "Haiagaru"
        description = "Haiagaru patch for ChMate"
        source = "local"
        author = "areteruhiro"
        contact = "https://discord.com/channels/1392057820316303362/1547235153347092572"
        website = "https://github.com/areteruhiro/Haiagaru-Morphe"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
}

tasks.named<ProcessResources>("processResources") {
    exclude("chmate/emoji/NotoColorEmoji.ttf", "chmate/tflite-226/**/*.so")
    dependsOn(":extensions:chmate:composeResources")
    from(project(":extensions:chmate").layout.buildDirectory.file("compose-resources/haiagaru-ui-res.apk")) {
        into("chmate/compose")
    }
    from(rootProject.file("third-party/open-sstp/LICENSE")) {
        into("chmate/image-vpn/licenses/open-sstp")
    }
    from(rootProject.file("third-party/image-stack")) {
        include("**/LICENSE", "NOTICE.md")
        into("chmate/image-vpn/licenses/image-stack")
    }
}

// Downloadable optional data stays outside the MPP. The release CI publishes it separately.
val optionalImageNg = tasks.register<Zip>("optionalImageNg") {
    from("src/main/resources/chmate/tflite-226")
    archiveFileName.set("haiagaru-image-ng.zip")
    // Keep a GitHub raw-download URL in the patch option and publish the same file as a release asset.
    destinationDirectory.set(rootProject.layout.projectDirectory.dir("optional-assets"))
    isPreserveFileTimestamps = false
    isReproducibleFileOrder = true
}
val optionalImageVpn = tasks.register<Zip>("optionalImageVpn") {
    from(zipTree(rootProject.file("vpn/image-stack/prebuilt/image-stack.aar"))) {
        include("jni/*/libgojni.so")
    }
    from(rootProject.file("third-party/image-stack")) {
        include("**/LICENSE", "NOTICE.md")
        into("licenses/image-stack")
    }
    archiveFileName.set("haiagaru-image-vpn.zip")
    destinationDirectory.set(rootProject.layout.buildDirectory.dir("optional-assets"))
    isPreserveFileTimestamps = false
    isReproducibleFileOrder = true
}
// Versioned package. Keep the legacy filename above for patches already published.
val optionalImageVpnV2 = tasks.register<Zip>("optionalImageVpnV2") {
    from(zipTree(rootProject.file("vpn/image-stack/prebuilt/image-stack.aar"))) {
        include("jni/*/libgojni.so")
    }
    from(rootProject.file("third-party/image-stack")) {
        include("**/LICENSE", "NOTICE.md")
        into("licenses/image-stack")
    }
    from(rootProject.file("vpn/image-stack/VERSION.txt"))
    archiveFileName.set("haiagaru-image-vpn-v2.zip")
    destinationDirectory.set(rootProject.layout.buildDirectory.dir("optional-assets"))
    isPreserveFileTimestamps = false
    isReproducibleFileOrder = true
}
tasks.named("buildAndroid") { dependsOn(optionalImageNg, optionalImageVpn, optionalImageVpnV2) }
