/*
 * Meta Patches — AMOLED theme.
 *
 * Ported from InstaFL patcher-core "AMOLED Theme"
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * reworked for the Morphe patcher.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.listDecodableFiles
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.hasResourceId
import app.hemk651.patches.shared.MetaCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Night mode surface colors that are forced to pure black.
 * InstaFL points them at `@color/bds_black`, which is Instagram's own black.
 */
private val AMOLED_NIGHT_COLORS = listOf(
    "igds_secondary_background",
    "igds_elevated_background",
    "igds_elevated_highlight_background"
)

/** Fallback color used when `bds_black` cannot be resolved in the resource table. */
private const val FALLBACK_BLACK = "#FF000000"

private const val AMOLED_PRISM_BLACK = "igds_prism_black"

@Suppress("unused")
val amoledThemePatch = patch(
    name = "AMOLED theme",
    description = "Forces Instagram dark theme surfaces to pure black (AMOLED).",
    default = true
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    execute {
        // The bds_black reference InstaFL writes only resolves if the resource
        // exists in the resource table, otherwise fall back to a literal black.
        val black = if (hasResourceId(ResourceType.COLOR, "bds_black")) {
            "@color/bds_black"
        } else {
            FALLBACK_BLACK
        }

        // Patch every night mode colors values file, typically only
        // res/values-night/colors.xml.
        val nightColorsFiles = listDecodableFiles("res/values-night*/colors.xml")
        for (path in nightColorsFiles) {
            resourceXml(path).use { colors ->
                for (name in AMOLED_NIGHT_COLORS) {
                    colors.root.children("color")
                        .firstOrNull { it.attribute("name") == name }
                        ?.let { colorElement ->
                            colorElement.text = black
                        }
                }
            }
        }

        // Override the prism black color of the default values.
        resourceXml("res/values/colors.xml").use { colors ->
            colors.root.children("color")
                .firstOrNull { it.attribute("name") == AMOLED_PRISM_BLACK }
                ?.let { colorElement ->
                    colorElement.text = FALLBACK_BLACK
                }
        }

        // Patch the darkest Compose prism surface color (GRAY_1600) to opaque
        // black. The ARGB literal is shifted left by 32 bits before being stored
        // as a Compose ColorULong, so the shift of the original code is kept.
        //
        // Original InstaFL patch replaces the const-wide literal with
        // "const-wide vX, 0xff000000L".
        PrismGray1600Fingerprint.let {
            val constWideMatch = it.instructionMatches.last()
            val register = constWideMatch
                .getInstruction<OneRegisterInstruction>()
                .registerA

            it.method.replaceInstruction(
                constWideMatch.index,
                "const-wide v$register, 0xff000000L"
            )
        }
    }
}
