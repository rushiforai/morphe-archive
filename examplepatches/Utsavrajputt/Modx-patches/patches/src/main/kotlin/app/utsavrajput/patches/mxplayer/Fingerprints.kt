package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Targets the internal method that decides whether video pre-roll/mid-roll ads
// are enabled. It reads a config flag, converts it to a Boolean, then to a
// String ("true"/"false"). We don't hardcode the obfuscated class name
// (it changes every MX Player release) - instead we match on the method
// shape (no params, returns String) plus the unique instruction sequence
// (Boolean.valueOf -> Boolean.toString -> "false" literal fallback).
object VideoAdEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),

    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "valueOf",
        ),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "toString",
        ),
        string("false"),
    ),
)

// Targets the internal flag method that gates visibility of the Video/OTT
// download tab on the home screen. Unlike VideoAdEnabledFingerprint above,
// this method has no stable framework calls or string literals to anchor
// on - it's a private caching helper (static int flag + two same-class
// helper calls). Because of that we can't match it purely on shape, so we
// pin it directly to the obfuscated class/method observed in MX Player
// 2.14.1 (class `bk7`, method `A`). If a future MX Player release renames
// these (obfuscated names shift every build), this fingerprint will stop
// matching and needs to be re-verified against the new decompiled class.
object VideoTabEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),

    custom = { method, classDef ->
        classDef.type == "Lbk7;" && method.name == "D"
    },
)
