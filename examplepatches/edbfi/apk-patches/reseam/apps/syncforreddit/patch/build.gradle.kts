// SPDX-License-Identifier: AGPL-3.0-or-later

reseamStrings {
    objectName = "app.edbfi.patches.syncforreddit.SyncPatchStrings"
}

dependencies {
    add("reseamExtensions", project(":shared:reddit-oauth"))
    add("reseamExtensions", project(":shared:imgur"))
    add("reseamExtensions", project(":shared:redgifs"))
    add("reseamExtensions", project(":shared:reddit-gallery"))
    add("reseamExtensions", project(":shared:reddit-share"))
}

kotlin.sourceSets.named("main") {
    kotlin.srcDir(rootProject.file("shared/reddit-oauth/src/patch/kotlin"))
}
