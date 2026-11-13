package app.flip.patches.voice

import app.flip.patches.voice.Constants.COMPATIBILITY_GOOGLE_VOICE
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.xml.XmlElement

private const val EXT = "app.flip.voicedialer.extension"

/**
 * Makes Voice eligible for Android's "Phone app" role (RoleManager.ROLE_DIALER), which needs:
 * an activity handling ACTION_DIAL (with and without a tel: number) and an InCallService
 * that provides the in-call UI. The classes come from the prebuilt voicedialer extension.
 */
@Suppress("unused")
val defaultPhoneAppPatch = patch(
    name = "Default phone app",
    description = "Lets Google Voice be chosen as the default phone app (Settings > Apps > Default apps > " +
        "Phone app). Tapping a phone number then opens Voice, and carrier calls get a basic in-call screen.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_VOICE)

    // Renames the package first, so the provider below gets the new package name.
    dependsOn(gmsCoreSupportPatch)

    extendWith("extensions/voicedialer.mpe")

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val root = manifest.root
            val application = manifest.elements("application").first()
            val packageName = root.attribute("package")!!

            fun XmlElement.add(tag: String, vararg attrs: Pair<String, String>, init: XmlElement.() -> Unit = {}) =
                appendChild(tag) {
                    attrs.forEach { (k, v) -> setAttribute(k, v) }
                    init()
                }

            fun XmlElement.filter(actions: List<String>, categories: List<String> = emptyList(), scheme: String? = null) =
                add("intent-filter") {
                    actions.forEach { add("action", "android:name" to it) }
                    (listOf("android.intent.category.DEFAULT") + categories).forEach {
                        add("category", "android:name" to it)
                    }
                    if (scheme != null) add("data", "android:scheme" to scheme)
                }

            // Permissions the in-call screen needs.
            val existing = manifest.elements("uses-permission").mapNotNull { it.attribute("android:name") }.toSet()
            listOf(
                "android.permission.USE_FULL_SCREEN_INTENT",
                "android.permission.POST_NOTIFICATIONS",
                "android.permission.VIBRATE",
            ).filterNot { it in existing }.forEach { permission ->
                root.insertChild(application.index, "uses-permission") {
                    setAttribute("android:name", permission)
                }
            }

            // Starts the extension's crash log as early as possible.
            application.add(
                "provider",
                "android:name" to "$EXT.LogProvider",
                "android:authorities" to "$packageName.flipvoicepatchlog",
                "android:exported" to "false",
                "android:initOrder" to "2147483647",
            )

            application.add(
                "activity",
                "android:name" to "$EXT.DialActivity",
                "android:exported" to "true",
                "android:theme" to "@android:style/Theme.Translucent.NoTitleBar",
                "android:excludeFromRecents" to "true",
            ) {
                filter(listOf("android.intent.action.DIAL"))
                filter(listOf("android.intent.action.DIAL"), scheme = "tel")
                filter(
                    listOf("android.intent.action.VIEW", "android.intent.action.DIAL"),
                    listOf("android.intent.category.BROWSABLE"),
                    "tel",
                )
            }

            application.add(
                "activity",
                "android:name" to "$EXT.InCallActivity",
                "android:exported" to "false",
                "android:launchMode" to "singleTask",
                "android:showWhenLocked" to "true",
                "android:turnScreenOn" to "true",
                "android:excludeFromRecents" to "true",
            )

            application.add(
                "service",
                "android:name" to "$EXT.VoiceInCallService",
                "android:exported" to "true",
                "android:permission" to "android.permission.BIND_INCALL_SERVICE",
            ) {
                add("meta-data", "android:name" to "android.telecom.IN_CALL_SERVICE_UI", "android:value" to "true")
                add("meta-data", "android:name" to "android.telecom.IN_CALL_SERVICE_RINGING", "android:value" to "true")
                add("intent-filter") { add("action", "android:name" to "android.telecom.InCallService") }
            }
        }
    }
}
