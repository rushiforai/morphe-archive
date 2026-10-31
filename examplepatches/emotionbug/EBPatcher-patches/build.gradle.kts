plugins {
    base
    alias(libs.plugins.android.library) apply false
}

tasks.build {
    dependsOn(":patches:build", ":patches:buildAndroid")
}
