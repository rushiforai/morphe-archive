plugins { kotlin("jvm") version "2.4.21" apply false }

// Compile against the same public release that runs the patches. This avoids
// GitHub Packages credentials and never bundles the Desktop runtime in the MPP.
val sdk = providers.environmentVariable("ANDROID_HOME").orElse("/opt/homebrew/share/android-commandlinetools")
extra["androidJar"] = file("${sdk.get()}/platforms/android-36/android.jar")
extra["d8Jar"] = file("tools/r8-9.5.29.jar")
extra["desktopJar"] = file("tools/morphe-desktop-2.1.1-all.jar")

tasks.register("buildAndroid") { dependsOn(":patches:buildAndroid", ":catalog:generatePatchesList") }
