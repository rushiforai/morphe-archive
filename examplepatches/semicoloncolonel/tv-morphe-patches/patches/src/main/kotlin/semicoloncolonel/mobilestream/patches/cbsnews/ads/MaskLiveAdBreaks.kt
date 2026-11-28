package semicoloncolonel.mobilestream.patches.cbsnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// CBS News for Android TV 8.6.0 plays the CBS News 24/7 stream through
// Google DAI, which stitches the ads in on Google's servers. The Paramount
// AVIA player's DAI listener receives the IMA SDK's ad events, including the
// start and end of each ad break. CbsLiveMask raises LiveBreakMask's cover and
// mutes the media volume at a break's start, and lifts them at its end or
// when AVIA releases the stream. The cover shows the time left in the break
// when the first ad in it reports the break's length.
//
// The app has one main screen, HomePageActivity, which plays every video.

private const val MASK = "Lsemicoloncolonel/mobilestream/extension/cbsnews/CbsLiveMask;"
private const val IMA = "Lcom/google/ads/interactivemedia/v3/api/"

private fun Method.calls(definingClass: String, name: String) = implementation?.instructions?.any {
    val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
    reference?.definingClass == definingClass && reference.name == name
} == true

// The DAI listener, told apart from the client-side IMA listener by the
// stream manager it takes when the stream loads.
internal object DaiAdEventFingerprint : Fingerprint(
    name = "onAdEvent",
    returnType = "V",
    parameters = listOf("${IMA}AdEvent;"),
    custom = { _, classDef ->
        classDef.methods.any { it.calls("${IMA}AdsManagerLoadedEvent;", "getStreamManager") }
    },
)

// The DAI plugin's release: removes its listeners and releases the loader.
internal object DaiReleaseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    custom = { method, classDef ->
        classDef.fields.any { it.type == "${IMA}StreamManager;" } && method.calls("${IMA}AdsLoader;", "release")
    },
)

internal object HomePageCreateFingerprint : Fingerprint(
    definingClass = "Lcom/cbs/commonui/homepage/HomePageActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** Part of Skip ads: runs only when its "maskLiveAds" option is on. */
internal fun BytecodePatchContext.maskLiveAdBreaks() {
    DaiAdEventFingerprint.method.addInstruction(
        0,
        "invoke-static/range { p1 .. p1 }, $MASK->onAdEvent(Ljava/lang/Object;)V",
    )
    DaiReleaseFingerprint.method.addInstruction(0, "invoke-static { }, $MASK->onStreamReleased()V")
    HomePageCreateFingerprint.method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $MASK->track(Landroid/app/Activity;)V",
    )
}
