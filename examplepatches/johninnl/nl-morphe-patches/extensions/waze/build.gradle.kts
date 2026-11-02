extension {
    name = "extensions/waze.mpe"
}

dependencies {
    compileOnly(project(":extensions:waze:stub"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
}

android {
    namespace = "app.wazeytm.extension.waze"
    sourceSets.getByName("main").java.srcDir(rootProject.file("support/navigation/src/main/java"))
    defaultConfig { minSdk = 32 }
    testOptions { unitTests.isIncludeAndroidResources = true }
    buildTypes { getByName("release") { proguardFiles("proguard-rules.pro") } }
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
