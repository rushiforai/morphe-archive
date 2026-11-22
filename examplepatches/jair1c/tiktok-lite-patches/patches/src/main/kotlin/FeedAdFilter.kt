package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val feedList = "Lcom/ss/android/ugc/aweme/minilite/feed/data/bean/FeedItemList;"

private object FeedAdapter : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/gsonopt/OptJsonAdapterFor\$com\$ss\$android\$ugc\$aweme\$minilite\$feed\$data\$bean\$FeedItemList;",
    returnType = "Z",
    strings = listOf("aweme_list"),
)

@Suppress("unused")
val feedAdFilter = bytecodePatch(
    name = "Hide feed ads",
    description = "Filters sponsored entries flagged by the MiniLite feed model.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "TikTok Lite",
        packageName = "com.zhiliaoapp.musically.go",
        targets = listOf(AppTarget(version = "47.8.15", minSdk = 21)),
    ))
    extendWith("extensions/extension.mpe")
    execute {
        val target = FeedAdapter.method
        val (index, instruction) = target.instructions.withIndex().single { (_, candidate) ->
            val field = (candidate as? ReferenceInstruction)?.reference as? FieldReference
            candidate.opcode == Opcode.IPUT_OBJECT && field?.definingClass == feedList &&
                field.name == "items" && field.type == "Ljava/util/List;"
        }
        val register = (instruction as TwoRegisterInstruction).registerA
        target.addInstructions(index, """
            invoke-static/range {v${register} .. v${register}}, Lapp/tiktoklitepatches/extension/FeedFilter;->removeAds(Ljava/util/List;)Ljava/util/List;
            move-result-object v${register}
        """)
    }
}
