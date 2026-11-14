package app.zdrgon.patches.ytmusicwear.backgroundplayback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// ── Background playback gate — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// Ported from the official Morphe patch "Remove background playback
// restrictions" (MorpheApp/morphe-patches v2.2.0,
// music/misc/backgroundplayback). The official fingerprint is
// opcode-only: a public static (L)Z method whose first instructions are
// the sequence below. Official Morphe writes it with OpcodesFilter
// (patcher 2.x); this bundle builds on patcher 1.10.0, so the same
// sequence is written as ordered opcode() filters, which must appear in
// the same order as the instructions in the method.
//
// Verified by instruction-level dex scan (androguard, 2026-11-13),
// scanner validated on the known-good phone target first:
//   Phone 9.15.51:               575 candidate (public static (L)Z)
//                                methods, exactly 1 hit:
//                                Lazmd;->f(Lbsfj;)Z at instruction 0,
//                                access "public static".
//   Wear 9.45.41-WEAR_RELEASE:   521 candidates, exactly 1 hit:
//                                Lunz;->c(Laaok;)Z at instruction 0,
//                                access "public static".
// Unique match in both builds, so the gate method exists in the Wear
// app and this fingerprint resolves to it and nothing else.
//
// The official patch's second fingerprint (Kids background playback
// policy controller, matched by a numeric literal) is NOT ported: it
// was not verified in the Wear dex.

/** The single background-playback gate. Pinning it to true removes the restriction. */
object BackgroundPlaybackDisableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        opcode(Opcode.CONST_4),
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.IGET),
        opcode(Opcode.AND_INT_LIT16),
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.IGET_OBJECT),
        opcode(Opcode.IF_NEZ),
        opcode(Opcode.SGET_OBJECT),
        opcode(Opcode.IGET),
    )
)
