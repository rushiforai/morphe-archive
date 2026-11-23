package app.jofslash.patches.quora.tabs

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/NativeTweaksPatch;"
private const val TAB_BAR = "Lcom/quora/android/controls/QTabBar;"
private const val TAB = "Lcom/quora/android/controls/QTab;"

internal object CreateTabListFingerprint : Fingerprint(
    definingClass = TAB_BAR,
    name = "createTabList",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(),
)

internal object SetupTabsFingerprint : Fingerprint(
    definingClass = TAB_BAR,
    name = "setupTabs",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val hideTabsPatch = bytecodePatch(
    name = "Hide tabs",
    description = "Removes the tabs you pick from the bottom bar. Home always stays.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    // QTab names in the app, with the label the tab shows.
    val tabs = mapOf(
        "FOLLOWING" to "Following",
        "ANSWER" to "Answer",
        "SPACES" to "Spaces",
        "NOTIFS" to "Notifications",
    ).map { (name, label) ->
        name to booleanOption(
            key = "hide${label}Tab",
            default = name == "SPACES",
            title = "Hide $label tab",
        )
    }

    execute {
        registerSetting("hideTabs", "Hide tabs")
        val hidden = tabs.filter { (_, option) -> option.value == true }.joinToString(",") { it.first }

        CreateTabListFingerprint.method.apply {
            // Right after the last tab is added. Other paths jump straight to the return,
            // so a call placed before it would be skipped.
            val instructions = implementation!!.instructions
            val addIndex = instructions.indexOfLast {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((it as ReferenceInstruction).reference as MethodReference).name == "add"
            }
            val register = getInstruction<FiveRegisterInstruction>(addIndex).registerC
            val insertIndex =
                if (instructions.elementAt(addIndex + 1).opcode == Opcode.MOVE_RESULT) addIndex + 2 else addIndex + 1
            addInstruction(
                insertIndex,
                "invoke-static { v$register }, $EXTENSION_CLASS->removeHiddenTabs(Ljava/util/List;)V"
            )

            addInstructions(
                0,
                """
                    const-string v0, "$hidden"
                    invoke-static { v0 }, $EXTENSION_CLASS->setHiddenTabs(Ljava/lang/String;)V
                """
            )
        }
    }
}

@Suppress("unused")
val startTabPatch = bytecodePatch(
    name = "Start tab",
    description = "Opens the app on the tab you pick instead of Home.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    val startTab = stringOption(
        key = "startTab",
        default = "FOLLOWING",
        values = mapOf(
            "Following" to "FOLLOWING",
            "Answer" to "ANSWER",
            "Spaces" to "SPACES",
            "Notifications" to "NOTIFS",
        ),
        title = "Start tab",
        description = "The tab the app opens on. If that tab is hidden, the app opens on Home.",
        required = true,
    )

    execute {
        registerSetting("startTab", "Start tab")
        // setupTabs selects selectedTabType once the tabs are created, so set it first.
        SetupTabsFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $TAB_BAR->selectedTabType:$TAB
                const-string v1, "${startTab.value}"
                invoke-static { v0, v1 }, $EXTENSION_CLASS->startTab(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $TAB
                iput-object v0, p0, $TAB_BAR->selectedTabType:$TAB
            """
        )
    }
}
