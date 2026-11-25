package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val feedList = "Lcom/ss/android/ugc/aweme/minilite/feed/data/bean/FeedItemList;"

private object FeedAdapter : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/gsonopt/OptJsonAdapterFor\$com\$ss\$android\$ugc\$aweme\$minilite\$feed\$data\$bean\$FeedItemList;",
    returnType = "Z",
    strings = listOf("aweme_list"),
)

internal const val fullFeedList = "Lcom/ss/android/ugc/aweme/main/homepage/fragment/data/model/FeedItemList;"

private object FullFeedAdapter : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/gsonopt/OptJsonAdapterFor\$com\$ss\$android\$ugc\$aweme\$main\$homepage\$fragment\$data\$model\$FeedItemList;",
    returnType = "Z",
    strings = listOf("aweme_list", "appendCache"),
)

internal fun filterFeedAccessor(owner: String, accessor: String) {
    val method = Fingerprint(
        definingClass = owner,
        name = accessor,
        parameters = emptyList(),
        returnType = "Ljava/util/List;",
    ).method
    val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    check(returns.isNotEmpty())
    for ((index, instruction) in returns.asReversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        method.addInstructionsAtControlFlowLabel(index, """
            invoke-static/range {v${register} .. v${register}}, Lapp/tiktoklitepatches/extension/FeedFilter;->filterFeed(Ljava/util/List;)Ljava/util/List;
            move-result-object v${register}
        """)
    }
}


@Suppress("unused")
val feedAdFilter = bytecodePatch(
    name = "Hide feed ads",
    description = "Filters sponsored entries flagged by the MiniLite feed model.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(modSettingsSupport)
    execute {
        enableModSetting("feedFilterAvailable")
        filterFeedAccessor(feedList, "getItems")
        filterFeedAccessor(feedList, "getAwemeList")
        if (packageMetadata.versionName == "47.8.2") {
            // The full model delegates getAwemeList to getItems.
            filterFeedAccessor(fullFeedList, "getItems")
        } else {
            for ((target, listType) in listOf(FeedAdapter.method to feedList, FullFeedAdapter.method to fullFeedList)) {
                val (index, instruction) = target.instructions.withIndex().single { (_, candidate) ->
                    val field = (candidate as? ReferenceInstruction)?.reference as? FieldReference
                    candidate.opcode == Opcode.IPUT_OBJECT && field?.definingClass == listType &&
                        field.name == "items" && field.type == "Ljava/util/List;"
                }
                val register = (instruction as TwoRegisterInstruction).registerA
                target.addInstructions(index, """
                    invoke-static/range {v${register} .. v${register}}, Lapp/tiktoklitepatches/extension/FeedFilter;->filterFeed(Ljava/util/List;)Ljava/util/List;
                    move-result-object v${register}
                """)
            }
        }
    }
}
