plugins {
    alias(libs.plugins.android.library) apply false
}

// One Bouncy Castle version across every module, because the request arrives in more places
// than any single module can see. The patcher pins 1.77 and the Android build tools ask for
// 1.79. CVE-2025-8916 affects 1.44 through 1.78; 1.79 is fixed for that advisory.
// CVE-2026-5588 affects 1.67 through 1.83, so both requests remain affected by it;
// the reviewed release is the one gradle/libs.versions.toml pins, which says why it is that
// one. None of this reaches the payload injected into Pinterest. It is the build and signing
// classpath, and the repository's rule is that a known-affected component does not stay in a
// reproducible graph.
//
// Per module this was applied twice and still missed three graphs: :extensions:shared's release
// runtime classpath, which has no force of its own, and two configurations the Android plugin
// makes for itself. The settings classpath is forced separately in settings.gradle.kts, which
// resolves before this file exists.
val reviewedBouncyCastle = libs.versions.bouncycastle.get()
val reviewedGuava = libs.versions.guava.get()
val reviewedCommonsLang = libs.versions.commons.lang3.get()
val reviewedHttpClient = libs.versions.httpclient.get()
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
            if (requested.group == "com.google.guava" && requested.name == "guava") {
                useVersion(reviewedGuava)
                because("Guava tooling must include the reviewed security fix.")
            }
            if (requested.group == "org.apache.commons" && requested.name == "commons-lang3") {
                useVersion(reviewedCommonsLang)
                because("Commons Lang tooling must include the uncontrolled recursion fix.")
            }
            if (requested.group == "org.apache.httpcomponents" && requested.name == "httpclient") {
                useVersion(reviewedHttpClient)
                because("HttpClient tooling must use the reviewed 4.5 maintenance release.")
            }
        }
    }
}
