/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.shared

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Sets `android:enabled="false"` on every `<[tag]>` entry named in [names], so Android never
 * instantiates it at process start.
 */
fun Document.disableComponents(tag: String, vararg names: String) {
    val components = getElementsByTagName(tag)
    (0 until components.length).map { components.item(it) as Element }
        .filter { it.getAttribute("android:name") in names }
        .forEach { it.setAttribute("android:enabled", "false") }
}

/** Disables the `<provider>` entries named in [names]. */
fun Document.disableProviders(vararg names: String) = disableComponents("provider", *names)

/**
 * Turns off Facebook App Events and advertiser ID collection through the SDK's own manifest switches, setting the
 * `<meta-data>` entries the app declares and adding the ones it does not.
 */
fun Document.disableFacebookAppEvents() {
    val application = getElementsByTagName("application").item(0) as Element
    val declared = getElementsByTagName("meta-data")
    listOf("com.facebook.sdk.AutoLogAppEventsEnabled", "com.facebook.sdk.AdvertiserIDCollectionEnabled").forEach { name ->
        val entry = (0 until declared.length).map { declared.item(it) as Element }
            .firstOrNull { it.getAttribute("android:name") == name && it.parentNode == application }
            ?: createElement("meta-data").also {
                it.setAttribute("android:name", name)
                application.appendChild(it)
            }
        entry.setAttribute("android:value", "false")
    }
}
