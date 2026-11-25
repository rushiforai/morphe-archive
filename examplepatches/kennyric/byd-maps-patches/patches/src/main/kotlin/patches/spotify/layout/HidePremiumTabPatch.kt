package patches.spotify.layout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import patches.spotify.COMPATIBILITY_SPOTIFY
import patches.spotify.shared.EXTENSION
import patches.spotify.shared.EXTENSION_PACKAGE
import patches.spotify.shared.parameterRegister
import patches.spotify.NavigationTabEnumFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HidePremiumTabPatch;"

private const val TAB_COUNT = 5

@Suppress("unused")
val hidePremiumTabPatch = bytecodePatch(
    name = "Hide Premium tab",
    description = "Removes the \"Premium\" tab from the bottom navigation bar.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

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

        val tabSet = mutableClassDefBy(tabSetConstructor.definingClass).methods.single { method ->
            method.name == tabSetConstructor.name &&
                method.parameterTypes.map(CharSequence::toString) ==
                tabSetConstructor.parameterTypes.map(CharSequence::toString) &&
                method.returnType == tabSetConstructor.returnType
        }
        tabSet.apply {
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
