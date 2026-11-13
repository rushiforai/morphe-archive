package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val CURSOR_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteSpacebarCursorExtension;"

private val helakuruLiteSpacebarCursorPreferencesPatch = resourcePatch {
    execute {
        document("res/xml/ime_preferences.xml").use { preferences ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val categories = preferences.getElementsByTagName("PreferenceCategory")
            val general = (0 until categories.length)
                .map { categories.item(it) as Element }
                .first { it.getAttributeNS(namespace, "key") == "pref1" }

            val page = preferences.createElement("PreferenceScreen") as Element
            page.setAttributeNS(namespace, "android:key", "morphe_spacebar_cursor_page")
            page.setAttributeNS(namespace, "android:title", "Spacebar Cursor Control")
            page.setAttributeNS(namespace, "android:summary", "Hold space and swipe to move the text cursor")

            val enabled = preferences.createElement("SwitchPreference") as Element
            enabled.setAttributeNS(namespace, "android:key", "morphe_spacebar_cursor_enabled")
            enabled.setAttributeNS(namespace, "android:title", "Enable cursor control")
            enabled.setAttributeNS(namespace, "android:summary", "Hold the spacebar, then swipe left or right")
            enabled.setAttributeNS(namespace, "android:defaultValue", "true")
            page.appendChild(enabled)
            general.appendChild(page)
        }
    }
}

@Suppress("unused")
val helakuruLiteSpacebarCursorPatch = patch(
    name = "Spacebar Cursor Control (Helakuru Lite)",
    description = "Hold the spacebar and swipe to move the text cursor.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)
    dependsOn(helakuruLiteSpacebarCursorPreferencesPatch, helakuruLiteSettingsColorsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        prepareHelakuruLiteSettingsTheme()
        HelakuruLiteSettingsCreateFingerprint.method.addInstructions(
            helakuruLiteSettingsBindingIndex(),
            "invoke-static {p0}, $CURSOR_EXTENSION->bindSettings(Ljava/lang/Object;)V"
        )

        val lifecycle = HelakuruLiteKeyboardWindowFingerprint.method.implementation!!.instructions.toList()
        val lifecycleReturn = lifecycle.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(lifecycleReturn >= 0) { "Could not locate Lite's keyboard lifecycle return" }
        HelakuruLiteKeyboardWindowFingerprint.method.addInstructions(
            lifecycleReturn,
            "invoke-static {p0}, $CURSOR_EXTENSION->attachTouchObserver(Ljava/lang/Object;)V"
        )

        val keyDelivery = HelakuruLiteKeyDeliveryFingerprint.method
        keyDelivery.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $CURSOR_EXTENSION->consumeSpaceKey(Ljava/lang/Object;I)Z
                move-result v0
                if-eqz v0, :morphe_space_cursor_continue
                return-void
                :morphe_space_cursor_continue
            """.trimIndent()
        )
    }
}
