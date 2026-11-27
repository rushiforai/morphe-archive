// SPDX-License-Identifier: AGPL-3.0-or-later

dependencies {
    // Sync 23033 ships this version of OkHttp.
    compileOnly("com.squareup.okhttp3:okhttp:5.0.0-alpha.8")
    testImplementation("com.squareup.okhttp3:okhttp:5.0.0-alpha.8")
    testImplementation("org.json:json:20260814")
}
