package app.template.patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.getMutableMethod
import app.template.patches.spotify.shared.NavigationTabEnumFingerprint
import app.template.patches.spotify.shared.parameterRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyNavTabFilter;"

private const val TAB_COUNT = 5

// Removes the "Premium" tab from the bottom navigation bar.
//
// The bottom bar is built once from a (Tab, Tab, Tab, Tab, Tab, int flags)
// constructor. The patch prepends a prepareTabs call that classifies the five
// tab parameters (each tab class holds the navigation tab enum), then rewrites
// each tab register through nextTab and the flags register through finishTabs.
// The extension removes the Premium tab from the set, pads the result back to
// five tabs and clears the flags that describe the tab count. Tabs without a
// Premium entry pass through untouched.
//
// Fail-safe: the patched constructor is the only one matching the five-tab
// shape; a different tab schema fails the patch loudly at patch time, and the
// extension returns the original tabs whenever the enum cannot be read.

@Suppress("unused")
val spotifyHidePremiumTabPatch = bytecodePatch(
    name = "Hide Premium tab",
    description = "Removes the \"Premium\" tab from the bottom navigation bar.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val tabEnumType = NavigationTabEnumFingerprint.originalClassDef.type

        // Tabs are classes holding the tab enum.
        val tabTypes = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (classDef.fields.any { it.type == tabEnumType && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
                tabTypes += classDef.type
            }
        }

        // The tab set is created with (Tab, Tab, Tab, Tab, Tab, int flags).
        val tabSetConstructors = mutableListOf<Method>()
        classDefForEach { classDef ->
            classDef.methods.filterTo(tabSetConstructors) { method ->
                val parameters = method.parameterTypes.map { it.toString() }
                method.name == "<init>" && method.implementation != null &&
                    parameters.size == TAB_COUNT + 1 && parameters.last() == "I" &&
                    parameters.dropLast(1).distinct().singleOrNull() in tabTypes
            }
        }
        val tabSetConstructor = tabSetConstructors.singleOrNull()
            ?: throw PatchException("Expected one navigation tab set constructor, found ${tabSetConstructors.size}")

        tabSetConstructor.getMutableMethod().apply {
            val tabType = parameterTypes.first().toString()
            val firstTabRegister = parameterRegister(0)
            val lastTabRegister = parameterRegister(TAB_COUNT - 1)
            val flagsRegister = parameterRegister(TAB_COUNT)

            val replaceTabs = (firstTabRegister..lastTabRegister).joinToString("\n") { register ->
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->nextTab(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $tabType
                """
            }

            addInstructions(
                0,
                """
                    invoke-static/range { v$firstTabRegister .. v$lastTabRegister }, $EXTENSION_CLASS->prepareTabs(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                    $replaceTabs
                    invoke-static/range { v$flagsRegister .. v$flagsRegister }, $EXTENSION_CLASS->finishTabs(I)I
                    move-result v$flagsRegister
                """,
            )
        }
    }
}
