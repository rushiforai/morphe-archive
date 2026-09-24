extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.yydarlinker.extension"
}


dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
}
android { testOptions { unitTests.isReturnDefaultValues = true } }

dependencies { testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0") }

dependencies { testImplementation("org.robolectric:robolectric:4.14.1") }

// Test-only resource installation lets Robolectric exercise the same locale XML shipped to YouTube.
android { sourceSets.getByName("debug").res.srcDir("../../patches/src/main/resources/captionlocales") }

android { testOptions { unitTests.isIncludeAndroidResources = true } }
