/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.cloneParameters
import app.template.patches.shared.returnBoxedBooleanEarly

private val hashedFieldInteger = "enable_media_notes_production".hashCode()

private object FeedResponseMediaParserFingerprint : Fingerprint(
    filters = listOf(
        string("enable_media_notes_production"),
    ),
    returnType = "Ljava/lang/Boolean;",
    custom = { _, classDef -> classDef.type.endsWith("/LiveTreeMediaDict;") },
)

private object LiveTreeGetOptionalBooleanFingerprint : Fingerprint(
    name = "getOptionalBooleanValueByHashCode",
    definingClass = "Lcom/instagram/pando/livetree/LiveTreeJNI;",
)

@Suppress("unused")
val instagramHideReshareButtonPatch = bytecodePatch(
    name = "Hide reshare button",
    description = "Hides the reshare button from both posts and reels.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        FeedResponseMediaParserFingerprint.method.returnBoxedBooleanEarly(false)

        // Force Pando native tree lookups for enable_media_notes_production to return FALSE.
        // cloneParameters() guarantees v0 and v1 are free scratch registers and move/from16 handles any p1.
        LiveTreeGetOptionalBooleanFingerprint.method.cloneParameters().addInstructions(
            0,
            """
                const v0, $hashedFieldInteger
                move/from16 v1, p1
                if-ne v1, v0, :nopatch
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
                :nopatch
                nop
            """.trimIndent(),
        )
    }
}
