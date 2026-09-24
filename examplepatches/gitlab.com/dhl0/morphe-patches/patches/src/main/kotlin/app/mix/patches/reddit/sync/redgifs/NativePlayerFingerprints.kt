/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.redgifs

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Matches RedgifRequestWrapper's constructor, which bundles a Redgifs post url, a force-HD
// flag, and the Volley success/error listeners that ImageViewerFragment already wired up to
// play the result or show an error. The class name is obfuscated, but its original source file
// name survives in the dex's debug info, and the constructor's 4-parameter shape is unique
// within that class (its other methods are single-parameter getters/setters).
internal val redgifRequestWrapperFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Lcom/android/volley/Response",
        "Lcom/android/volley/Response",
    ),
    custom = { _, classDef -> classDef.sourceFile == "RedgifRequestWrapper.java" },
)

// Matches OAuthRequestManager's single entry point for the (dead) Redgifs OAuth/IP Volley
// chain: the only public static synchronized void method anywhere taking RedgifRequestWrapper
// (Lt8/d;) as its sole parameter. That wrapper type is an internal implementation detail of
// this one request chain, so this is unambiguous.
//
// Fingerprint.accessFlags requires an EXACT bitmask match (see morphe-patcher's Fingerprint.kt,
// `accessFlagsLocal != method.accessFlags`), not a "contains" check, so the synchronized flag
// must be listed even though it's not needed to disambiguate the method. It's
// DECLARED_SYNCHRONIZED (0x20000), not SYNCHRONIZED (0x20): per the dex spec and dexlib2's own
// AccessFlags.java, 0x20 (ACC_SYNCHRONIZED) is only legal on native methods as a VM auto-lock
// hint; a regular compiled `synchronized` method - which this is - gets explicit
// monitor-enter/exit bytecode plus the purely informational 0x20000 (ACC_DECLARED_SYNCHRONIZED)
// flag instead. Using SYNCHRONIZED here previously made the fingerprint fail to match entirely
// (confirmed against two separate patch runs).
//
// The type is hardcoded rather than resolved from redgifRequestWrapperFingerprint above,
// because Fingerprint.originalClassDef requires a BytecodePatchContext that is only available
// inside a patch's execute {} block, not while declaring another fingerprint. It was verified
// directly against this exact build's dex (matches redgifRequestWrapperFingerprint's target),
// and this patch is pinned to that one build regardless (see compatibleWith(COMPATIBILITY_SYNC)
// in FixRedgifsNativePlayerPatch.kt).
internal val oAuthRequestManagerEntryFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.DECLARED_SYNCHRONIZED),
    returnType = "V",
    parameters = listOf("Lt8/d;"),
)
