package com.openbubbles.wear.patches

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
internal const val SERVICE_NAME = "com.openbubbles.wear.bridge.WearBridgeService"
internal const val MEDIA_PROVIDER_NAME = "com.openbubbles.wear.patch.CompanionMediaProvider"
internal const val MEDIA_AUTHORITY = "com.openbubbles.messaging.wear.media"
internal const val SETTINGS_ACTIVITY = "com.openbubbles.wear.patch.PatchSettingsActivity"
internal const val RESTART_ACTIVITY = "com.openbubbles.wear.patch.RestartOpenBubblesActivity"
internal const val NOTIFICATION_RECEIVER = "com.openbubbles.wear.patch.PhoneNotificationReceiver"
internal const val NOTIFICATION_OPEN_ACTIVITY = "com.openbubbles.wear.patch.PhoneNotificationReceiver\$OpenActivity"

internal fun addSettingsToManifest(document: Document) {
    val manifest = document.documentElement
    requireSupportedVersion(manifest.getAttribute("package"), manifest.getAttributeNS(ANDROID_NS, "versionName"),
        manifest.getAttributeNS(ANDROID_NS, "versionCode"))
    val applications = manifest.getElementsByTagName("application")
    if (applications.length != 1) throw PatchException("Expected one application in the manifest")
    val application = applications.item(0) as Element
    val activities = application.getElementsByTagName("activity")
    for (index in 0 until activities.length) {
        if ((activities.item(index) as Element).getAttributeNS(ANDROID_NS, "name") in setOf(SETTINGS_ACTIVITY, RESTART_ACTIVITY))
            throw PatchException("The patch settings activity is already declared")
    }
    application.appendChild(document.createElement("activity").apply {
        setAttributeNS(ANDROID_NS, "android:name", SETTINGS_ACTIVITY)
        setAttributeNS(ANDROID_NS, "android:exported", "false")
        setAttributeNS(ANDROID_NS, "android:label", "Morphe patches")
    })
    application.appendChild(document.createElement("activity").apply {
        setAttributeNS(ANDROID_NS, "android:name", RESTART_ACTIVITY)
        setAttributeNS(ANDROID_NS, "android:exported", "false")
        setAttributeNS(ANDROID_NS, "android:process", ":morphe_restart")
        setAttributeNS(ANDROID_NS, "android:taskAffinity", "")
        setAttributeNS(ANDROID_NS, "android:excludeFromRecents", "true")
        setAttributeNS(ANDROID_NS, "android:theme", "@android:style/Theme.Translucent.NoTitleBar")
    })
}

internal fun addBridgeToManifest(document: Document) {
    val manifest = document.documentElement
    requireSupportedVersion(manifest.getAttribute("package"), manifest.getAttributeNS(ANDROID_NS, "versionName"),
        manifest.getAttributeNS(ANDROID_NS, "versionCode"))
    val applications = manifest.getElementsByTagName("application")
    if (applications.length != 1) throw PatchException("Expected one application in the manifest")
    val application = applications.item(0) as Element
    if (application.getAttributeNS(ANDROID_NS, "name") != "com.localob.messaging.shell.ShellApplication")
        throw PatchException("Expected the native ShellApplication")
    val components = application.childNodes
    for (index in 0 until components.length) {
        val element = components.item(index) as? Element ?: continue
        if (element.getAttributeNS(ANDROID_NS, "name") in setOf(SERVICE_NAME, MEDIA_PROVIDER_NAME, NOTIFICATION_RECEIVER, NOTIFICATION_OPEN_ACTIVITY,
                "com.openbubbles.wear.patch.CompanionService") ||
            MEDIA_AUTHORITY in element.getAttributeNS(ANDROID_NS, "authorities").split(';'))
            throw PatchException("The Wear bridge component or media authority is already declared")
    }

    fun component(tag: String, name: String, exported: Boolean): Element = document.createElement(tag).apply {
        setAttributeNS(ANDROID_NS, "android:name", name)
        setAttributeNS(ANDROID_NS, "android:exported", exported.toString())
    }
    val service = component("service", SERVICE_NAME, true)
    fun filter(action: String, data: Boolean) {
        service.appendChild(document.createElement("intent-filter").apply {
            appendChild(document.createElement("action").apply { setAttributeNS(ANDROID_NS, "android:name", action) })
            if (data) appendChild(document.createElement("data").apply {
                setAttributeNS(ANDROID_NS, "android:host", "*")
                setAttributeNS(ANDROID_NS, "android:scheme", "wear")
                setAttributeNS(ANDROID_NS, "android:pathPrefix", "/openbubbles_wear")
            })
        })
    }
    // WearableListenerService authenticates Google Play services before accepting Binder calls.
    filter("com.google.android.gms.wearable.MESSAGE_RECEIVED", true)
    filter("com.google.android.gms.wearable.DATA_CHANGED", true)
    filter("com.google.android.gms.wearable.CAPABILITY_CHANGED", false)
    application.appendChild(service)
    application.appendChild(component("receiver", NOTIFICATION_RECEIVER, false))
    application.appendChild(component("activity", NOTIFICATION_OPEN_ACTIVITY, false).apply {
        setAttributeNS(ANDROID_NS, "android:noHistory", "true")
        setAttributeNS(ANDROID_NS, "android:excludeFromRecents", "true")
        setAttributeNS(ANDROID_NS, "android:taskAffinity", "")
        setAttributeNS(ANDROID_NS, "android:theme", "@android:style/Theme.Translucent.NoTitleBar")
    })
    application.appendChild(component("provider", MEDIA_PROVIDER_NAME, false).apply {
        setAttributeNS(ANDROID_NS, "android:authorities", MEDIA_AUTHORITY)
        setAttributeNS(ANDROID_NS, "android:grantUriPermissions", "false")
    })
}
