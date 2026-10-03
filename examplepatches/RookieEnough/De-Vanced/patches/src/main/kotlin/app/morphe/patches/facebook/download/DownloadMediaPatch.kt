/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.download

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.findFreeRegister
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private fun MutableMethod.addBeforeReturns(instructions: String) {
    implementation!!.instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
        .map { (index, _) -> index }
        .asReversed()
        .forEach { index -> addInstructions(index, instructions) }
}

@Suppress("unused")
val downloadMediaPatch = bytecodePatch(
    name = "Download Media",
    description = "Adds a native-styled Download media action to Facebook Reels and Stories menus.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        val onCreate = FacebookApplicationOnCreateFingerprint.method
        val returnIndex = onCreate.implementation!!.instructions
            .indexOfLast { instruction -> instruction.opcode == Opcode.RETURN_VOID }
        check(returnIndex >= 0) {
            "FacebookApplication.onCreate return was not resolved"
        }

        onCreate.addInstructions(
            returnIndex,
            """
                invoke-static {p0}, Lapp/morphe/extension/facebook/MediaDownloader;->initialize(Landroid/app/Application;)V
            """.trimIndent(),
        )

        StoryMenuContextFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p3
                invoke-static {v0}, Lapp/morphe/extension/facebook/MediaDownloader;->captureStoryCard(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val storyMenu = StoryRegularMenuFingerprint.method
        val storyBuilderBuilds = storyMenu.implementation!!.instructions.withIndex().filter {
                (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_STATIC &&
                instruction.opcode != Opcode.INVOKE_STATIC_RANGE
            ) {
                return@filter false
            }
            val reference =
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@filter false
            reference.definingClass == "LX/18a;" &&
                reference.name == "A0Z" &&
                reference.returnType == "Lcom/google/common/collect/ImmutableList;" &&
                reference.parameterTypes.size == 1 &&
                reference.parameterTypes[0].toString() ==
                "Lcom/google/common/collect/ImmutableList\$Builder;"
        }
        check(storyBuilderBuilds.isNotEmpty()) {
            "Story menu builder build sites were not resolved"
        }

        storyBuilderBuilds.asReversed().forEach { (index, instruction) ->
            val builderRegister = when (instruction) {
                is Instruction35c -> {
                    check(instruction.registerCount == 1) {
                        "Story menu builder 35c call has ${instruction.registerCount} registers"
                    }
                    instruction.registerC
                }

                is RegisterRangeInstruction -> {
                    check(instruction.registerCount == 1) {
                        "Story menu builder range call has ${instruction.registerCount} registers"
                    }
                    instruction.startRegister
                }

                else -> error("Story menu builder call has an unsupported format")
            }
            val freeRegister = storyMenu.findFreeRegister(index, builderRegister)
            val storyRowsInvoke = if (freeRegister <= 15) {
                "invoke-static {v$freeRegister}"
            } else {
                "invoke-static/range {v$freeRegister .. v$freeRegister}"
            }
            storyMenu.addInstructions(
                index,
                """
                    move-object/from16 v$freeRegister, v$builderRegister
                    $storyRowsInvoke, Lapp/morphe/extension/facebook/MediaDownloader;->finalizeStoryMenuBuilder(Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }
        println(
            "[DownloadMediaPatch] Story A0Z sites=" + storyBuilderBuilds.size,
        )

        val storyMenuInstructions = storyMenu.implementation!!.instructions
        val storyFinalIterators = storyMenuInstructions.withIndex().filter {
                (index, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_STATIC &&
                instruction.opcode != Opcode.INVOKE_STATIC_RANGE
            ) {
                return@filter false
            }
            val reference =
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@filter false
            if (reference.definingClass != "LX/18a;" ||
                reference.name != "A0b" ||
                reference.returnType != "LX/GAw;" ||
                reference.parameterTypes.size != 1 ||
                reference.parameterTypes[0].toString() !=
                "Lcom/google/common/collect/ImmutableCollection;"
            ) {
                return@filter false
            }
            val listRegister = when (instruction) {
                is Instruction35c -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> return@filter false
            }
            val result = storyMenuInstructions.getOrNull(index + 1)
                as? OneRegisterInstruction
                ?: return@filter false
            listRegister == 8 && result.registerA == 11
        }
        check(storyFinalIterators.size == 1) {
            "Expected one final Story Wkb iterator, found ${storyFinalIterators.size}"
        }
        storyFinalIterators.forEach { (index, instruction) ->
            val invoke = instruction as? Instruction35c
                ?: error("Final Story Wkb iterator uses an unsupported format")
            check(invoke.registerCount == 1 && invoke.registerC == 8) {
                "Final Story Wkb iterator expected v8, got v${invoke.registerC}"
            }
            val freeRegister = storyMenu.findFreeRegister(index, invoke.registerC)
            val invokeStatic = if (freeRegister <= 15) {
                "invoke-static {v$freeRegister}"
            } else {
                "invoke-static/range {v$freeRegister .. v$freeRegister}"
            }
            storyMenu.addInstructions(
                index,
                """
                    move-object/from16 v$freeRegister, v${invoke.registerC}
                    $invokeStatic, Lapp/morphe/extension/facebook/MediaDownloader;->finalizeStoryMenuItems(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v${invoke.registerC}
                    check-cast v${invoke.registerC}, Lcom/google/common/collect/ImmutableCollection;
                """.trimIndent(),
            )
        }
        println(
            "[DownloadMediaPatch] Story final Wkb iterator=${storyFinalIterators.single().index}",
        )

        val reelsOverflow = ReelsOverflowBuilderFingerprint.method
        reelsOverflow.addBeforeReturns(
            """
                invoke-static/range {p0 .. p15}, Lapp/morphe/extension/facebook/MediaDownloader;->finalizeReelsMenu(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZZZ)V
            """.trimIndent(),
        )

        if (packageMetadata.versionName == FacebookTargets.V580) {
            val moreSheet = Reels580MoreSheetFingerprint.method
            val moreSheetReturns = moreSheet.implementation!!.instructions
                .withIndex()
                .filter { (_, instruction) ->
                    instruction.opcode == Opcode.RETURN_VOID
                }
                .map { (index, _) -> index }
            check(moreSheetReturns.isNotEmpty()) {
                "580 Reels more sheet has no return site"
            }
            moreSheetReturns.asReversed().forEach { index ->
                val freeRegisters = moreSheet.getFreeRegisterProvider(index, 2)
                val contextRegister = freeRegisters.getFreeRegister4Bit()
                val menuRegister = freeRegisters.getFreeRegister4Bit()
                moreSheet.addInstructions(
                    index,
                    """
                        move-object/from16 v$contextRegister, p3
                        move-object/from16 v$menuRegister, p8
                        invoke-static {v$contextRegister, v$menuRegister}, Lapp/morphe/extension/facebook/MediaDownloader;->finalizeReelsMoreSheet(Ljava/lang/Object;Ljava/lang/Object;)V
                    """.trimIndent(),
                )
            }

            println(
                "[DownloadMediaPatch] 580 overflow=" +
                    ReelsOverflowBuilderFingerprint.classDef.type +
                    "->" + ReelsOverflowBuilderFingerprint.method.name +
                    " moreSheet=" + moreSheet.definingClass +
                    "->" + moreSheet.name,
            )
            return@execute
        }

        val returnedMenus =
            ReelsReturnedMenu578Fingerprint.methodOrNull
                ?: ReelsReturnedMenuFingerprint.methodOrNull
                ?: error("Reels returned-menu producer was not resolved")
        val returnSites = returnedMenus.implementation!!.instructions.withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
            .map { (index, instruction) ->
                index to (instruction as OneRegisterInstruction).registerA
            }
        check(returnSites.isNotEmpty()) {
            "Reels returned-menu sites were not resolved"
        }
        returnSites.asReversed().forEach { (index, returnRegister) ->
            val ownerRegister =
                returnedMenus.findFreeRegister(index, returnRegister)
            val menuRegister =
                returnedMenus.findFreeRegister(index, returnRegister, ownerRegister)
            check(ownerRegister <= 15 && menuRegister <= 15) {
                "Reels returned-menu hook needs two 4-bit registers"
            }
            returnedMenus.addInstructions(
                index,
                """
                    move-object/from16 v$ownerRegister, p0
                    move-object/from16 v$menuRegister, v$returnRegister
                    invoke-static {v$ownerRegister, v$menuRegister}, Lapp/morphe/extension/facebook/MediaDownloader;->finalizeReturnedReelsMenu(Ljava/lang/Object;Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }

        println(
            "[DownloadMediaPatch] Installed native Story and Reels menu actions" +
                " returned=${returnedMenus.definingClass}->${returnedMenus.name}",
        )
    }
}

object FacebookApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/katana/app/FacebookApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object StoryMenuContextFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/stories/viewer/ui/buckets/regular/topbar/menu/StoryViewerMoreButtonCallback;",
    name = "A0F",
    returnType = "V",
)

object StoryRegularMenuFingerprint : Fingerprint(
    definingClass =
        "Lcom/facebook/stories/viewer/ui/buckets/regular/topbar/menu/StoryViewerMoreButtonCallback;",
    name = "A08",
    returnType = "V",
)

object ReelsOverflowBuilderFingerprint : Fingerprint(
    name = "A00",
    returnType = "V",
    strings = listOf("reels_overflow_menu"),
)

object Reels580MoreSheetFingerprint : Fingerprint(
    definingClass = "LX/U1V;",
    name = "A04",
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "Lcom/facebook/fbshorts/analytics/AnalyticsConstants\$UpstreamPlayerSource;",
        "LX/5PU;",
        "LX/3Qd;",
        "Lcom/facebook/video/common/playerorigin/PlayerOrigin;",
        "LX/51C;",
        "LX/Cv5;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
    strings = listOf("fds_control_clear_mode"),
)

object ReelsReturnedMenuFingerprint : Fingerprint(
    definingClass = "LX/ZIq;",
    name = "A03",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

object ReelsReturnedMenu578Fingerprint : Fingerprint(
    definingClass = "LX/Xko;",
    name = "A03",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)
