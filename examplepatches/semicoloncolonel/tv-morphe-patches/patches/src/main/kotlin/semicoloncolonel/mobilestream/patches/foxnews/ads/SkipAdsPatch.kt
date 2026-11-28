package semicoloncolonel.mobilestream.patches.foxnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Fox News for Android TV 5.6.0 plays everything through one media3 player
// and picks how to load each title from three ad fields of its VideoContent:
// an IMA ad tag (client-side ads), a DAI content source ID (on-demand ads
// stitched by Google), and a DAI asset key (live ads stitched by Google).
// FreeWheel, Fox's ad server behind DAI, can supply the last two for every
// title from the app config.
//
// The VideoContent constructor now stores no ad tag, no content source ID,
// and an empty asset key, and both FreeWheel lookups find nothing. Every
// player then takes the app's own direct-stream path: the plain stream URL,
// with the Akamai token added as before. That is the path the app already
// uses when a DAI stream fails. No ad is requested, and the pause ads, which
// exist only on the DAI on-demand path, are gone too. The landing-page
// background player has its own check, which is made to say no as well.
//
// On live channels the breaks that DAI would have replaced with targeted ads
// now show whatever the broadcast carries there. Those are part of the
// channel's feed and still play.

private const val VIDEO_CONTENT = "Lcom/foxnews/tv/data/model/VideoContent;"
private const val FREEWHEEL = "Lcom/foxnews/tv/data/remote/model/FreewheelServerConfig;"

// The full constructor: the only one that checks imaAssetKey and mediaTags
// for null. The synthetic defaults constructor and copy() both call it.
internal object VideoContentInitFingerprint : Fingerprint(
    definingClass = VIDEO_CONTENT,
    name = "<init>",
    returnType = "V",
    strings = listOf("imaAssetKey", "mediaTags"),
)

internal object FreewheelVodSourceIdFingerprint : Fingerprint(
    definingClass = FREEWHEEL,
    name = "resolveVodSourceId",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

internal object FreewheelLiveAssetKeyFingerprint : Fingerprint(
    definingClass = FREEWHEEL,
    name = "resolveLiveAssetKey",
    parameters = listOf("Z", "Ljava/lang/String;", "Z"),
    returnType = "Ljava/lang/String;",
)

internal object BackgroundShouldUseImaFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/tv/ui/screens/landing/BackgroundVideoViewModel;",
    name = "shouldUseIma",
    parameters = listOf(VIDEO_CONTENT),
    returnType = "Z",
)

// Field -> the value it is given. imaAssetKey is a non-null String in
// Kotlin, so it gets an empty string rather than null.
private val clearedFields = mapOf(
    "adTagUrl" to null,
    "contentSourceId" to null,
    "imaAssetKey" to "",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the video ads and pause ads in on-demand videos and the targeted ads on live channels.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        VideoContentInitFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // Each field's source register is overwritten right before its
            // iput-object. From the end, so earlier indices stay valid.
            val writes = instructions.indices.filter { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == VIDEO_CONTENT && it.name in clearedFields
                    }
            }
            if (writes.size != clearedFields.size) {
                throw PatchException("Skip ads: expected ${clearedFields.size} ad field writes, found ${writes.size}")
            }
            writes.asReversed().forEach { index ->
                val instruction = instructions[index]
                val field = ((instruction as ReferenceInstruction).reference as FieldReference).name
                val register = (instruction as TwoRegisterInstruction).registerA
                val value = clearedFields.getValue(field)
                addInstruction(
                    index,
                    if (value == null) "const/16 v$register, 0x0" else "const-string v$register, \"$value\"",
                )
            }
        }

        listOf(FreewheelVodSourceIdFingerprint, FreewheelLiveAssetKeyFingerprint).forEach {
            it.method.returnEarly("const/4 v0, 0x0\nreturn-object v0")
        }
        BackgroundShouldUseImaFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
