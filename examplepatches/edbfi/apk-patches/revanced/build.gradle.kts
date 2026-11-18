// SPDX-License-Identifier: AGPL-3.0-or-later
// Dependabot's Gradle updater needs a root build file. The stub modules use the Android library plugin, which the
// ReVanced plugin already brings; declaring it here puts it on one classpath for every module.
plugins {
    id("com.android.library") apply false
}
