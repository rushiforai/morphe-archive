import com.android.build.api.dsl.ApplicationExtension

// Morphe extension module for MT Manager tool reimplementations.
//
// The Morphe gradle plugin auto-applies `com.android.application` (via the
// ExtensionPlugin) to any project under extensions/** that has a build.gradle.kts.
// The `extension { name }` block sets the artifact name referenced by
// `extendWith("extensions/mtmanager.mpe")` in the patches module.

extension {
    name = "extensions/mtmanager.mpe"
}

dependencies {
    // baksmali + dexlib2 (MorpheApp smali fork, matches the patches module's smali)
    implementation(libs.smali.dexlib2)
    implementation(libs.smali.baksmali)

    // dex2jar (femtopedia maintained fork, Maven Central)
    implementation(libs.dex2jar.tools)
    implementation(libs.dex2jar.translator)
    implementation(libs.dex2jar.reader)

    // Android apksig for the Sign tool reimplementation
    implementation(libs.apksig)
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.mtmanager"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
