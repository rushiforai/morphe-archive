package app.ayham.patches.music.features

import app.ayham.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

private const val OFFLINE_SAVE = "Lapp/ayham/extension/music/features/OfflineSave;"
private const val DOWNLOAD_CHOICE = "Lapp/ayham/extension/music/features/DownloadChoice;"
private const val OFFLINE_INDEX = "Lapp/ayham/extension/music/features/OfflineIndex;"
private const val MORPHE_IN_APP_DOWNLOADS = "Lapp/morphe/extension/shared/patches/BaseInAppDownloadsPatch;"
private const val MORPHE_DOWNLOADS = "Lapp/morphe/extension/music/patches/DownloadsPatch;"
private const val MORPHE_SPONSORBLOCK = "Lapp/morphe/extension/music/sponsorblock/MusicSponsorBlockConfig;"

/** YT's command resolver (Morphe's ResolveCommandFingerprint): resolves a command with its first mapping. */
internal object ResolveCommandFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Map;"),
    filters = listOf(
        anyInstruction(
            string("Unknown command not resolved"),
            string("Unknown command not resolved %s"),
        )
    )
)

/**
 * Morphe's "Downloads" patch saves songs into YT Music's own Downloads. This adds our download popup
 * in front of it (Lossless from the addons or YouTube, the quality, and the lyrics, animated art and
 * canvas switches), saves those along with each song for offline play, and deletes them with the song.
 */
@Suppress("unused")
val offlineExtrasPatch = patch(
    name = "Offline lyrics and art",
    description = "Asks how to download (lossless from your addons or YouTube's) and saves lyrics, animated art and canvas with each downloaded song for offline play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    extendWith("extensions/extension.mpe")

    val log = Logger.getLogger("OfflineExtras")

    // finalize, not execute: every hook here needs Morphe's extension classes or its resolver rewrite,
    // which exist only once Morphe's patches have executed (order between bundles is not known)
    finalize {
        mutableClassDefByOrNull(MORPHE_IN_APP_DOWNLOADS)?.methods?.firstOrNull {
            // (Object) up to Morphe 2.3.0, (Object, boolean saveStoryboards) from 2.4.0: p0 is the response in both
            it.name == "replaceDeclinedOfflinePlayerResponse" &&
                it.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/Object;"
        }?.let { method ->
            method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $OFFLINE_SAVE->onOfflinePlayerResponse(Ljava/lang/Object;)V")
            log.info("OfflineExtras: hooked Morphe replaceDeclinedOfflinePlayerResponse")
        } ?: log.warning("OfflineExtras: Morphe's Downloads patch is not applied, offline lyrics and art are off")

        // The popup: in the resolver, right after Morphe's rewrite (its block ends at a nop, where the
        // command is the save command Morphe made, or the app's own). Our hook returns true to wait.
        // OrNull: a resolver that no longer matches skips the popup instead of failing the build. v0 is
        // free after the nop (Morphe's block used v0-v2 too), but only when it is not one of p0-p2.
        ResolveCommandFingerprint.methodOrNull?.takeIf { (it.implementation?.registerCount ?: 0) > 3 }?.apply {
            val call = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { r ->
                        r.definingClass == MORPHE_DOWNLOADS && r.name == "replaceDownloadCommand"
                    }
            }
            val nop = if (call < 0) -1 else (call until instructions.size).firstOrNull { instructions[it].opcode == Opcode.NOP } ?: -1
            if (nop < 0) {
                log.warning("OfflineExtras: Morphe's download rewrite not found in the resolver, no download popup")
            } else {
                addInstructionsWithLabels(
                    nop + 1,
                    """
                        invoke-static/range { p0 .. p2 }, $DOWNLOAD_CHOICE->onCommand(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Map;)Z
                        move-result v0
                        if-eqz v0, :ayham_resolve
                        return-void
                        :ayham_resolve
                        nop
                    """
                )
                log.info("OfflineExtras: download popup hooked in the resolver")
            }
        } ?: log.warning("OfflineExtras: the command resolver was not found, no download popup")

        // A song removed from YT's downloads (Morphe's SponsorBlock hook of the removal): its things go too.
        mutableClassDefByOrNull(MORPHE_SPONSORBLOCK)?.methods?.firstOrNull {
            it.name == "offlineVideoRemoved" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
        }?.let { method ->
            method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $OFFLINE_INDEX->removed(Ljava/lang/String;)V")
            log.info("OfflineExtras: hooked Morphe offlineVideoRemoved")
        } ?: log.warning("OfflineExtras: Morphe's offlineVideoRemoved not found; deletes are found at start only")
    }
}
