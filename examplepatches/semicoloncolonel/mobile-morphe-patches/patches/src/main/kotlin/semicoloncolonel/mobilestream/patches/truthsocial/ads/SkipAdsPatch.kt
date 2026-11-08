package semicoloncolonel.mobilestream.patches.truthsocial.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.turnOffTruthFeatures

// Truth Social 1.28.3. The server's timeline response names the positions
// where ads go. The app's AdQueueManager then fetches ads from
// /api/v6/truth/ads (sponsored Truths, house ads, and Google ads) and
// inserts them at those positions. The patch returns from the method that
// schedules the insertion, so the feed never has an ad slot to fill. It
// also turns off the server's switches for Google ads, the top banner ad,
// and the ad on a post's detail page.
//
// Boosted posts are paid promotions that the server places in the feeds,
// with a "Boosted" label. Every list of posts the app reads goes through
// one JSON adapter, which adds each post to an ArrayList. BoostFilter
// takes the place of that add, and drops posts that have a boost_id. The
// obfuscated name of the boost_id field is read from the post's JSON
// adapter, where it is written right after the "boost_id" name.
private const val BOOST_FILTER = "Lsemicoloncolonel/mobilestream/extension/truthsocial/BoostFilter;"
private const val TRUTH_STATUS = "Lcom/truthsocial/core/data/models/TruthStatus;"

internal object StatusListFromJsonFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    custom = { _, classDef -> classDef.type.endsWith("TruthStatusListAdapterFactory\$1\$a;") },
)

internal object BoostFieldFingerprint : Fingerprint(
    definingClass = BOOST_FILTER,
    name = "boostField",
    returnType = "Ljava/lang/String;",
)

internal object StatusToJsonFingerprint : Fingerprint(
    strings = listOf("boost_id"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/truthsocial/core/data/models/TruthStatusJsonAdapter;" && method.name != "<init>"
    },
)
internal object ScheduleAdInsertionFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;", "Ljava/lang/String;", "I", "I"),
    strings = listOf("timelineId"),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the sponsored and boosted posts and the other ads from the feeds.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        ScheduleAdInsertionFingerprint.method.addInstructions(0, "return-void")
        turnOffTruthFeatures("google_ads_enabled", "top_banner_ad_enabled", "detail_ad_enabled")

        // The boost_id field: the first post field read after "boost_id".
        val toJson = StatusToJsonFingerprint.method.implementation!!.instructions.toList()
        val nameIndex = toJson.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == "boost_id"
        }
        val boostField = toJson.drop(nameIndex).firstNotNullOfOrNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { field -> field.definingClass == TRUTH_STATUS && field.type == "Ljava/lang/String;" }
        } ?: throw PatchException("boost_id field not found")
        BoostFieldFingerprint.method.addInstructions(0, "const-string v0, \"${boostField.name}\"\nreturn-object v0")

        StatusListFromJsonFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val addIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { method ->
                        method.definingClass == "Ljava/util/ArrayList;" && method.name == "add"
                    }
            }
            if (addIndex < 0) throw PatchException("Post list add not found")
            val add = instructions[addIndex] as FiveRegisterInstruction
            replaceInstruction(
                addIndex,
                "invoke-static { v${add.registerC}, v${add.registerD} }, " +
                    "$BOOST_FILTER->add(Ljava/util/ArrayList;Ljava/lang/Object;)Z",
            )
        }
    }
}
