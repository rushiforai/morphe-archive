// SPDX-License-Identifier: AGPL-3.0-or-later

subprojects {
    plugins.withId("java-library") {
        dependencies.add("testImplementation", "junit:junit:4.13.2")
    }
}
