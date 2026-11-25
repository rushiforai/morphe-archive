extension { name = "extensions/reolink-calls.mpe" }

android {
    namespace = "nl.johninnl.reolink.calls"
    defaultConfig { minSdk = 28 }
    testOptions { unitTests.isIncludeAndroidResources = true }
}

dependencies {
    // Reolink supplies these libraries already. Inject only the new Telecom component.
    implementation("androidx.core:core-telecom:1.0.0") { isTransitive = false }
    compileOnly("androidx.core:core:1.13.1")
    compileOnly("androidx.lifecycle:lifecycle-service:2.8.1")
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    compileOnly(project(":extensions:reolink-calls:stub"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
    // Unit tests have no target APK to supply the intentionally compile-only runtime libraries.
    testImplementation("org.jetbrains.kotlin:kotlin-stdlib:2.0.21")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    testImplementation("androidx.lifecycle:lifecycle-service:2.8.1")
    testImplementation("androidx.core:core:1.13.1")
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }

// The shipped app supplies Kotlin 2.0. Do not emit coroutine helpers introduced by this builder's newer Kotlin.
tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    compilerOptions {
        languageVersion.set(org.jetbrains.kotlin.gradle.dsl.KotlinVersion.KOTLIN_2_0)
        apiVersion.set(org.jetbrains.kotlin.gradle.dsl.KotlinVersion.KOTLIN_2_0)
    }
}
