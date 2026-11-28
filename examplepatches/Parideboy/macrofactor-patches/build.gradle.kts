// Root build configuration for morphe-patches-template

// `verify-patches.yml` drives this test: it loads the built .mpp into the real patcher and
// asserts every fingerprint resolves on the supplied APK (see patches/src/test/kotlin).
fun Project.libsOf(alias: String) = extensions.getByType<VersionCatalogsExtension>()
    .named("libs").findLibrary(alias).get()
project(":patches") {
    dependencies {
        // Resolved through the catalog by name: the `libs` accessor is root-scoped only.
        listOf("morphe-patcher", "kotlinx-coroutines-core", "junit-jupiter").forEach {
            add("testImplementation", rootProject.libsOf(it))
        }
        add("testRuntimeOnly", rootProject.libsOf("junit-platform-launcher"))
    }

    tasks.withType<Test>().configureEach {
        useJUnitPlatform()
        // ./gradlew :patches:test -Papk=/path/app.apk [-Pmpp=patches/build/libs/patches-x.mpp]
        listOf("apk", "mpp").forEach { key ->
            providers.gradleProperty(key).orNull?.let { systemProperty(key, it) }
        }
    }
}
