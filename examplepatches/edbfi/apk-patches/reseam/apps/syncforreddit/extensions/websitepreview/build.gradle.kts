// SPDX-License-Identifier: AGPL-3.0-or-later

dependencies {
    // Sync 23033 ships both libraries.
    compileOnly("com.squareup.okhttp3:okhttp:5.0.0-alpha.8")
    compileOnly("org.jsoup:jsoup:1.13.1")
    testImplementation("com.squareup.okhttp3:okhttp:5.0.0-alpha.8")
    testImplementation("org.jsoup:jsoup:1.13.1")
}
