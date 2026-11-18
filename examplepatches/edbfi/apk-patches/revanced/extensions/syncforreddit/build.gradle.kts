// SPDX-License-Identifier: AGPL-3.0-or-later
extensions.configure<com.android.build.api.dsl.ApplicationExtension> {
    // Sync's own minSdk.
    defaultConfig.minSdk = 23
    // Lets unit tests reach code that logs with android.util.Log.
    testOptions.unitTests.isReturnDefaultValues = true
}

// AGP's built-in Kotlin adds kotlin-stdlib to every Android module; this one is plain Java.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}

dependencies {
    compileOnly(project(":extensions:syncforreddit:stub"))
    // Lets tests load extension classes that implement the app's types; they never call the stubs.
    testImplementation(project(":extensions:syncforreddit:stub"))
    testImplementation(libs.junit)
    testImplementation(libs.org.json)
}

extension {
    // Not the plugin's default, extensions/syncforreddit.rve: ReVanced's bundle has a file there too, and every loaded
    // bundle shares one class loader. ExtensionPatch.kt reads it from this path.
    name = "extensions/edbfi/syncforreddit.rve"
}
