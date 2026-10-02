plugins {
    alias(libs.plugins.android.library) apply false
}

// One Bouncy Castle version across every module, because the request arrives in more places
// than any single module can see. The patcher pins 1.77 and the Android build tools ask for
// 1.79, and both are inside CVE-2025-8916 (1.44 to 1.79) and CVE-2026-5588 (1.49 to 1.84);
// the reviewed release is the one gradle/libs.versions.toml pins, which says why it is that
// one. None of this reaches the payload injected into Telegram. It is the build and signing
// classpath, and the repository's rule is that a known-affected component does not stay in a
// reproducible graph.
//
// Per module this was applied twice and still missed three graphs: :extensions:shared's release
// runtime classpath, which has no force of its own, and two configurations the Android plugin
// makes for itself. The settings classpath is forced separately in settings.gradle.kts, which
// resolves before this file exists.
val reviewedBouncyCastle = libs.versions.bouncycastle.get()
// AGP's host-side unified test platform brings Netty 4.1.93/4.1.110, including
// GHSA-c4c3-7fpv-j4q5 (fixed on this line in 4.1.137). Align its modules at the
// reviewed 4.1 release. These two configurations never contribute to an extension payload.
val reviewedUtpNetty = "4.1.138.Final"
val nettyTestPlatformConfigurations = setOf(
    "_internal-unified-test-platform-core",
    "_internal-unified-test-platform-android-test-plugin-host-emulator-control",
)
allprojects {
    configurations.configureEach {
        val isNettyTestPlatform = name in nettyTestPlatformConfigurations
        resolutionStrategy.eachDependency {
            if (requested.group == "org.bouncycastle") {
                useVersion(reviewedBouncyCastle)
                because("The build classpath must use the reviewed Bouncy Castle release.")
            }
            if (isNettyTestPlatform && requested.group == "io.netty") {
                useVersion(reviewedUtpNetty)
                because("The Android host test tools must use the reviewed Netty 4.1 release.")
            }
        }
    }
}
