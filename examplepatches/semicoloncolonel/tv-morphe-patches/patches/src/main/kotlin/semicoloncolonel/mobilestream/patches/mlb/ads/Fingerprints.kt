/*
 * Ported from ajstrick81's "MLB At Bat Android TV" patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches
 * ALL CREDIT FOR THE ORIGINAL DESIGN AND ANALYSIS GOES TO ajstrick81. The MLB
 * app is one binary for phones and Android TV; this is a phone port validated
 * against 26.21.0.49. Changes from the original: anchors re-verified against
 * 26.21.0.49, the VOD request is built on the unobfuscated IMA StreamFormat
 * enum (with a patch-time existence check) instead of the SDK's internal
 * classes, the HLS-metadata dispatcher hook was dropped (its string anchor is
 * gone in this build and it was belt-and-suspenders), and the live cover is a
 * separate, opt-in "Mask live ad breaks" patch.
 */

package semicoloncolonel.mobilestream.patches.mlb.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Lives on ImaServerSideAdInsertionMediaSource; the string is unique in the
// app. The obfuscated parameter type is version-specific, so it is not pinned.
internal object SsaiMediaSourceStartupFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("ImaServerSideAdInsertionMediaSource"),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

// The DAI StreamManager event handler; StreamManager is an unobfuscated IMA type.
internal object DaiStreamManagerHandlerFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("IMA DAI Stream Event: ", "GSTREAM:DAI"),
    custom = { method, _ ->
        method.parameterTypes.size == 1 &&
            method.parameterTypes[0] == "Lcom/google/ads/interactivemedia/v3/api/StreamManager;"
    },
)

// The one place that builds the SSAI display container (unobfuscated IMA
// method name), used to find and register the ad view group for the cover.
internal object SsaiDisplayContainerFingerprint : Fingerprint(
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "createStreamDisplayContainer"
        } == true
    },
)

internal object AdBreakStartedFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name == "onAdBreakStarted" && method.parameterTypes.isEmpty() && method.implementation != null
    },
)

internal object AdBreakEndedFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name == "onAdBreakEnded" && method.parameterTypes.isEmpty() && method.implementation != null
    },
)

// Media3's OkHttpDataSource.open(DataSpec): method "f", one parameter, return
// J, in the class whose <clinit> carries the unobfuscated media3 telemetry tag.
internal object OkHttpDataSourceOpenFingerprint : Fingerprint(
    returnType = "J",
    custom = { method, classDef ->
        // open(DataSpec): returns J, one parameter, stores the response
        // InputStream, in the class whose <clinit> carries the unobfuscated
        // media3 telemetry tag. The method name is renamed per build.
        method.parameterTypes.size == 1 &&
            method.implementation?.instructions?.any {
                it.opcode == Opcode.IPUT_OBJECT &&
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Ljava/io/InputStream;"
            } == true &&
            classDef.methods.any { candidate ->
                candidate.name == "<clinit>" &&
                    candidate.implementation?.instructions?.any {
                        it.opcode == Opcode.CONST_STRING &&
                            ((it as ReferenceInstruction).reference as? StringReference)?.string ==
                            "media3.datasource.okhttp"
                    } == true
            }
    },
)
