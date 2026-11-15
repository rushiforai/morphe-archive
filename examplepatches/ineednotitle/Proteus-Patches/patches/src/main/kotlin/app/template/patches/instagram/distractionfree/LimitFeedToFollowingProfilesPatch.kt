/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstructionOrThrow
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramLimitFeedToFollowedProfiles;"

private object MainFeedRequestClassFingerprint : Fingerprint(
    strings = listOf("Request{mReason=", ", mInstanceNumber="),
)

private object InitMainFeedRequestFingerprint : Fingerprint(
    name = "<init>",
    classFingerprint = MainFeedRequestClassFingerprint,
)

private object MainFeedHeaderMapFinderFingerprint : Fingerprint(
    strings = listOf("pagination_source", "FEED_REQUEST_SENT"),
)

@Suppress("unused")
val instagramLimitFeedToFollowingProfilesPatch = bytecodePatch(
    name = "Limit feed to following profiles",
    description = "Filters the home feed to display only chronological content from profiles you follow.",
    default = true,
) {
    dependsOn(
        // p92_android_ranked_following_feed:is_enabled. Turning this off keeps
        // the timeline in the classic following mode instead of the ranked
        // following variant.
        overrideInstagramMobileConfigBooleanFlag(override = "108494::0" to false),
    )

    compatibleWith(INSTAGRAM_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val requestClassType = MainFeedRequestClassFingerprint.classDef.type
        val mainFeedRequestHeaderFieldName: String

        with(MainFeedHeaderMapFinderFingerprint.method) {
            mainFeedRequestHeaderFieldName = indexOfFirstInstructionOrThrow {
                getReference<FieldReference>().let { ref ->
                    ref?.type == "Ljava/util/Map;" && ref.definingClass == requestClassType
                }
            }.let { instructionIndex ->
                getInstruction(instructionIndex).getReference<FieldReference>()!!.name
            }
        }

        InitMainFeedRequestFingerprint.method.apply {
            val getHeaderIndex = indexOfFirstInstructionOrThrow {
                getReference<FieldReference>()?.name == mainFeedRequestHeaderFieldName
            }

            val paramHeaderRegister = getInstruction<TwoRegisterInstruction>(getHeaderIndex).registerA

            // Replace pagination_source="feed_recs" with "following" in the feed/timeline request.
            addInstructions(
                getHeaderIndex,
                """
                    invoke-static/range { v$paramHeaderRegister .. v$paramHeaderRegister }, $EXTENSION_CLASS_DESCRIPTOR->setFollowingHeader(Ljava/util/Map;)Ljava/util/Map;
                    move-result-object v$paramHeaderRegister
                """.trimIndent(),
            )
        }
    }
}
