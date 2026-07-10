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
// --- Append to Fingerprints.kt (below TabSwitchDispatcherFingerprint... i.e. below existing fingerprints) ---

/**
 * Matches Ln4d;->O1(Ljava/lang/String;Z)V — the shared tab-switch dispatcher.
 * Every bottom-nav tab (local/online/games/search/fatafat/live/download/
 * upcoming/bazaar/etc.) routes through this single method by tab-name string.
 *
 * Matched structurally (string literals in their fixed appearance order),
 * NOT by class/method name — Ln4d and O1 are both R8-obfuscated and will
 * be renamed on future MX Player builds. As long as the tab-name strings
 * stay the same, this keeps matching.
 */
object TabSwitchDispatcherFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
    filters = listOf(
        string("local"),
        string("online"),
        string("games"),
        string("search"),
        string("fatafat"),
    ),
)
// --- Append to Fingerprints.kt (replace/add below TabSwitchDispatcherFingerprint) ---

/**
 * Matches Ln4d;->y1()V — the Games tab click handler.
 * Called directly by the tab's dedicated click-listener class (e.g. Lnw;),
 * NOT via the O1() dispatcher — bottom-nav taps skip O1() entirely.
 *
 * NOTE: originally matched via "games"/"gameTab" string literals, but
 * n4d.j0() (the onResume-triggered method) ALSO carries these same
 * analytics-tracking strings for every tab, causing an ambiguous match
 * that crashed on app resume (NoClassDefFoundError, see crash_log.txt).
 * Pinned directly to class/method name instead, same as
 * VideoTabEnabledFingerprint. Re-verify against Ln4d;->y1()V if a future
 * MX Player release renames it (obfuscated names shift every build).
 */
object GamesTabHandlerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "Ln4d;" && method.name == "y1"
    },
)

/**
 * Matches Ln4d;->L1()V — the Search tab click handler.
 * Same reasoning as GamesTabHandlerFingerprint above — pinned to
 * class/method name instead of the ambiguous "search"/"mxSearchTab"
 * string match (also shared by n4d.j0()). Re-verify against Ln4d;->L1()V
 * on future MX Player releases.
 */
object SearchTabHandlerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "Ln4d;" && method.name == "L1"
    },
)