/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.feed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.ads.FeedUnitCollectionInsertFingerprint
import app.morphe.patches.facebook.ads.VideoHomeFeedUnitSectionItemsFingerprint
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val HOME_FILTER =
    "Lapp/morphe/extension/facebook/feed/HomeFeedFilter;"

private fun MutableMethod.filterHomeFeedInsertion() {
    val freeRegisters = getFreeRegisterProvider(0, 2)
    val managerRegister = freeRegisters.getFreeRegister4Bit()
    val edgeRegister = freeRegisters.getFreeRegister4Bit()
    addInstructions(
        0,
        """
            move-object/from16 v$managerRegister, p0
            move-object/from16 v$edgeRegister, p2
            invoke-static {v$managerRegister, v$edgeRegister}, $HOME_FILTER->shouldDropEdge(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v$managerRegister
            if-eqz v$managerRegister, :morphe_feed_continue
            const/4 v$managerRegister, 0x1
            return v$managerRegister
            :morphe_feed_continue
            nop
        """.trimIndent(),
    )
}

@Suppress("unused")
val cleanHomeFeedPatch = bytecodePatch(
    name = "Clean Home feed",
    description = "Hides Home Reels panels, the Stories tray, and exact recommendation feed units.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        if (packageMetadata.versionName != FacebookTargets.V580) {
            FeedUnitCollectionInsertFingerprint.method.filterHomeFeedInsertion()
        }
        if (packageMetadata.versionName == FacebookTargets.V580) {
            val reelsSection = VideoHomeFeedUnitSectionItemsFingerprint.method
            val sectionReturns = reelsSection.implementation!!.instructions
                .withIndex()
                .filter { (_, instruction) ->
                    instruction.opcode == Opcode.RETURN_OBJECT
                }
                .map { (index, instruction) ->
                    index to (instruction as OneRegisterInstruction).registerA
                }
            check(sectionReturns.isNotEmpty()) {
                "Home Reels section has no object return"
            }
            sectionReturns.asReversed().forEach { (index, register) ->
                reelsSection.addInstructions(
                    index,
                    """
                        invoke-static/range {v$register .. v$register}, $HOME_FILTER->filterHomeReelsSection(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                        move-result-object v$register
                    """.trimIndent(),
                )
            }
            val storiesEligibility =
                StoriesTrayControllerEligibilityFingerprint.method
            val storyRegister = storiesEligibility
                .getFreeRegisterProvider(0, 1)
                .getFreeRegister4Bit()
            storiesEligibility.addInstructions(
                0,
                """
                    invoke-static {}, $HOME_FILTER->shouldHideStoriesTray()Z
                    move-result v$storyRegister
                    if-eqz v$storyRegister, :morphe_stories_tray_580_continue
                    const/4 v$storyRegister, 0x0
                    return v$storyRegister
                    :morphe_stories_tray_580_continue
                    nop
                """.trimIndent(),
            )

            println(
                "[CleanHomeFeed] 580 reelsSection=" +
                    VideoHomeFeedUnitSectionItemsFingerprint.classDef.type +
                    " stories=" +
                    StoriesTrayControllerClassFingerprint.classDef.type,
            )
            return@execute
        }
        val reelsQuery = HomeReelsQueryFingerprint.method
        val reelsInstructions =
            reelsQuery.implementation!!.instructions.toList()
        val reelsKeyIndices = reelsInstructions.withIndex().filter {
                (_, instruction) ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                        as? StringReference
            reference?.string == "should_fetch_fb_reels_ifu"
        }.map { it.index }
        check(reelsKeyIndices.size == 1) {
            "Expected one should_fetch_fb_reels_ifu query key"
        }
        val reelsKeyIndex = reelsKeyIndices.single()
        val reelsInvokeIndex = (
                reelsKeyIndex + 1..minOf(
                    reelsKeyIndex + 4,
                    reelsInstructions.lastIndex
                )
                ).firstOrNull { index ->
            val instruction = reelsInstructions[index]
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference
            instruction is FiveRegisterInstruction &&
                instruction.registerCount == 3 &&
                reference != null &&
                reference.definingClass ==
                HomeReelsQueryFingerprint.classDef.type &&
                reference.name == "A05" &&
                reference.parameterTypes.size == 3 &&
                reference.parameterTypes[1].toString() ==
                "Ljava/lang/String;" &&
                reference.parameterTypes[2].toString() == "Z"
        } ?: error("Home Reels query boolean consumer was not resolved")
        val reelsInvoke =
            reelsInstructions[reelsInvokeIndex] as FiveRegisterInstruction
        val reelsBooleanRegister = reelsInvoke.registerE
        check(reelsBooleanRegister <= 15) {
            "Home Reels query boolean requires a 4-bit register"
        }
        reelsQuery.addInstructions(
            reelsInvokeIndex,
            """
                invoke-static {v$reelsBooleanRegister}, $HOME_FILTER->filterHomeReelsFetch(Z)Z
                move-result v$reelsBooleanRegister
            """.trimIndent(),
        )

        val storiesEligibility =
            StoriesTrayControllerEligibilityFingerprint.method
        val storyRegister = storiesEligibility
            .getFreeRegisterProvider(0, 1)
            .getFreeRegister4Bit()
        storiesEligibility.addInstructions(
            0,
            """
                invoke-static {}, $HOME_FILTER->shouldHideStoriesTray()Z
                move-result v$storyRegister
                if-eqz v$storyRegister, :morphe_stories_tray_continue
                const/4 v$storyRegister, 0x0
                return v$storyRegister
                :morphe_stories_tray_continue
                nop
            """.trimIndent(),
        )

        val reelsSection = VideoHomeFeedUnitSectionItemsFingerprint.method
        val sectionReturns =
            reelsSection.implementation!!.instructions.withIndex().filter {
                    (_, instruction) ->
                instruction.opcode == Opcode.RETURN_OBJECT
            }.map { (index, instruction) ->
                index to (instruction as OneRegisterInstruction).registerA
            }
        check(sectionReturns.isNotEmpty()) {
            "Home Reels section has no object return"
        }
        sectionReturns.asReversed().forEach { (index, register) ->
            reelsSection.addInstructions(
                index,
                """
                    invoke-static/range {v$register .. v$register}, $HOME_FILTER->filterHomeReelsSection(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                    move-result-object v$register
                """.trimIndent(),
            )
        }

        println(
            "[CleanHomeFeed] reelsQuery=${HomeReelsQueryFingerprint.classDef.type}" +
                " stories=${StoriesTrayControllerClassFingerprint.classDef.type}" +
                " reelsSection=${VideoHomeFeedUnitSectionItemsFingerprint.classDef.type}",
        )
    }
}

object HomeReelsQueryFingerprint : Fingerprint(
    returnType = "L",
    strings = listOf(
        "NewsFeedQueryParamsHelpers.setShouldFetchFbReelsIfu",
        "should_fetch_fb_reels_ifu",
    ),
)

object StoriesTrayControllerClassFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/facebook/api/feedtype/FeedType;",
        "Lcom/facebook/auth/usersession/FbUserSession;",
    ),
    strings = listOf(
        "FbStoriesFeedTrayController.createFbStoriesTrayAdapter",
    ),
)

object StoriesTrayControllerEligibilityFingerprint : Fingerprint(
    classFingerprint = StoriesTrayControllerClassFingerprint,
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.methods
            .filter { it.name == "<init>" }
            .any { constructor ->
                constructor.implementation?.instructions?.any { instruction ->
                    val reference =
                        (instruction as? ReferenceInstruction)?.reference
                            as? MethodReference
                    reference?.definingClass == classDef.type &&
                        reference.name == method.name &&
                        reference.returnType == "Z" &&
                        reference.parameterTypes.isEmpty()
                } == true
            }
    },
)
