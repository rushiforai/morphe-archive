package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE
import org.w3c.dom.Element

private const val KEYPRESS_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteKeypressExtension;"

private val helakuruLiteKeypressSettingsResourcePatch = resourcePatch {
    execute {
        document("res/xml/ime_preferences.xml").use { preferences ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val categories = preferences.getElementsByTagName("PreferenceCategory")
            val general = (0 until categories.length)
                .map { categories.item(it) as Element }
                .first { it.getAttributeNS(namespace, "key") == "pref1" }

            val page = preferences.createElement("PreferenceScreen") as Element
            page.setAttributeNS(namespace, "android:key", "morphe_keypress_feedback_page")
            page.setAttributeNS(namespace, "android:title", "Keypress Feedback")
            page.setAttributeNS(namespace, "android:summary", "Haptics and sound on keypress")

            listOf("vibrate" to "Haptics", "sound" to "Sound").forEach { (key, title) ->
                val toggle = preferences.createElement("SwitchPreference") as Element
                toggle.setAttributeNS(namespace, "android:key", "morphe_keypress_$key")
                toggle.setAttributeNS(namespace, "android:title", title)
                toggle.setAttributeNS(namespace, "android:defaultValue", "false")
                page.appendChild(toggle)
            }
            general.appendChild(page)
        }
    }
}

@Suppress("unused")
val helakuruLiteKeypressFeedbackPatch = patch(
    name = "Keypress Haptics and Sound (Helakuru Lite)",
    description = "Adds independent haptic and system key click feedback settings.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)
    dependsOn(helakuruLiteKeypressSettingsResourcePatch, helakuruLiteSettingsColorsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        prepareHelakuruLiteSettingsTheme()
        HelakuruLiteSettingsCreateFingerprint.method.addInstructions(
            helakuruLiteSettingsBindingIndex(),
            "invoke-static {p0}, $KEYPRESS_EXTENSION->bindSettings(Ljava/lang/Object;)V"
        )

        val press = HelakuruLiteKeypressFingerprint.method.implementation!!.instructions.toList()
        val returnIndex = press.indexOfFirst {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID
        }
        check(returnIndex >= 0) { "Could not locate Lite's keypress callback return" }
        HelakuruLiteKeypressFingerprint.method.addInstructions(
            returnIndex,
            "invoke-static {p0, p1}, $KEYPRESS_EXTENSION->onKeyPress(Ljava/lang/Object;I)V"
        )
    }
}
