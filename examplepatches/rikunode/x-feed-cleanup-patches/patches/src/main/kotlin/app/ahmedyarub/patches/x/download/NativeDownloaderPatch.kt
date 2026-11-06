package app.ahmedyarub.patches.x.download

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.featureFlagsPatch
import app.ahmedyarub.patches.x.shared.forceFeatureFlag
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private class MediaToStringFingerprint(prefix: String) : Fingerprint(
    name = "toString",
    strings = listOf(prefix),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/x/models/") },
)

/**
 * The app can already save photos, videos and GIFs, at the best quality it has, from the media's
 * long-press menu and the media viewer. It only offers to when the server marks the media
 * downloadable, which for most videos it does not. The save itself checks nothing further.
 */
@Suppress("unused")
val nativeDownloaderPatch = bytecodePatch(
    name = "Native downloader",
    description = "Lets every photo, video and GIF be saved from its long-press menu and the media viewer, " +
        "without a watermark.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(featureFlagsPatch)

    execute {
        // Saved videos are otherwise first copied into a watermarked version.
        forceFeatureFlag("subscriptions_watermarked_video_download_enabled", false)

        // The isDownloadable field of each media class: the one toString reads right after
        // naming it.
        val downloadable = listOf("MediaContentImage(mediaId=", "MediaContentVideo(mediaId=", "MediaContentGif(mediaId=")
            .map { prefix ->
                val instructions = MediaToStringFingerprint(prefix).method.instructions
                val label = instructions.indexOfFirst { it.getReference<StringReference>()?.string == ", isDownloadable=" }
                instructions.drop(label).firstNotNullOfOrNull { instruction ->
                    instruction.getReference<FieldReference>()?.takeIf { instruction.opcode == Opcode.IGET_BOOLEAN }
                } ?: throw PatchException("$prefix does not print isDownloadable")
            }
            .toSet()

        // Every place outside the models that reads it: the long-press menu and the media viewer.
        var patched = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/x/models/")) return@classDefForEach

            classDef.methods.forEach { method ->
                val reads = method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.IGET_BOOLEAN && instruction.getReference<FieldReference>() in downloadable
                } ?: false
                if (!reads) return@forEach

                mutableClassDefBy(classDef).methods.first {
                    it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
                }.apply {
                    instructions
                        .filter { it.opcode == Opcode.IGET_BOOLEAN && it.getReference<FieldReference>() in downloadable }
                        .forEach { read ->
                            val register = (read as TwoRegisterInstruction).registerA
                            replaceInstruction(read.location.index, "const/16 v$register, 0x1")
                            patched++
                        }
                }
            }
        }

        if (patched == 0) throw PatchException("Nothing reads whether media is downloadable")

        // The video player asks the media itself, through the getter videos and GIFs share, both
        // before offering Download Video and again before downloading.
        var getters = 0
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lcom/x/models/")) return@classDefForEach

            classDef.methods.filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.let { instructions ->
                        instructions.count() == 2 && instructions.first().opcode == Opcode.IGET_BOOLEAN &&
                            instructions.first().getReference<FieldReference>() in downloadable
                    } == true
            }.forEach { getter ->
                mutableClassDefBy(classDef).methods.first { it.name == getter.name && it.parameterTypes.isEmpty() }
                    .returnEarly(true)
                getters++
            }
        }
        if (getters == 0) throw PatchException("The media has no downloadable getter")

        // The video player's own Download Video option asks for a Premium subscription first,
        // and shows an upsell without one. The check is skipped there alone: it is the app's
        // general Premium check, which gates much else.
        var premiumChecks = 0
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val logsDownload = method.implementation?.instructions?.any {
                    it.getReference<StringReference>()?.string == "download_video"
                } ?: false
                if (!logsDownload) return@forEach

                mutableClassDefBy(classDef).methods.first {
                    it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
                }.apply {
                    val logged = instructions.first { it.getReference<StringReference>()?.string == "download_video" }.location.index
                    val check = instructions.firstOrNull { instruction ->
                        instruction.location.index > logged && instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                            instruction.getReference<MethodReference>()?.let { reference ->
                                reference.definingClass.startsWith("Lcom/x/subscriptions/") &&
                                    reference.returnType == "Z" && reference.parameterTypes.isEmpty()
                            } == true
                    } ?: throw PatchException("${classDef.type}->${method.name} downloads without a subscription check")

                    val result = instructions[check.location.index + 1]
                    if (result.opcode != Opcode.MOVE_RESULT) throw PatchException("The subscription check's result is not kept")
                    replaceInstruction(result.location.index, "const/16 v${(result as OneRegisterInstruction).registerA}, 0x1")
                    premiumChecks++
                }
            }
        }

        if (premiumChecks == 0) throw PatchException("The video player has no Download Video option")
    }
}
