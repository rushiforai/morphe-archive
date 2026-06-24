/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/facebook/ads/mainfeed/HideSponsoredStoriesPatch.kt
 */
package app.morphe.patches.facebook.ads.mainfeed

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

@Suppress("unused")
val hideSponsoredStoriesPatch = bytecodePatch("Hide 'Sponsored Stories'") {
    compatibleWith(AppCompatibilities.FACEBOOK_490)

    execute {
        val sponsoredDataModelTemplateMethod = GetSponsoredDataModelTemplateMethodFingerprint.method
        val baseModelMapperMethod = BaseModelMapperMethodFingerprint.method
        val baseModelWithTreeType = "Lcom/facebook/graphql/modelutil/BaseModelWithTree;"
        val graphQlStoryClassDescriptor = "Lcom/facebook/graphql/model/GraphQLStory;"

        val getStoryVisibilityMethodMatch = GetStoryVisibilityMethodMatchFingerprint

        val getSponsoredDataHelperMethod = ImmutableMethod(
            getStoryVisibilityMethodMatch.classDef.type,
            "getSponsoredData",
            listOf(ImmutableMethodParameter(graphQlStoryClassDescriptor, null, null)),
            baseModelWithTreeType,
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable().apply {
            val constInstructions = sponsoredDataModelTemplateMethod.implementation!!
                .instructions
                .asSequence()
                .filterIsInstance<Instruction31i>()
                .take(2)
                .toList()

            val storyTypeId = constInstructions[0].narrowLiteral
            val sponsoredDataTypeId = constInstructions[1].narrowLiteral

            addInstructions(
                """
                const-class v2, $baseModelWithTreeType
                const v1, $storyTypeId
                const v0, $sponsoredDataTypeId
                invoke-virtual {p0, v2, v1, v0}, ${baseModelMapperMethod.definingClass}->${baseModelMapperMethod.name}(Ljava/lang/Class;II)$baseModelWithTreeType
                move-result-object v0
                check-cast v0, $baseModelWithTreeType
                return-object v0
                """.trimIndent(),
            )
        }

        getStoryVisibilityMethodMatch.classDef.methods.add(getSponsoredDataHelperMethod)

        val insertionIndex = getStoryVisibilityMethodMatch.instructionMatches.first().index
        getStoryVisibilityMethodMatch.method.addInstructionsWithLabels(
            insertionIndex,
            """
            instance-of v0, p0, $graphQlStoryClassDescriptor
            if-eqz v0, :resume_normal
            invoke-static {p0}, ${getSponsoredDataHelperMethod.definingClass}->${getSponsoredDataHelperMethod.name}(Lcom/facebook/graphql/model/GraphQLStory;)Lcom/facebook/graphql/modelutil/BaseModelWithTree;
            move-result-object v0
            if-eqz v0, :resume_normal
            const-string v0, "GONE"
            return-object v0
            :resume_normal
            nop
            """.trimIndent(),
        )
    }
}

