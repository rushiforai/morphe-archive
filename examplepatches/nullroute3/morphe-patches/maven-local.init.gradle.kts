// Resolves the Morphe Gradle plugin from mavenLocal() instead of GitHub Packages.
//
// Use it when no personal access token with `read:packages` is available and the plugin, the
// patcher and the extensions library have been published locally:
//
//   ./gradlew --init-script maven-local.init.gradle.kts -Pgpr.user=dummy -Pgpr.key=dummy buildAndroid
//
// The dummy credentials satisfy the plugin's own credential provider, which requires a value
// even when the repository it configures is never queried.
beforeSettings {
    pluginManagement.repositories {
        mavenLocal()
    }
}
