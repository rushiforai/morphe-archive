package app.template.patches.aare

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.template.patches.shared.Constants.COMPATIBILITY_AARE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SETTINGS_CLASS = "Lapp/template/extension/aare/PatchSettings;"

private const val SETTINGS_ACTIVITY = "app.template.extension.aare.PatchSettingsActivity"

private const val PAGE_CLASS = "Lnet/prototux/aare/ui/Page;"

/** The static initializer of AARE's settings pages (enum Page), which builds their list. */
internal object PageInitFingerprint : Fingerprint(
    definingClass = PAGE_CLASS,
    name = "<clinit>",
    returnType = "V",
)

/** CategoryRow(page, onClick): one row of AARE's settings home. */
internal object CategoryRowFingerprint : Fingerprint(
    definingClass = "Lnet/prototux/aare/ui/MainActivityKt;",
    name = "CategoryRow",
    returnType = "V",
    parameters = listOf(PAGE_CLASS, "Lkotlin/jvm/functions/Function0;", "Landroidx/compose/runtime/Composer;", "I"),
)

/** PatchSettings.registerAll(String): where each applied patch registers its switch. */
internal object RegisterAllFingerprint : Fingerprint(
    definingClass = SETTINGS_CLASS,
    name = "registerAll",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * Lists a patch on the Settings screen. Call from the `execute` block of a patch that depends on
 * [settingsPatch], with one of the keys of PatchSettings.
 */
internal fun registerSetting(key: String) {
    RegisterAllFingerprint.method.addInstructions(
        0,
        """
            const-string p0, "$key"
            invoke-static { p0 }, $SETTINGS_CLASS->register(Ljava/lang/String;)V
        """,
    )
}

private val strings = mapOf(
    "values" to ("Settings" to "Morphe patches: turn the added features on or off"),
    "values-it" to ("Settings" to "Patch Morphe: attiva o disattiva le funzioni aggiunte"),
)

@Suppress("unused")
val settingsPatch = patch(
    name = "Settings",
    description = "Adds \"Settings\" to AARE's settings home: one switch with a short description for each " +
        "installed patch. New releases of the patches add their switches there by themselves.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    extendWith("extensions/extension.mpe")

    execute {
        // The row's title and subtitle, which AARE reads with stringResource.
        strings.forEach { (folder, texts) ->
            resourceXml("res/$folder/strings.xml", copy = false).use { xml ->
                xml.root.appendChild("string") {
                    setAttribute("name", "aare_patches_settings_title")
                    text = texts.first
                }
                xml.root.appendChild("string") {
                    setAttribute("name", "aare_patches_settings_subtitle")
                    text = texts.second
                }
            }
        }

        // The screen of switches.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.root.children("application").first()
            val declared = application.children("activity").any { it.attribute("android:name") == SETTINGS_ACTIVITY }
            if (!declared) {
                application.appendChild("activity") {
                    setAttribute("android:name", SETTINGS_ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                }
            }
        }

        // An extra entry of the Page enum, after "About": the settings home lists every entry.
        PageInitFingerprint.method.apply {
            val valuesCall = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "\$values"
            }
            if (valuesCall < 0) throw PatchException("Page.\$values() call not found")

            // After move-result-object v0 (the array of pages), before it is stored in $VALUES.
            addInstructions(
                valuesCall + 2,
                """
                    new-instance v1, $PAGE_CLASS
                    invoke-static { }, $SETTINGS_CLASS->titleRes()I
                    move-result v4
                    invoke-static { }, $SETTINGS_CLASS->subtitleRes()I
                    move-result v5
                    sget-object v2, Landroidx/compose/material/icons/Icons${'$'}Rounded;->INSTANCE:Landroidx/compose/material/icons/Icons${'$'}Rounded;
                    invoke-static { v2 }, Landroidx/compose/material/icons/rounded/SettingsKt;->getSettings(Landroidx/compose/material/icons/Icons${'$'}Rounded;)Landroidx/compose/ui/graphics/vector/ImageVector;
                    move-result-object v6
                    const-string v2, "AARE_PATCHES"
                    array-length v3, v0
                    invoke-direct/range { v1 .. v6 }, $PAGE_CLASS-><init>(Ljava/lang/String;IIILandroidx/compose/ui/graphics/vector/ImageVector;)V
                    invoke-static { v0, v1 }, $SETTINGS_CLASS->withPage([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, [$PAGE_CLASS
                """,
            )
        }

        // The new row opens the Settings screen instead of a page of AARE.
        CategoryRowFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $SETTINGS_CLASS->onCategoryClick(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, Lkotlin/jvm/functions/Function0;
            """,
        )
    }
}
