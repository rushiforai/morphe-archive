package app.anghami.patches.ads

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceNull
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Suppresses the paid placement surfaces of the app.
 *
 * The patch pins four boolean/string guards to a constant value so that Car Mode
 * sponsorship prompts, sponsored search sections and sponsored radar entries are
 * never advertised as paid content by the client:
 *
 * - `PreferenceHelper.getShowCarModeSponsor()` reports `false`
 * - `SectionInfo.getSponsored()` reports `false`
 * - `ProtoModels$Song.getSponsored()` reports `false`
 * - `PreferenceHelper.getACRSponsoredText()` reports `null`
 */
@Suppress("unused")
val sponsoredContentBlockPatch = bytecodePatch(
    name = "Remove Sponsored Content",
    description = "Hides sponsored cards, recommended promotions in Car Mode, and radar sponsored content.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        PreferenceCarModeSponsorSignature.method.forceFalse()

        SectionInfoSponsoredSignature.method.forceFalse()

        SongSponsoredSignature.method.forceFalse()

        ACRSponsoredTextSignature.method.forceNull()
    }
}

/** Reads the preference flag that decides whether Car Mode may show a sponsor slot. */
object PreferenceCarModeSponsorSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getShowCarModeSponsor",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN),
    )
)

/** Reads the sponsored flag of a content section. */
object SectionInfoSponsoredSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/pojo/section/SectionInfo;",
    name = "getSponsored",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN),
    )
)

/** Reads the sponsored flag of a song proto. */
object SongSponsoredSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/proto/ProtoModels\$Song;",
    name = "getSponsored",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN),
    )
)

/** Reads the sponsored text shown by the automatic content recognition flow. */
object ACRSponsoredTextSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getACRSponsoredText",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN_OBJECT),
    )
)
