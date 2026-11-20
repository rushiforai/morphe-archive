/*
 * Meta Patches — Change channel name.
 *
 * Ported from InstaFL patcher-core "Change Visible Channel Name"
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded and reworked for the Morphe patcher.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.hemk651.patches.shared.MetaCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val DEFAULT_CHANNEL_NAME = "Mods"

@Suppress("unused")
val changeChannelNamePatch = patch(
    name = "Change channel name",
    description = "Replaces the release channel name (NONE, ALPHA, BETA, PROD) shown in the developer options UI.",
    default = false
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    val channelName by stringOption(
        key = "channelName",
        default = DEFAULT_CHANNEL_NAME,
        title = "Channel name",
        description = "The name shown in place of the release channel."
    )

    execute {
        // The four channel names are built in the <clinit> of the release channel
        // enum. Every occurrence is replaced, so each channel is displayed with
        // the patched name.
        //
        // Original InstaFL patch replaces the constants with "Instafel v<n>".
        val name = channelName?.takeIf { it.isNotBlank() } ?: DEFAULT_CHANNEL_NAME

        ChannelNameFingerprint.let {
            val stringMatches = it.stringMatches
                ?: throw PatchException("Channel name strings did not match")

            for (stringMatch in stringMatches) {
                val register = it.method
                    .getInstruction<OneRegisterInstruction>(stringMatch.index)
                    .registerA

                it.method.replaceInstruction(
                    stringMatch.index,
                    "const-string v$register, \"$name\""
                )
            }
        }
    }
}
