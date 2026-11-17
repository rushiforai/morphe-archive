package semicoloncolonel.mobilestream.patches.nba.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val AD_CONFIG = "Lcom/mediakind/mkplayer/config/clientsideads/MKAdvertisingConfiguration;"
private const val AD_BREAK = "Lcom/mediakind/mkplayer/config/clientsideads/MKAdBreak;"
private const val NO_ADS_LOG =
    "Playing media without ads. Configure ad support by calling setAdsLoaderProvider and setAdViewProvider."

// The client-side half of Skip ads, shared by the phone app and the Android TV
// app, which both play through MediaKind's MKPlayer and media3.

// The NBA app plays video with MediaKind's MKPlayer, which wraps the Bitmovin
// player. Client-side ads (Google IMA, and the ad manifests MediaKind loads
// for a stream) reach Bitmovin through MKAdvertisingConfiguration, whose
// names are not obfuscated in 1.2.0:
//
// - getSchedule() is copied into Bitmovin's AdvertisingConfig as the list of
//   ads to load with the video.
// - Before Bitmovin plays any ad break, scheduled or added later, it asks
//   MediaKind's shouldPlayAdBreak callback. NBA never sets its own, so the
//   default from the constructor answers, and it always returns true.
//
// Returning an empty schedule and making the default callback return false
// means no client-side ad break plays. Ads stitched into a stream on the
// server are not affected.
internal object AdScheduleFingerprint : Fingerprint(
    definingClass = AD_CONFIG,
    name = "getSchedule",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

internal object DefaultShouldPlayAdBreakFingerprint : Fingerprint(
    definingClass = AD_CONFIG,
    returnType = "Z",
    parameters = listOf(AD_BREAK),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
)

// Some videos skip MKPlayer and play in a plain media3 ExoPlayer with Google
// IMA (media3's ImaAdsLoader, R8-renamed). media3's DefaultMediaSourceFactory
// wraps an item in an AdsMediaSource only when its localConfiguration has an
// AdsConfiguration. The check is:
//
//     iget-object vX, ..., AdsConfiguration   (adsConfiguration)
//     if-nez vX, :wrap
//     return-object <content source>
//
// and the log above sits on the same no-ads path. The app carries more than one
// media3 copy, so every method holding that log is patched: the AdsConfiguration
// read is set to null, and the factory returns the plain content source.
private fun Method.isMediaSourceFactory() = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_STRING &&
        ((it as ReferenceInstruction).reference as StringReference).string == NO_ADS_LOG
} == true

/**
 * Stops MKPlayer's client-side ad breaks and the media3 IMA ads. Used by the
 * NBA phone app's Skip ads and the NBA Android TV app's Skip ads.
 */
internal fun BytecodePatchContext.skipMkPlayerAds() {
    AdScheduleFingerprint.method.addInstructions(
        0,
        """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
            return-object v0
        """,
    )

    DefaultShouldPlayAdBreakFingerprint.method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """,
    )

    var patched = 0
    classDefByStrings(NO_ADS_LOG, StringComparisonType.EQUALS).map { it.type }.distinct().forEach { type ->
        mutableClassDefBy(type).methods.filter { it.isMediaSourceFactory() }.forEach { method ->
            val instructions = method.implementation!!.instructions.toList()
            val logIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == NO_ADS_LOG
            }
            // The adsConfiguration check: iget-object vX; if-nez vX; return-object.
            val readIndex = (logIndex - 1 downTo 2).firstOrNull { i ->
                instructions[i - 2].opcode == Opcode.IGET_OBJECT &&
                    instructions[i - 1].opcode == Opcode.IF_NEZ &&
                    instructions[i].opcode == Opcode.RETURN_OBJECT &&
                    (instructions[i - 2] as OneRegisterInstruction).registerA ==
                    (instructions[i - 1] as OneRegisterInstruction).registerA
            }?.minus(2) ?: return@forEach

            val register = (instructions[readIndex] as OneRegisterInstruction).registerA
            method.addInstructions(readIndex + 1, "const/16 v$register, 0x0")
            patched++
        }
    }
    if (patched == 0) throw PatchException("media3 ads configuration check not found")
}
