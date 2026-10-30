package app.pielm.patches.twitter.gif

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.pielm.patches.twitter.gif.Constants.COMPATIBILITY_X
import app.pielm.patches.twitter.gif.Constants.GIF_HOOKS_DESCRIPTOR
import app.pielm.patches.twitter.gif.Constants.PATCH_INFO_HOOK_DESCRIPTOR
import app.pielm.patches.twitter.gif.Constants.PATCH_VERSION
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n

@Suppress("unused")
val nativeGifDownloadPatch = bytecodePatch(
    name = "Native GIF download",
    description = "Downloads and converts X/Twitter GIFs into real animated .gif files. " +
            "Supports Piko Native Downloader, Inline Download Button, and X's media menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_X)

    extendWith("extensions/extension.mpe")

    // Run in finalize so all extensions (including Piko's twitter.mpe when applied in parallel)
    // and all execute blocks have already been merged into the DEX pool.
    finalize {
        val hookedIntegrations = mutableListOf<String>()

        // 1. Case B (Part 1): Hook Piko's ExtMediaEntities.getVideos() to expose .gif and .mp4 variants for Twitter GIFs
        PikoExtMediaGetVideosFingerprint.methodOrNull?.apply {
            val returnInstruction = instructions.last { it.opcode == Opcode.RETURN_OBJECT }
            val returnIndex = returnInstruction.location.index
            val returnReg = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            addInstructions(
                returnIndex,
                """
                    invoke-static {v$returnReg}, $GIF_HOOKS_DESCRIPTOR->onGetVideosReturn(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                    move-result-object v$returnReg
                """.trimIndent(),
            )
            hookedIntegrations.add("Piko GIF/MP4 variants")
        }

        // 2. Case B (Part 2): Hook Piko's NativeDownloader.buildDownloadItems() to label GIF items as "GIF" and clean filenames
        PikoBuildDownloadItemsFingerprint.methodOrNull?.apply {
            val returnInstruction = instructions.last { it.opcode == Opcode.RETURN_OBJECT }
            val returnIndex = returnInstruction.location.index
            val returnReg = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            addInstructions(
                returnIndex,
                """
                    invoke-static {v$returnReg}, $GIF_HOOKS_DESCRIPTOR->onBuildDownloadItemsReturn(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                    move-result-object v$returnReg
                """.trimIndent(),
            )
            hookedIntegrations.add("Piko Download Dialog")
        }

        // 3. Case A: Hook Piko's Utils.downloadFile(url, mediaName, ext) to natively convert and save .gif files
        PikoUtilsDownloadFileFingerprint.methodOrNull?.apply {
            val firstInstruction = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p2}, $GIF_HOOKS_DESCRIPTOR->interceptPikoDownloadFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :piko_gif_continue
                    return-void
                """.trimIndent(),
                ExternalLabel("piko_gif_continue", firstInstruction),
            )
            hookedIntegrations.add("Piko Native Downloader")
        }

        // 4. Case C (Part 1): Hook Piko's DownloadPatch.downloadVideoMedia(obj1, para1) for X's 3-dots media sheet
        PikoDownloadVideoMediaFingerprint.methodOrNull?.apply {
            val firstInstruction = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p1}, $GIF_HOOKS_DESCRIPTOR->interceptNativeXDownload(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :piko_gif_native_piko_continue
                    return-void
                """.trimIndent(),
                ExternalLabel("piko_gif_native_piko_continue", firstInstruction),
            )
            hookedIntegrations.add("Menu 3-dots (Piko)")
        }

        // 5. Case C (Part 2): Hook X's native downloader method directly if Piko's copyMediaLink patch was not applied
        TwitterDownloadCallFingerprint.methodOrNull?.apply {
            val alreadyHandledByPiko = instructions.any { ins ->
                (ins as? ReferenceInstruction)?.reference?.toString()?.contains("DownloadPatch;->mediaHandle") == true
            }
            if (!alreadyHandledByPiko) {
                val firstIfEqz = instructions.firstOrNull { it.opcode == Opcode.IF_EQZ }
                if (firstIfEqz != null) {
                    val targetIndex = firstIfEqz.location.index + 1
                    val nextInstruction = getInstruction(targetIndex)
                    addInstructionsWithLabels(
                        targetIndex,
                        """
                            invoke-static/range {p0 .. p1}, $GIF_HOOKS_DESCRIPTOR->interceptNativeXDownload(Ljava/lang/Object;Ljava/lang/Object;)Z
                            move-result v0
                            if-eqz v0, :piko_gif_native_x_continue
                            return-void
                        """.trimIndent(),
                        ExternalLabel("piko_gif_native_x_continue", nextInstruction),
                    )
                    hookedIntegrations.add("Menu 3-dots (Native X)")
                }
            }
        }

        // 6. Case C (Part 3): Ensure X's media options sheet unlocks GIF (type 0x2) downloads even if Piko's Download patch was not enabled
        TwitterMediaOptionSheetFingerprint.methodOrNull?.apply {
            val alreadyHasGifCheck = instructions.any { ins ->
                ins.opcode == Opcode.CONST_4 && (ins as? Instruction11n)?.narrowLiteral == 2
            }
            if (!alreadyHasGifCheck) {
                val firstIfEq = instructions.firstOrNull { it.opcode == Opcode.IF_EQ }
                val newInstanceTarget = instructions.firstOrNull { it.opcode == Opcode.NEW_INSTANCE }
                if (firstIfEq != null && newInstanceTarget != null) {
                    val firstIfLoc = firstIfEq.location.index
                    val reg = getInstruction<TwoRegisterInstruction>(firstIfLoc)
                    val r1 = reg.registerA
                    val r2 = reg.registerB

                    addInstructionsWithLabels(
                        firstIfLoc + 1,
                        """
                            const/4 v$r2, 0x2
                            if-eq v$r1, v$r2, :cond_gif_allow
                        """.trimIndent(),
                        ExternalLabel("cond_gif_allow", newInstanceTarget),
                    )

                    instructions.firstOrNull { it.opcode == Opcode.IGET_BOOLEAN }?.location?.index?.let { idx ->
                        removeInstruction(idx)
                        removeInstruction(idx)
                    }
                }
            }
        }

        // 7. Hook Piko's Patch Information screen (SettingsAboutFragment) to display the add-on
        PikoSettingsAboutOnCreateFingerprint.methodOrNull?.apply {
            val setPrefCall = instructions.firstOrNull { ins ->
                ins.opcode == Opcode.INVOKE_VIRTUAL &&
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("setPreferenceScreen") == true
            }
            if (setPrefCall != null) {
                val callIdx = setPrefCall.location.index
                val fiveReg = getInstruction<FiveRegisterInstruction>(callIdx)
                val thisReg = fiveReg.registerC
                val screenReg = fiveReg.registerD
                addInstructions(
                    callIdx,
                    """
                        invoke-static {v$thisReg, v$screenReg}, $PATCH_INFO_HOOK_DESCRIPTOR->onPatchInfoScreenCreated(Ljava/lang/Object;Landroid/preference/PreferenceScreen;)V
                    """.trimIndent(),
                )
            }
        }

        // 8. Inject version & hooked integrations into GifPatchHooks placeholder methods
        val integrationsText = if (hookedIntegrations.isEmpty()) {
            "Standalone mode"
        } else {
            hookedIntegrations.joinToString(" • ")
        }

        GifHooksPatchVersionFingerprint.methodOrNull?.apply {
            val constString = instructions.firstOrNull { it.opcode == Opcode.CONST_STRING }
            if (constString != null) {
                val reg = getInstruction<OneRegisterInstruction>(constString.location.index).registerA
                replaceInstruction(constString.location.index, "const-string v$reg, \"$PATCH_VERSION\"")
            }
        }

        GifHooksIntegrationsFingerprint.methodOrNull?.apply {
            val constString = instructions.firstOrNull { it.opcode == Opcode.CONST_STRING }
            if (constString != null) {
                val reg = getInstruction<OneRegisterInstruction>(constString.location.index).registerA
                replaceInstruction(constString.location.index, "const-string v$reg, \"$integrationsText\"")
            }
        }
    }
}
