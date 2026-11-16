package me.toidicakhia.patches.vtvgo

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * BetterPlayer accepts a VAST tag through the "attachAds" platform-channel
 * method and wraps the content media source in an IMA AdsMediaSource.
 * No-oping this method plays the content directly.
 */
internal object BetterPlayerAttachAdsFingerprint : Fingerprint(
    definingClass = "Luz/shs/better_player_plus/BetterPlayer;",
    name = "attachAds",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * IMA AdsLoader.requestAds implementation used by the interactive_media_ads
 * Flutter plugin. It is called from the Pigeon handler, which catches the
 * "yr1" platform exception and returns it to Dart.
 */
internal object ImaAdsLoaderRequestAdsFingerprint : Fingerprint(
    definingClass = "Lfz5;",
    name = "c",
    parameters = listOf("Lt8;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { reference ->
                    reference.definingClass == "Ljava/util/UUID;" && reference.name == "randomUUID"
                } == true
        } == true
    }
)

/**
 * IMA AdsLoader.requestStreamAds implementation for live streams.
 */
internal object ImaAdsLoaderRequestStreamAdsFingerprint : Fingerprint(
    definingClass = "Lfz5;",
    name = "d",
    parameters = listOf("Lhj4;"),
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { reference ->
                    reference.definingClass == "Ljava/util/UUID;" && reference.name == "randomUUID"
                } == true
        } == true
    }
)

/**
 * R8-synthesized Runnable shared by the Flutter Firebase plugin to apply
 * setAnalyticsCollectionEnabled / setCrashlyticsCollectionEnabled /
 * setPerformanceCollectionEnabled. The constructor argument is stored in
 * the boolean field "I"; forcing it to false keeps all collectors disabled
 * even when Dart explicitly enables them.
 */
internal object FirebaseCollectionToggleFingerprint : Fingerprint(
    definingClass = "Lcs1;",
    name = "run",
    parameters = emptyList(),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? FieldReference)?.let { reference ->
                    reference.definingClass == "Lcs1;" &&
                        reference.name == "I" &&
                        reference.type == "Z"
                } == true
        } == true
    }
)

internal object SetTrackParametersFingerprint : Fingerprint(
    name = "setTrackParameters",
    definingClass = "Luz/shs/better_player_plus/BetterPlayer;",
    returnType = "V",
    parameters = listOf("I", "I", "I")
)

internal object BetterPlayerConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Landroid/content/Context;",
        "Lif1;",
        "Lio/flutter/view/TextureRegistry\$SurfaceProducer;",
        "Luz/shs/better_player_plus/CustomDefaultLoadControl;",
        "Lio/flutter/plugin/common/MethodChannel\$Result;"
    ),
    returnType = "V",
    custom = { _, classDef -> classDef.type == "Luz/shs/better_player_plus/BetterPlayer;" }
)

internal object BetterPlayerDisposeFingerprint : Fingerprint(
    definingClass = "Luz/shs/better_player_plus/BetterPlayer;",
    name = "dispose",
    parameters = emptyList(),
    returnType = "V"
)

internal object MainFlutterActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lvn/vtv/vtvgo/MainFlutterActivity;",
    name = "onResume",
    parameters = emptyList(),
    returnType = "V"
)
