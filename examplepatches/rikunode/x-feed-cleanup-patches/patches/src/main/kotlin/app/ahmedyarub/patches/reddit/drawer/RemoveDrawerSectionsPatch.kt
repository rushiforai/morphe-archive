package app.ahmedyarub.patches.reddit.drawer

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Sections of the community drawer to remove, as [HEADER_ITEM_CLASS] constant names.
 */
private val HIDDEN_SECTIONS = listOf("RESOURCES", "GAMES_ON_REDDIT")

private const val HELPER_METHOD_NAME = "patch_filterDrawerSection"

@Suppress("unused")
val removeDrawerSectionsPatch = bytecodePatch(
    name = "Remove Resources and Games on Reddit sections",
    description = "Removes the Resources and Games on Reddit sections from the community drawer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val builderMethod = CommunityDrawerSectionBuilderFingerprint.method

        // Third parameter of the builder: the section's header UI model. Obfuscated, so its
        // type is taken from the builder rather than named.
        val headerModelType = builderMethod.parameterTypes[HEADER_MODEL_PARAMETER].toString()

        // The header UI model holds exactly one HeaderItem field, which names the section.
        val headerItemField = classDefBy(headerModelType).fields.single { field ->
            field.type == HEADER_ITEM_CLASS
        }

        val builderClass = CommunityDrawerSectionBuilderFingerprint.classDef

        // Add the filter alongside the builder. The builder has no free registers, so the
        // comparison cannot be inlined there; a helper declares its own registers and is
        // reached with invoke-static/range over the builder's existing parameters.
        builderClass.methods.add(
            ImmutableMethod(
                builderClass.type,
                HELPER_METHOD_NAME,
                listOf(
                    ImmutableMethodParameter("Ljava/util/Collection;", null, null),
                    ImmutableMethodParameter(headerModelType, null, null)
                ),
                "Ljava/util/Collection;",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(4)
            ).toMutable().apply {
                val comparisons = HIDDEN_SECTIONS.joinToString("\n") { section ->
                    """
                        sget-object v1, $HEADER_ITEM_CLASS->$section:$HEADER_ITEM_CLASS
                        if-eq v0, v1, :hide
                    """.trimIndent()
                }

                addInstructionsWithLabels(
                    0,
                    """
                        if-eqz p1, :keep
                        iget-object v0, p1, $headerItemField
                        $comparisons
                        :keep
                        return-object p0
                        :hide
                        invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
                        move-result-object v0
                        return-object v0
                    """
                )
            }
        )

        // An empty collection makes the builder return before adding the divider, the header
        // or the items, so the whole section disappears.
        builderMethod.addInstructions(
            0,
            """
                invoke-static/range { p$COLLECTION_PARAMETER .. p$HEADER_MODEL_PARAMETER }, ${builderClass.type}->$HELPER_METHOD_NAME(Ljava/util/Collection;$headerModelType)Ljava/util/Collection;
                move-result-object p$COLLECTION_PARAMETER
            """
        )
    }
}

// Parameter positions in the builder: (List, Collection, header, pagination, divider, mask).
// The builder is static, so p0 is the first parameter.
private const val COLLECTION_PARAMETER = 1
private const val HEADER_MODEL_PARAMETER = 2
