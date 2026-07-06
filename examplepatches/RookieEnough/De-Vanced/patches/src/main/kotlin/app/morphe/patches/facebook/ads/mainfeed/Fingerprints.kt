/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/facebook/ads/mainfeed/Fingerprints.kt
 */
package app.morphe.patches.facebook.ads.mainfeed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object BaseModelMapperMethodFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/facebook/graphql/modelutil/BaseModelWithTree;",
    parameters = listOf("L", "I", "I"),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.SGET_OBJECT,
        Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.CONST_4,
        Opcode.IF_EQ,
    ),
)

internal object GetSponsoredDataModelTemplateMethodFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/graphql/model/GraphQLFBMultiAdsFeedUnit;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.CONST,
        Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.RETURN_OBJECT,
    ),
)

internal object GetStoryVisibilityMethodMatchFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.INSTANCE_OF,
        Opcode.IF_NEZ,
        Opcode.CONST,
    ),
    custom = { method, _ ->
        val impl = method.implementation
        if (impl == null) {
            false
        } else {
            val instructions = impl.instructions
            val instanceOfCount = instructions.count { it.opcode == Opcode.INSTANCE_OF }
            val ifNezCount = instructions.count { it.opcode == Opcode.IF_NEZ }
            val constCount =
                instructions.count { it.opcode == Opcode.CONST || it.opcode == Opcode.CONST_STRING }
            instanceOfCount >= 3 && ifNezCount >= 3 && constCount >= 1
        }
    },
)

