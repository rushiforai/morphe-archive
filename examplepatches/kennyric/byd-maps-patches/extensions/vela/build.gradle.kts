extension { name = "extensions/vela.mpe" }
android {
 namespace = "nl.johninnl.vela"
 sourceSets.getByName("main").java.srcDir(rootProject.file("support/navigation-startup/src/main/java"))
 sourceSets.getByName("main").java.srcDir(rootProject.file("support/navigation-alerts/src/main/java"))
 defaultConfig { minSdk = 26 }
 testOptions { unitTests.isIncludeAndroidResources = true }
 buildTypes { getByName("release") { proguardFiles("proguard-rules.pro") } }
}
dependencies { testImplementation("junit:junit:4.13.2"); testImplementation("org.robolectric:robolectric:4.16.1") }
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
 .configureEach { exclude(group = "org.jetbrains.kotlin") }
