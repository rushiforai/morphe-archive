/*
 * Copyright 2026 BlueIT contributors
 */
package app.morphe.patches.tiktok.interaction.seen

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.feedfilter.ForYouFeedResponseFingerprint
import app.morphe.patches.tiktok.feedfilter.FollowFeedFingerprint
import app.morphe.patches.tiktok.feedfilter.FollowFeedListGetItemsFingerprint
import app.morphe.patches.tiktok.feedfilter.FollowFeedPresenterPostProcessFingerprint
import app.morphe.patches.tiktok.feedfilter.feedFilterPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FILTER_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/feedfilter/SeenVideoFeedFilter;"
private const val HISTORY_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/seen/SeenVideoHistory;"

@Suppress("unused")
val hideSeenVideosPatch = bytecodePatch(
    name = "Hide already seen videos",
    description = "Keeps a local BlueIT watch-history and filters videos you already watched from newly loaded feed batches.",
    default = true,
) {
    dependsOn(feedFilterPatch)

    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableSeenVideoFilter()V",
        )

        PlayerProgressFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p5}, $HISTORY_DESCRIPTOR->onPlayProgressChange(Ljava/lang/String;JJ)V",
        )

        ForYouFeedResponseFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {v$register .. v$register}, $FILTER_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;)V",
                )
            }
        }

        FollowFeedFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                method.addInstructions(
                    returnIndex,
                    """
                        if-eqz v$register, :blueit_skip_seen_filter_$returnIndex
                        invoke-static/range {v$register .. v$register}, $FILTER_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V
                        :blueit_skip_seen_filter_$returnIndex
                        nop
                    """,
                )
            }
        }

        FollowFeedListGetItemsFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {p0 .. p0}, $FILTER_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V",
                )
            }
        }

        FollowFeedPresenterPostProcessFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {p1 .. p1}, $FILTER_DESCRIPTOR->filterFinal(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V",
                )
            }
        }
    }
}
