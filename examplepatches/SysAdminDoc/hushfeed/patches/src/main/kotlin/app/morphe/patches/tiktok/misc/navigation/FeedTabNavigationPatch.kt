/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.misc.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val TOP_TAB_LAYOUT_ABILITY =
    "Lcom/ss/android/ugc/aweme/homepage/ui/view/tab/top/TopTabLayoutAbility;"

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/navigation/NavigationTabsFilter;"
private const val TAB_BADGES_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/navigation/TabBadges;"

internal fun isTopTabLayoutConstructor(method: com.android.tools.smali.dexlib2.iface.Method): Boolean =
    method.definingClass == TOP_TAB_LAYOUT_ABILITY &&
        method.name == "<init>" &&
        method.returnType == "V" &&
        method.parameterTypes.size == 2 &&
        method.parameterTypes[0].startsWith("L") &&
        method.parameterTypes[1] == "Landroid/widget/FrameLayout;"

private object TopTabLayoutConstructorFingerprint : app.morphe.patcher.Fingerprint(
    definingClass = TOP_TAB_LAYOUT_ABILITY,
    returnType = "V",
    custom = { method, _ -> isTopTabLayoutConstructor(method) },
)

@Suppress("unused")
val feedTabNavigationPatch = bytecodePatch(
    name = "Feed tab navigation",
    description = "Controls which loaded top and bottom navigation tabs remain visible, blocks newly added tabs when requested, and can hide the Tako AI bubble and the unread badges on the bottom tabs. Switch: Hushfeed settings > Feed tabs.",
    default = true,
) {
    category("Settings")
    dependsOn(settingsPatch, sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableFeedNavigation()V",
        )

        // One method answering to both scenes would take both hooks and leave the other list
        // unfiltered, with nothing failing.
        if (TopTabModelListFingerprint.method.name == BottomTabModelListFingerprint.method.name) {
            throw PatchException(
                "Feed tab navigation: both tab lists resolved to " +
                    "${TopTabModelListFingerprint.method.name}.",
            )
        }

        TopTabModelListFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                method.addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS_DESCRIPTOR->filterTopTabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }
        }

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

        TopTabLayoutConstructorFingerprint.method.let { method ->
            val returns = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            val returnIndex = returns.singleOrNull()
                ?: throw PatchException(
                    "Feed tab navigation: expected one TopTabLayoutAbility constructor return, " +
                        "found ${returns.size}.",
                )
            method.addInstruction(
                returnIndex,
                "invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->" +
                    "installLoneForYouHeaderHider(Landroid/view/View;)V",
            )
        }

        // The unread badges on the bottom tabs (the red count on Inbox, the dot on Profile):
        // every show of either passes through the tab icon's own setter, so the visibility is
        // answered there, and a repeated native update cannot bring a hidden badge back.
        val countSetter = TabCountDotVisibilityFingerprint.method
        val dotSetter = TabDotVisibilityFingerprint.method
        check(countSetter.definingClass == dotSetter.definingClass) {
            "Feed tab navigation: the badge setters sit on ${countSetter.definingClass} and " +
                "${dotSetter.definingClass}, not on one tab icon."
        }
        val icon = mutableClassDefBy(countSetter.definingClass)
        check(icon.methods.any { it.name == "getCountDotView" } && icon.methods.any { it.name == "getRedDotVIew" }) {
            "Feed tab navigation: ${icon.type} has no badge views, so it is not the tab icon."
        }
        listOf(countSetter to "countDotVisibility", dotSetter to "tabDotVisibility").forEach { (setter, hook) ->
            setter.addInstructions(
                0,
                """
                    invoke-static {p1}, $TAB_BADGES_CLASS_DESCRIPTOR->$hook(I)I
                    move-result p1
                """,
            )
        }
    }
}
