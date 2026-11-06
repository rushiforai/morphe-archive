package app.zdrgon.patches.tuner.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Tuner (Cifra Club Afinador) 3.7.36 (versionCode 21165), classes3.dex —
// verified against the real dex on 2026-11-02.
//
// Premium is "Patrocine" (Cifra Club Pro). It is validated server-side
// (PatrocineAPI) and through Play Billing, but the result lands in exactly
// one local boolean: field LtT1;->o:Z on the SubscriptionManager (LtT1;),
// written by LtT1;->z0(Z)V and read ONLY through the getter below — 12
// caller files, zero direct field reads, no second state holder.
//
// LtT1;->h0()Z is a pure field getter ("public final", body is just
// iget-boolean + return). Its readers include both interstitial decisions
// (ShouldLoadInterstitialUseCase returns !h0(); ShouldShowInterstitialUseCase
// returns false when h0()), feature gates (InstrumentAndTuningDialogFragment,
// BaseViewModel, MainActivity) and the patrocine house-ad interstitial — so
// pinning this one getter is both the premium unlock and the ad removal:
// registered users are served no interstitials, and banner hosts treat them
// as registered.
//
// Morphe compares access flags by exact equality; the method is
// "public final" in this build — both flags are required.
internal object IsRegisteredFingerprint : Fingerprint(
    definingClass = "LtT1;",
    name = "h0",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)
