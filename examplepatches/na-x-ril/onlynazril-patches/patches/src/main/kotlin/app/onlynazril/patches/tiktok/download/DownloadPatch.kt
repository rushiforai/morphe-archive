package app.onlynazril.patches.tiktok.download

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.implementationOrPatchException
import app.morphe.util.numberOfParameterRegisters
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val DOWNLOAD_BRIDGE = "Lapp/onlynazril/extension/tiktok/DownloadBridge;"
private const val URL_MODEL = "Lcom/ss/android/ugc/aweme/base/model/UrlModel;"

/**
 * Opens the app's own download, in every share sheet, and takes the watermark off it.
 *
 * The app decides both with one object: `ACLCommonShare`. Its `getCode()` carries the restriction on
 * downloading, `getShowType()` how the entry is offered, and `getTranscode()` whether the file is
 * watermarked on the way out. Answering those three is the whole patch: the app then shows its own
 * row for every kind of content and downloads the file itself, with its own progress and its own
 * filename, so nothing here has to build a UI or fetch anything.
 *
 * The three ACL answers are the ones ReVanced's TikTok download patch uses:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/downloads/DownloadsPatch.kt
 * (GPLv3, the licence this bundle carries). That approach replaced an earlier version of this patch
 * that hooked the share sheet's photo-download handler and fetched the file itself. The earlier one
 * put a row on screen but could not tell which of the app's addresses were watermarked, and cutting
 * the sheet's own work short left the panel with a third of its rows.
 *
 * The address the app hands out as its download address is redirected as well, so the file is taken
 * from the highest quality playback variant rather than from the watermarked address. That part is
 * this bundle's own.
 */
@Suppress("unused")
val tiktokDownloadPatch = bytecodePatch(
    name = "Download",
    description = "Opens the app's own download for every share sheet and saves the file without " +
        "the watermark, taking the highest quality variant. Each part has a switch in Tweaks; the " +
        "feature is off by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        AclCodeFingerprint.method.answerWith("removeRestriction", 0x0)
        AclShowTypeFingerprint.method.answerWith("openEntry", 0x2)
        AclTranscodeFingerprint.method.answerWith("removeWatermark", 0x1)
        VideoDownloadAddressFingerprint.method.cleanAddress()
    }
}

/**
 * Answers the getter with [value] while the bridge says so, and lets the app's own answer stand
 * otherwise.
 */
private fun MutableMethod.answerWith(gate: String, value: Int) {
    requireLocals(1)
    addInstructions(
        0,
        """
            invoke-static {}, $DOWNLOAD_BRIDGE->$gate()Z
            move-result v0
            if-eqz v0, :morphe_download_keep
            const/4 v0, 0x$value
            return v0
            :morphe_download_keep
        """.trimIndent(),
    )
}

/**
 * Sends the download address through the bridge, which substitutes the best playback variant. The
 * register comes from the return it feeds.
 */
private fun MutableMethod.cleanAddress() {
    val implementation = implementationOrPatchException("Download")
    val instructions = implementation.instructions.toList()
    val returns = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { it.index }
    if (returns.isEmpty()) {
        throw PatchException("Download: ${definingClass}->${name} returns no address.")
    }
    for (index in returns.reversed()) {
        val value = (instructions[index] as? OneRegisterInstruction)?.registerA
            ?: throw PatchException(
                "Download: a return in ${definingClass}->${name} names no register.",
            )
        if (value > 15) {
            throw PatchException(
                "Download: ${definingClass}->${name} returns above v15, which a call cannot name.",
            )
        }
        val call = "invoke-static {p0, v$value}, $DOWNLOAD_BRIDGE" +
            "->addressFor(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
        addInstructions(
            index,
            """
                $call
                move-result-object v$value
                check-cast v$value, $URL_MODEL
            """.trimIndent(),
        )
    }
}

private fun MutableMethod.requireLocals(count: Int) {
    val implementation = implementationOrPatchException("Download")
    if (implementation.registerCount - numberOfParameterRegisters < count) {
        throw PatchException(
            "Download: ${definingClass}->${name} has no room for $count locals.",
        )
    }
}
