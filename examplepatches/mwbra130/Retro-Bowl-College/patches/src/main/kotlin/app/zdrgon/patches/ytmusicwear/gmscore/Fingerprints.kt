package app.zdrgon.patches.ytmusicwear.gmscore

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── GmsCore early-return targets — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// Same definitions as the official Morphe GmsCore support patch
// (shared/misc/gms/Fingerprints.kt): identical access flags, return
// types, parameter shapes and string sets. Verified against the Wear
// dex on 2026-11-13 with an androguard scan implementing exactly these
// semantics (scanner cross-checked against the phone build first):
//
//   GooglePlayUtility: exactly one method carries all three strings
//   and the (L, I)I public-static shape:
//       Llwy;->b(Landroid/content/Context; I)I
//   ServiceCheck: exactly one method carries the string and the
//   (L, I)V public-static shape:
//       Llwy;->d(Landroid/content/Context; I)V
//
// Both live in the thin GMS client library the Wear app bundles — the
// same library code as the phone app, under different obfuscated names.

/** Play-services availability check. Pinned to 0 (SUCCESS) so the app never blocks on real GMS. */
object GooglePlayUtilityWearFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    strings = listOf(
        "MetadataValueReader",
        "This should never happen.",
        "com.google.android.gms",
    )
)

/** Play-services availability nag. Returned early so it never fires. */
object ServiceCheckWearFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available")
)
