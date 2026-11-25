extension {
    name = "extensions/gearslip.mpe"
}

android {
    namespace = "nl.johninnl.gearslip"
    testOptions { unitTests.isIncludeAndroidResources = true }
}

dependencies {
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
}
