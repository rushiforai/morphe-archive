package app.subenoeva.patches.roadsync.music

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption
import app.subenoeva.patches.shared.Constants.COMPATIBILITY_ROADSYNC
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Apps added to the media browser whitelist by default.
 *
 * Both declare an `android.media.browse.MediaBrowserService` and an
 * `android.intent.action.MEDIA_BUTTON` receiver, so RoadSync already discovers them as generic
 * music apps; whitelisting is what adds library browsing on top of transport control.
 */
private val DEFAULT_PACKAGES = listOf(
    // TIDAL. MediaBrowserService: com.aspiro.wamp.player.MusicService
    "com.aspiro.tidal",
    // YouTube Music patched with Morphe.
    // MediaBrowserService: com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService
    "app.morphe.android.apps.youtube.music",
)

/**
 * Registers with `java.util.LinkedHashSet` so iteration order stays deterministic, matching the
 * `LinkedHashSet` that Kotlin's `setOf(vararg)` returns for the original set.
 */
private const val SET_TYPE = "Ljava/util/LinkedHashSet;"

/**
 * Highest register index addressable by the 4 bit register operands of `invoke-virtual`,
 * `invoke-direct` and `move-object`.
 */
private const val MAX_REGISTER = 15

@Suppress("unused")
val addMusicSourcesPatch = bytecodePatch(
    name = "Add music sources",
    description = "Adds music apps to the list of sources RoadSync can browse and control from " +
        "the handlebar. Apps must expose a media browser service to be browsable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ROADSYNC)

    val extraPackages by stringsOption(
        key = "extraMusicPackages",
        default = DEFAULT_PACKAGES,
        title = "Music app packages",
        description = "Package names of the music apps to add. An app is only browsable if it " +
            "declares an android.media.browse.MediaBrowserService; apps without one keep working " +
            "as plain transport control targets and do not need to be listed here.",
        required = true,
    )

    execute {
        val packages = extraPackages
            .orEmpty()
            .map(String::trim)
            .filter(String::isNotEmpty)
            .distinct()

        if (packages.isEmpty()) {
            throw PatchException("No music app packages configured.")
        }

        MediaBrowserWhitelistFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex < 0) {
                throw PatchException("Could not find the return instruction of the whitelist method.")
            }

            val returnRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            // The whitelist is the last value computed by the method, so every register other than
            // the one holding it is dead at this point and free to reuse.
            val (setRegister, packageRegister) = (0..MAX_REGISTER)
                .filter { it != returnRegister && it < implementation!!.registerCount }
                .take(2)
                .also {
                    if (it.size < 2 || returnRegister > MAX_REGISTER) {
                        throw PatchException(
                            "Not enough low registers available in the whitelist method.",
                        )
                    }
                }

            // Copy the original set instead of mutating it: the return type is the read-only
            // kotlin.collections.Set interface and its runtime implementation is not guaranteed
            // to be mutable.
            val addPackages = packages.joinToString("\n") { packageName ->
                """
                    const-string v$packageRegister, "$packageName"
                    invoke-virtual { v$setRegister, v$packageRegister }, $SET_TYPE->add(Ljava/lang/Object;)Z
                """
            }

            addInstructions(
                returnIndex,
                """
                    new-instance v$setRegister, $SET_TYPE
                    invoke-direct { v$setRegister, v$returnRegister }, $SET_TYPE-><init>(Ljava/util/Collection;)V
                    $addPackages
                    move-object v$returnRegister, v$setRegister
                """,
            )
        }
    }
}
