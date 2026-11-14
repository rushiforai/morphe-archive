package app.dorfandiy.ironfox.md3

import app.dorfandiy.ironfox.shared.Constants.COMPATIBILITY_IRONFOX
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("Md3SettingsPatch")

/** Rounded Material 3 card used as the background of every settings row (ripple included). */
private const val CARD_DRAWABLE = """<?xml version="1.0" encoding="utf-8"?>
<ripple xmlns:android="http://schemas.android.com/apk/res/android"
    android:color="?android:attr/colorControlHighlight">
    <item android:id="@android:id/mask">
        <shape>
            <solid android:color="#000000" />
            <corners android:radius="16dp" />
        </shape>
    </item>
    <item>
        <shape>
            <solid android:color="?attr/colorSurfaceContainer" />
            <corners android:radius="16dp" />
        </shape>
    </item>
</ripple>
"""

private fun editRoot(path: String, edit: (Element) -> Unit) {
    try {
        document(path).use { edit(it.documentElement) }
    } catch (e: Exception) {
        // A resource that moved or disappeared in this IronFox version must not break patching.
        logger.warning("Md3SettingsPatch: skipped $path (${e.message})")
    }
}

@Suppress("unused")
val md3SettingsPatch = patch(
    name = "Material 3 settings",
    description = "Redraws the Settings screens in Material 3 style: rounded tonal cards, primary-coloured " +
        "section titles and no divider lines.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IRONFOX)

    execute {
        // 1. Card background for settings rows. Reuses the existing sign-in card drawable.
        try {
            resourceFile("res/drawable/sign_in_preference_background.xml").writeText(CARD_DRAWABLE)
        } catch (e: Exception) {
            logger.warning("Md3SettingsPatch: card drawable not replaced (${e.message})")
        }

        // 2. Every standard preference row (androidx layout) becomes a card with a small gap.
        editRoot("res/layout/preference_material.xml") { root ->
            root.setAttribute("android:background", "@drawable/sign_in_preference_background")
            root.setAttribute("android:layout_marginStart", "16dp")
            root.setAttribute("android:layout_marginEnd", "16dp")
            root.setAttribute("android:layout_marginTop", "2dp")
            root.setAttribute("android:layout_marginBottom", "2dp")
            root.setAttribute("android:minHeight", "64dp")
        }

        // 3. Section titles: primary colour, medium weight, aligned with the card text.
        for (header in listOf("preference_category_no_icon_style", "preference_cat_style")) {
            editRoot("res/layout/$header.xml") { root ->
                root.setAttribute("android:textColor", "?attr/colorPrimary")
                root.setAttribute("android:textAppearance", "@style/Header14TextStyle")
                root.setAttribute("android:layout_marginStart", "32dp")
                root.setAttribute("android:layout_marginTop", "8dp")
            }
        }

        // 4. No divider lines between rows and sections.
        try {
            document("res/values/styles.xml").use { doc ->
                val resources = doc.documentElement
                val styles = resources.getElementsByTagName("style")
                var themeStyle: Element? = null
                for (i in 0 until styles.length) {
                    val s = styles.item(i) as Element
                    if (s.getAttribute("name") == "PreferenceTheme") themeStyle = s
                }
                if (themeStyle != null) {
                    val fragmentStyle = doc.createElement("style").apply {
                        setAttribute("name", "Md3PreferenceFragment")
                        setAttribute("parent", "PreferenceFragment.Material")
                        appendChild(doc.createElement("item").apply {
                            setAttribute("name", "android:divider"); textContent = "@null"
                        })
                        appendChild(doc.createElement("item").apply {
                            setAttribute("name", "android:dividerHeight"); textContent = "0dp"
                        })
                        appendChild(doc.createElement("item").apply {
                            setAttribute("name", "allowDividerAfterLastItem"); textContent = "false"
                        })
                    }
                    resources.insertBefore(fragmentStyle, themeStyle)
                    themeStyle.appendChild(doc.createElement("item").apply {
                        setAttribute("name", "preferenceFragmentCompatStyle")
                        textContent = "@style/Md3PreferenceFragment"
                    })
                } else {
                    logger.warning("Md3SettingsPatch: PreferenceTheme style not found")
                }
            }
        } catch (e: Exception) {
            logger.warning("Md3SettingsPatch: divider style skipped (${e.message})")
        }
    }
}
