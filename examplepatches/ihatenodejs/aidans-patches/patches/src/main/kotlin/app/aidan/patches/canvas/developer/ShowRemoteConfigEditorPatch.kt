package app.aidan.patches.canvas.developer

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

private const val PREFERENCES_SECTION_RES_ID = 0x7f130c1a
private const val SETTINGS_BEHAVIOUR = "Lcom/instructure/student/features/settings/StudentSettingsBehaviour;"

@Suppress("unused")
val showRemoteConfigEditorPatch = bytecodePatch(
    name = "Show Remote Config Editor",
    description = "Adds the hidden Remote Config editor to Settings, allowing Firebase remote-config " +
        "overrides and experimental flags to be inspected and changed.",
    default = false
) {
    category("Developer")
    compatibleWith(COMPATIBILITY_CANVAS)

    execute {
        val settingsClass = mutableClassDefByOrNull(SETTINGS_BEHAVIOUR)
            ?: throw PatchException("Required class $SETTINGS_BEHAVIOUR not found.")
        val method = settingsClass.methods.firstOrNull {
            it.name == "getSettingsItems" &&
                it.returnType == "Ljava/util/Map;" &&
                it.implementation != null
        } ?: throw PatchException(
            "Required StudentSettingsBehaviour.getSettingsItems()Ljava/util/Map; not found."
        )

        val instructions = method.implementation!!.instructions.toList()
        if (instructions.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == PREFERENCES_SECTION_RES_ID }) {
            throw PatchException(
                "R.string.preferences ($PREFERENCES_SECTION_RES_ID) is not referenced in getSettingsItems; " +
                    "the settings section layout changed."
            )
        }
        val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returnIndex < 0) {
            throw PatchException("getSettingsItems has no return-object instruction.")
        }

        // v0 holds the LinkedHashMap<Int, List<SettingsItem>> built by the original body. The list
        // stored under R.string.preferences is replaced with a mutable copy before REMOTE_CONFIG is
        // appended, because the original list is a fixed-size view.
        method.addInstructions(
            returnIndex,
            """
            const v1, 0x7f130c1a
            invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v1
            invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v1
            check-cast v1, Ljava/util/Collection;
            new-instance v2, Ljava/util/ArrayList;
            invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
            sget-object v3, Lcom/instructure/pandautils/features/settings/SettingsItem;->REMOTE_CONFIG:Lcom/instructure/pandautils/features/settings/SettingsItem;
            invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
            const v3, 0x7f130c1a
            invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v3
            invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            """.trimIndent()
        )
    }
}
