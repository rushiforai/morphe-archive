package app.czyeru.patches.tiktok.misc.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.czyeru.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/navigation/NavigationTabsFilter;"

@Suppress("unused")
val feedTabNavigationPatch = bytecodePatch(
    name = "Feed tab navigation",
    description = "Controls which loaded top and bottom navigation tabs remain visible, blocks newly added tabs when requested, and can hide the Tako AI bubble.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/czyeru/extension/tiktok/settings/SettingsStatus;->enableFeedNavigation()V",
        )

        // Filter at the point where TikTok stores both top tab lists. The tab strip and
        // the home ViewPager read the node list (Yd2), so filtering only the protocol
        // list (K9) left the visible tabs unchanged and misaligned the two lists.
        TopTabListsWriterFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p2}, $EXTENSION_CLASS_DESCRIPTOR->filterTopTabs(Ljava/util/List;)Ljava/util/List;
                move-result-object p2
                invoke-static {p3, p2}, $EXTENSION_CLASS_DESCRIPTOR->filterTopTabProtocols(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
                move-result-object p3
            """,
        )

        BottomTabModelListFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS_DESCRIPTOR->filterBottomTabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }
        }
    }
}
