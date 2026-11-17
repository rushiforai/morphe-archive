package semicoloncolonel.mobilestream.patches.washingtonpost.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.misc.returnUnitSmali
import semicoloncolonel.mobilestream.patches.shared.privacy.enableIncognitoReading
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Incognito reading (OPT-IN, default OFF). WaPo 7.19.0.
//
// Keeps a record of which articles you read off the phone and away from the
// Post's services, while articles, sign-in, saved articles, push alerts and the
// paywall keep working. It includes Block analytics & tracking (Chartbeat,
// comScore, Permutive, Iterable, Airship events, Splunk logging, Zeus ad
// metadata and others).
//
// On the network (TrackerBlocker's Incognito reading lists):
//   rte.washingtonpost.com      the user history service: page views, scroll
//                               depth, listens, video views and push opens.
//   .../metering/apps/evaluate  the meter, which uploads every article read
//                               since its last sync, each with a timestamp,
//                               the login cookie and the device ID. The app
//                               then decides on the phone: subscribers read
//                               as usual, and other readers still reach the
//                               paywall through the app's own meter.
//   data-ai .../articles        related-article recirculation, which sends the
//                               current article, the reader's ID and read list.
//
// In the requests that stay (For You feed and habit tiles):
//   the read list, the reader's IDs (j_ucid, wapo_login_id) and the current
//   article are left out, so the feed is the general one.
//
// On the phone: articles are no longer added to the reading history database
// (ReadingHistoryModel), which also fed the read list above. The meter's own
// article queue is left alone, because the paywall counts from it for readers
// who are not subscribers; with the meter blocked it never leaves the phone.
// ─────────────────────────────────────────────────────────────────────────────

private const val FOR_YOU_BODY = "Lcom/washingtonpost/foryou/data/ForYouRequestBody;"
private const val HABIT_TILES_BODY = "Lcom/washingtonpost/foryou/data/HabitTilesRequestBody;"
private const val READING_HISTORY_INSERT = "INSERT OR REPLACE INTO `ReadingHistoryModel`"

// The data class's primary constructor: the one with exactly this many
// parameters (the synthetic default-arguments constructor has two more).
private fun ClassDef.primaryConstructor(parameters: Int) =
    methods.single { it.name == "<init>" && it.parameterTypes.size == parameters }

@Suppress("unused")
val incognitoReadingPatch = bytecodePatch(
    name = "Incognito reading",
    description = "Experimental. Stops the app and the Post from recording which articles you read. Includes Block analytics & tracking.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(blockAnalyticsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        enableIncognitoReading()

        // ForYouRequestBody(readlist, exclusions, j_ucid, wapo_login_id,
        // interface, surface, surface_variant, limit, current_url, content types).
        // readlist cannot be null, so it becomes an empty list.
        (mutableClassDefBy(FOR_YOU_BODY).primaryConstructor(10) as MutableMethod).addInstructions(
                0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p1
                const/16 p3, 0x0
                const/16 p4, 0x0
                const/16 p9, 0x0
            """.trimIndent(),
        )

        // HabitTilesRequestBody(request_id, j_ucid, wapo_login_id, interface,
        // surface, surface_variant, readlist, user_timezone, overrides).
        (mutableClassDefBy(HABIT_TILES_BODY).primaryConstructor(9) as MutableMethod).addInstructions(
                0,
            """
                const/16 p2, 0x0
                const/16 p3, 0x0
                const/16 p7, 0x0
            """.trimIndent(),
        )

        // The reading history DAO. Its insert adapter (the class that holds the
        // INSERT statement) binds the entity, which gives the entity's type; the
        // adapter is an inner class of the DAO implementation.
        var adapterType: String? = null
        classDefForEach { classDef ->
            if (adapterType == null && classDef.methods.any { method ->
                    method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)
                            ?.string?.startsWith(READING_HISTORY_INSERT) == true
                    } == true
                }
            ) {
                adapterType = classDef.type
            }
        }
        val adapter = adapterType?.let { classDefBy(it) }
            ?: throw PatchException("Reading history: insert statement not found")
        // The bind method; its generic bridge takes Object, so that one is skipped.
        val entity = adapter.methods.firstOrNull {
            it.parameterTypes.size == 2 && it.returnType == "V" && it.parameterTypes[1].toString() != "Ljava/lang/Object;"
        }?.parameterTypes?.get(1)?.toString()
            ?: throw PatchException("Reading history: entity type not found")
        val dao = mutableClassDefBy(adapter.type.substringBefore('$') + ";")

        // e(ReadingHistoryModel...): every single read, listen and print-archive view.
        dao.methods.firstOrNull {
            it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("[$entity")
        }?.returnEarly("return-void") ?: throw PatchException("Reading history: insert method not found")

        // j(List<ReadingHistoryModel>, List<Metadata>, continuation): the batch
        // insert, with the metadata used to show the history.
        dao.methods.firstOrNull {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.size == 3 &&
                it.parameterTypes[0].toString() == "Ljava/util/List;" &&
                it.parameterTypes[1].toString() == "Ljava/util/List;"
        }?.returnEarly(returnUnitSmali()) ?: throw PatchException("Reading history: batch insert not found")
    }
}
