package patapon888.morphe.patches.nova.bubble

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// The extension links against obfuscated names, so only the exact version it was built for is supported.
private val NOVA_LAUNCHER_9_0_0 = Compatibility(
    name = "Nova Launcher",
    packageName = "com.teslacoilsw.launcher",
    targets = listOf(AppTarget("90000 (9.0.0)", minSdk = 36)),
    appIconColor = 0xDA4624
)

private const val EXTENSION_CLASS = "Lpatapon888/morphe/extension/nova/bubble/OpenInBubblePatch;"

/**
 * Obfuscated Nova 9.0.0 members the extension links against. Checked before patching
 * so an incompatible Nova version fails to patch instead of crashing at runtime.
 */
private val requiredMembers = mapOf(
    "Lma/q;" to listOf("a", "b"),
    "Lma/s;" to listOf("<init>"),
    "Lia/e;" to listOf("l"),
    "Li10/j1;" to listOf("<init>"),
    "Lz00/h;" to listOf("<init>"),
    "Lr1/h1;" to listOf(),
    "Lr1/f1;" to listOf("setValue"),
    "Landroidx/compose/runtime/d;" to listOf("j"),
    "Lo30/j;" to listOf("r"),
    "Lcom/teslacoilsw/launcher/NovaLauncher;" to listOf("e1"),
)

private val openInBubbleResourcePatch = resourcePatch {
    execute {
        document("res/values/strings.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0)
            mapOf(
                "morphe_nova_bubble_popup_title" to "Open in bubble",
                "morphe_nova_bubble_settings_title" to "Open in bubble",
            ).forEach { (name, value) ->
                resources.appendChild(document.createElement("string").apply {
                    setAttribute("name", name)
                    textContent = value
                })
            }
        }

        get("res/drawable/morphe_ic_bubble.xml").writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp"
                android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#ff000000"
                    android:pathData="M7.2,14.4m-3.2,0a3.2,3.2 0,1 1,6.4 0a3.2,3.2 0,1 1,-6.4 0" />
                <path android:fillColor="#ff000000"
                    android:pathData="M14.8,18m-2,0a2,2 0,1 1,4 0a2,2 0,1 1,-4 0" />
                <path android:fillColor="#ff000000"
                    android:pathData="M15.2,8.8m-4.8,0a4.8,4.8 0,1 1,9.6 0a4.8,4.8 0,1 1,-9.6 0" />
            </vector>
            """.trimIndent()
        )
    }
}

private fun MutableMethod.wrapListResult(index: Int, register: Int, extensionMethod: String) =
    addInstructions(
        index,
        """
            invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->$extensionMethod(Ljava/util/List;)Ljava/util/List;
            move-result-object v$register
        """
    )

@Suppress("unused")
val openInBubblePatch = bytecodePatch(
    name = "Open in bubble",
    description = "Requires root. Adds an \"Open in bubble\" long-press option that opens apps as Android 17 app bubbles. " +
        "Can be toggled in Settings > Look & feel > Long-press Menu. Only for Nova Launcher 9.0.0 on Android 16+."
) {
    compatibleWith(NOVA_LAUNCHER_9_0_0)

    dependsOn(openInBubbleResourcePatch)

    extendWith("extensions/novabubble.mpe")

    execute {
        requiredMembers.forEach { (type, members) ->
            val classDef = classDefByOrNull(type)
                ?: throw PatchException("Unsupported Nova Launcher version: $type not found (only 9.0.0 is supported)")
            members.forEach { name ->
                if (classDef.methods.none { it.name == name }) {
                    throw PatchException("Unsupported Nova Launcher version: $type->$name not found (only 9.0.0 is supported)")
                }
            }
        }

        PopupItemFactoriesFingerprint.apply {
            val moveResult = instructionMatches[1]
            method.wrapListResult(
                moveResult.index + 1,
                moveResult.getInstruction<OneRegisterInstruction>().registerA,
                "addPopupItem"
            )
        }

        LongPressMenuSettingsFingerprint.apply {
            val moveResult = instructionMatches.last()
            method.wrapListResult(
                moveResult.index + 1,
                moveResult.getInstruction<OneRegisterInstruction>().registerA,
                "addSettingsRow"
            )
        }
    }
}
