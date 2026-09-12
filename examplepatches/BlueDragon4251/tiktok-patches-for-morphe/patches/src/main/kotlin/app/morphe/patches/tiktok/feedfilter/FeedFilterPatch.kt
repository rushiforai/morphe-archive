/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/feedfilter/FeedFilterPatch.kt
 */
package app.morphe.patches.tiktok.feedfilter

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/feedfilter/FeedItemsFilter;"
private const val FOR_YOU_GUARD_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/feedfilter/ForYouFeedGuard;"
private const val TAKO_AI_FILTER_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/feedfilter/TakoAiFilter;"
private const val FEED_ITEM_LIST_DESCRIPTOR = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"

@Suppress("unused")
val feedFilterPatch = bytecodePatch(
    name = "Feed filter",
    description = "Hides feed ads, TikTok Shop items, livestreams, stories, photo posts, and videos outside configured view or like ranges.",
    default = true,
) {
    dependsOn(
        sharedExtensionPatch,
    )

    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        // Enables the feed filter extension after settings were loaded.
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableFeedFilter()V",
        )

        // Mark only the canonical For You network response. FeedItemList is shared by
        // profiles, detail and series screens, so global re-filtering is identity-guarded.
        ForYouFeedResponseFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {v$register .. v$register}, $FOR_YOU_GUARD_CLASS_DESCRIPTOR->markAndFilter($FEED_ITEM_LIST_DESCRIPTOR)V",
                )
            }
        }

        // TikTok 46.4.3 has a separate cached For You fetch path which does not have to
        // pass through FeedApi.LIZIZ(...). Its own fetchFeeds routine already removes
        // native ads/LIVE/story entries, so it is an exact feed-only anchor. Re-run the
        // complete BlueIT filter after TikTok finishes mutating that cached list.
        ForYouCachedFeedFilterFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {p0 .. p0}, $FOR_YOU_GUARD_CLASS_DESCRIPTOR->markAndFilter($FEED_ITEM_LIST_DESCRIPTOR)V",
                )
            }
        }

        // `tryUseCache` can also return the cached FYP list directly. Mark/filter every
        // non-null return before it reaches downstream UI. markAndFilter itself is null-safe.
        ForYouCachedFeedReadFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {v$register .. v$register}, $FOR_YOU_GUARD_CLASS_DESCRIPTOR->markAndFilter($FEED_ITEM_LIST_DESCRIPTOR)V",
                )
            }
        }

        // Device testing of dev.7 proved a later bypass still exists. The exact 46.4.3
        // Feed0VVManager commit runnable receives a FeedItemList from a Callable and then
        // runs commercial processors such as filter_show_ad/filter_installed_ad, fyp ad
        // session positioning, soft_ads and roi2 immediately before posting to feed UI.
        // Mark every FeedItemList result at its CHECK_CAST. Once marked, the getItems()
        // hook below re-applies both base and advanced filters before every later list read.
        // Finally, re-filter the result again immediately before Message.obj receives it;
        // this point is after TikTok's commercial processors and is the last exact handoff
        // before the completed feed is posted to the UI handler.
        ForYouFinalCommitFingerprint.method.let { method ->
            val castIndices = method.implementation!!.instructions.withIndex()
                .filter { (_, instruction) ->
                    instruction.opcode == Opcode.CHECK_CAST &&
                        instruction.getReference<TypeReference>()?.type == FEED_ITEM_LIST_DESCRIPTOR
                }
                .map { it.index }
                .toList()

            check(castIndices.isNotEmpty()) {
                "Exact TikTok 46.4.3 Feed0VVManager commit matched without a FeedItemList CHECK_CAST"
            }

            castIndices.asReversed().forEach { castIndex ->
                val register = (method.implementation!!.instructions[castIndex] as OneRegisterInstruction).registerA
                method.addInstructions(
                    castIndex + 1,
                    "invoke-static/range {v$register .. v$register}, $FOR_YOU_GUARD_CLASS_DESCRIPTOR->markAndFilter($FEED_ITEM_LIST_DESCRIPTOR)V",
                )
            }

            // Re-read the mutated instruction list after the CHECK_CAST injections above.
            // The exact 46.4.3 commit has one Message.obj handoff. registerA of IPUT_OBJECT
            // is the value being posted; use an Object-typed guard so verifier merge paths
            // where the result is not a FeedItemList remain valid.
            val uiCommitIndices = method.implementation!!.instructions.withIndex()
                .filter { (_, instruction) ->
                    if (instruction.opcode != Opcode.IPUT_OBJECT) return@filter false
                    val field = instruction.getReference<FieldReference>() ?: return@filter false
                    field.definingClass == "Landroid/os/Message;" &&
                        field.name == "obj" &&
                        field.type == "Ljava/lang/Object;"
                }
                .map { it.index }
                .toList()

            check(uiCommitIndices.size == 1) {
                "Exact TikTok 46.4.3 Feed0VVManager commit expected one Message.obj UI handoff, found ${uiCommitIndices.size}"
            }

            uiCommitIndices.asReversed().forEach { uiCommitIndex ->
                val resultRegister =
                    (method.implementation!!.instructions[uiCommitIndex] as TwoRegisterInstruction).registerA
                method.addInstructions(
                    uiCommitIndex,
                    "invoke-static/range {v$resultRegister .. v$resultRegister}, $FOR_YOU_GUARD_CLASS_DESCRIPTOR->filterBeforeUiCommit(Ljava/lang/Object;)V",
                )
            }
        }

        // TikTok applies further response processors/client-side insertions after network,
        // cache and final commit acquisition. Re-filter whenever an already marked FYP list
        // is read again. Non-feed lists remain untouched by the identity guard.
        FeedItemListGetItemsFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {p0 .. p0}, $FOR_YOU_GUARD_CLASS_DESCRIPTOR->filterIfMarked($FEED_ITEM_LIST_DESCRIPTOR)V",
                )
            }
        }

        FollowFeedFingerprint.method.let { method ->
            val returnIndices =
                method.implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                    .map { it.index }
                    .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = (method.implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA

                method.addInstructions(
                    returnIndex,
                    """
                        if-eqz v$register, :morphe_skip_filter_$returnIndex
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V
                        :morphe_skip_filter_$returnIndex
                        nop
                    """,
                )
            }
        }

        FollowFeedListGetItemsFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->filter(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V",
                )
            }
        }

        FollowFeedPresenterPostProcessFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->filterFinal(Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;)V",
                )
            }
        }

        TakoAiFeedButtonSetVisibleFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $TAKO_AI_FILTER_CLASS_DESCRIPTOR->shouldHideFeedButton()Z
                move-result v0
                if-eqz v0, :morphe_keep_feed_tako_visible_state
                const/4 p1, 0x0
                :morphe_keep_feed_tako_visible_state
                nop
            """,
        )

        TakoAiFeedButtonBindFingerprint.method.addInstructions(
            2,
            "invoke-static {p1}, $TAKO_AI_FILTER_CLASS_DESCRIPTOR->hideBoundFeedButtonView(Landroid/view/View;)V",
        )
    }
}
