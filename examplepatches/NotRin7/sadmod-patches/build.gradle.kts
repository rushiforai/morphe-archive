plugins {
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
    id("org.jetbrains.kotlin.jvm") version "2.0.21" apply false
    id("org.jetbrains.kotlin.plugin.compose") version "2.0.21" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "2.0.21" apply false
}

tasks.register("buildAndroid") {
    group = "build"
    description = "Builds the Android .mpp patch bundle."
    dependsOn(":patches:buildAndroid")
}

tasks.register("generatePatchesList") {
    group = "build"
    description = "Generates patches-list.json from the built .mpp patch bundle."
    dependsOn(":patches:generatePatchesList")
}

tasks.register("generateSigningKey") {
    group = "build"
    description = "Creates the Ed25519 signing key pair (morphe-signing.pub / morphe-signing.key)."
    dependsOn(":patches:generateSigningKey")
}
