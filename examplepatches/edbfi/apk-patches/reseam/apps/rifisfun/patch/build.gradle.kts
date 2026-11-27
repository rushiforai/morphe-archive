// SPDX-License-Identifier: AGPL-3.0-or-later

reseamStrings {
    objectName = "app.edbfi.patches.rifisfun.RifPatchStrings"
}

tasks.processResources {
    from("src/main/strings/values/strings.xml") {
        into("edbfi/rifisfun")
    }
}

dependencies {
    add("reseamExtensions", project(":shared:redgifs"))
    add("reseamExtensions", project(":shared:reddit-oauth"))
    add("reseamExtensions", project(":shared:imgur"))
    add("reseamExtensions", project(":shared:reddit-gallery"))
    add("reseamExtensions", project(":shared:reddit-share"))
}

kotlin.sourceSets.named("main") {
    kotlin.srcDir(rootProject.file("shared/reddit-oauth/src/patch/kotlin"))
}
