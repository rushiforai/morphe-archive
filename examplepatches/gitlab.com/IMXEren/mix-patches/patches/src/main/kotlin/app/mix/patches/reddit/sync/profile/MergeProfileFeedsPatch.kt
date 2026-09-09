/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.profile

import app.mix.patches.reddit.sync.extension.sharedExtensionPatch
import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.mix.patches.reddit.sync.shared.postsRequestConstructorFingerprint
import app.mix.patches.reddit.sync.shared.postsUrlResultIndex
import app.mix.patches.reddit.sync.shared.stringFieldOfParameter
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/mix/extension/syncforreddit/ProfileFeedMerger;"
private const val RATE_LIMIT_CLASS = "Lapp/mix/extension/syncforreddit/RateLimitThrottle;"
private const val SOURCE_BADGE_CLASS = "Lapp/mix/extension/syncforreddit/ArchiveSourceBadge;"

private val MethodReference.smaliReference
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

@Suppress("unused")
val mergeProfileFeedsPatch = bytecodePatch(
    name = "Merge profile feeds",
    description = "Merges profile submissions and comments from Arctic Shift and Reddit.",
) {
    compatibleWith(COMPATIBILITY_SYNC)
    dependsOn(sharedExtensionPatch)

    execute {
        postsRequestConstructorFingerprint.method.apply {
            val cursorField = stringFieldOfParameter(5)
            val urlResultIndex = postsUrlResultIndex()
            addInstructions(
                urlResultIndex + 1,
                """
                move-object/from16 v0, p3
                move-object/from16 v1, p6
                iget-object v1, v1, $cursorField
                move-object/from16 v2, p5
                move-object/from16 v4, p4
                invoke-static {v3, v0, v1, v2, v4}, $EXTENSION_CLASS->rewriteUrl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v3
                """,
            )
        }

        postsResponseParserFingerprint.method.apply {
            val applicationContextMethod = applicationContextFingerprint.method.smaliReference
            val basicAuthMethod = oauthBasicHeaderFingerprint.method.smaliReference
            val userAgentMethod = userAgentFingerprint.method.smaliReference
            val bodyIndex = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.let {
                    it.definingClass == "Ljava/lang/String;" && it.name == "<init>"
                            && it.parameterTypes == listOf("[B")
                } == true
            }
            addInstructions(
                bodyIndex + 1,
                """
                move-object/from16 v14, p0
                invoke-virtual {v14}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;
                move-result-object v13
                move-object/from16 v14, p1
                invoke-static {v13, v14}, $RATE_LIMIT_CLASS->observe(Ljava/lang/String;Lcom/android/volley/NetworkResponse;)V
                invoke-static {}, $applicationContextMethod
                move-result-object v11
                invoke-static {}, $basicAuthMethod
                move-result-object v15
                invoke-static {}, $userAgentMethod
                move-result-object v12
                invoke-static {v11, v13, v0, v15, v12}, $EXTENSION_CLASS->merge(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                """,
            )
        }

        postsHeadersFingerprint.method.apply {
            val headersIndex = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.let {
                    it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/Map;"
                } == true
            }
            addInstructions(
                headersIndex + 2,
                """
                move-object/from16 v1, p0
                invoke-virtual {v1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;
                move-result-object v1
                invoke-static {v1, v0}, $EXTENSION_CLASS->sanitizeHeaders(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
                move-result-object v0
                """,
            )
        }

        volleyErrorDeliveryFingerprint.method.addInstructions(
            0,
            """
            move-object/from16 v0, p0
            invoke-virtual {v0}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;
            move-result-object v0
            move-object/from16 v1, p1
            iget-object v1, v1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;
            invoke-static {v0, v1}, $RATE_LIMIT_CLASS->observe(Ljava/lang/String;Lcom/android/volley/NetworkResponse;)V
            """,
        )

        listOf(postDescriptionFingerprint, commentDescriptionFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                addInstructions(
                    implementation!!.instructions.size - 1,
                    """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p1
                    invoke-static {v0, v1}, $SOURCE_BADGE_CLASS->decorate(Landroid/widget/TextView;Ljava/lang/Object;)V
                    """,
                )
            }
        }
    }
}
