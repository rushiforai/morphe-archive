package app.drbushytop.patches.relay.display

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val DIM_BLACK_LEVEL_CLASS = "Lapp/drbushytop/extension/relay/DimBlackLevel;"

/** Must match DimBlackLevel.MARKER_ATTR in the extension. */
private const val MARKER_ATTR = "drbushytopLiftInDimLight"

/**
 * `ThemeManager.e(int theme, SharedPreferences)`: whether the theme in use is Night, not
 * Night (OLED). Relay uses it to give Night grey comment and settings backgrounds.
 */
internal object IsGreyNightThemeFingerprint : Fingerprint(
    definingClass = "Lreddit/news/managers/ThemeManager;",
    name = "e",
    returnType = "Z",
    parameters = listOf("I", "Landroid/content/SharedPreferences;"),
)

/** Night's overlay becomes Night (OLED)'s, plus the marker the extension looks for. */
private val nightLikeOledResourcePatch = resourcePatch {
    execute {
        document("res/values/attrs.xml").use { document ->
            document.documentElement.appendChild(
                document.createElement("attr").apply {
                    setAttribute("name", MARKER_ATTR)
                    setAttribute("format", "boolean")
                },
            )
        }

        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")
            fun style(name: String) = (0 until styles.length).map { styles.item(it) as Element }
                .firstOrNull { it.getAttribute("name") == name }
                ?: throw PatchException("Relay's $name style was not found")

            val night = style("RelayDarkThemeOverlay")
            while (night.hasChildNodes()) night.removeChild(night.firstChild)
            style("RelayOledThemeOverlay").childNodes.let { items ->
                for (i in 0 until items.length) night.appendChild(items.item(i).cloneNode(true))
            }
            night.appendChild(
                document.createElement("item").apply {
                    setAttribute("name", MARKER_ATTR)
                    textContent = "true"
                },
            )

            // Relay lays this over the theme on its scrolling screens.
            val scrollable = style("RelayBackgroundScrollableDark")
            while (scrollable.hasChildNodes()) scrollable.removeChild(scrollable.firstChild)
            style("RelayBackgroundScrollableOled").childNodes.let { items ->
                for (i in 0 until items.length) scrollable.appendChild(items.item(i).cloneNode(true))
            }
        }
    }
}

@Suppress("unused")
val liftBlacksInDimLightPatch = bytecodePatch(
    name = "Night theme like OLED, grey in dim light",
    description = "Makes the Night theme look like Night (OLED), except at very low brightness, where its " +
        "blacks turn dark grey. For vivo phones with an adaptive refresh rate: they hold a mostly black " +
        "screen at 60 Hz in dim light, which uses more battery than the grey. Night (OLED) is not changed.",
    default = false,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)
    dependsOn(nightLikeOledResourcePatch)

    execute {
        // Everything Relay does differently for Night, it now does as for Night (OLED).
        IsGreyNightThemeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        RelayApplicationOnCreateFingerprint.method.apply {
            val superCall = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_SUPER &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "onCreate"
            }
            if (superCall < 0) throw PatchException("RelayApplication#onCreate does not call super.onCreate")
            addInstruction(
                superCall + 1,
                "invoke-static { p0 }, $DIM_BLACK_LEVEL_CLASS->install(Landroid/app/Application;)V",
            )
        }
    }
}
