/*
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 *
 * Ported from the Solid Explorer 3.6.1 "Enable Pro" patch in hoo-dles/morphe-patches
 * (GPLv3), re-resolved for 3.6.4.
 */

package dev.hyzor.patches.solidexplorer.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import dev.hyzor.patches.solidexplorer.shared.Constants.LICENSE_DETAILS
import dev.hyzor.patches.solidexplorer.shared.Constants.LICENSE_STATE

/**
 * `LicenseDetails.<init>(LicenseState, String, Long, Long, String)V` — the record the whole
 * licensing stack reads, so the one place where the licence state can be forged.
 *
 * [dev.hyzor.patches.solidexplorer.pro.enableProPatch] needs the obfuscated name of the
 * `LicenseState` field that this constructor writes, so the filter below pins exactly that
 * write instead of the field's single-letter name:
 *
 *   iput-object p1, p0, LicenseDetails;->a:Lpl/solidexplorer/licensing/LicenseState;
 *
 * The parameters are pinned because Kotlin compiles a second, synthetic
 * `(LicenseState, String, Long, Long, String, int, DefaultConstructorMarker)` constructor for
 * the default arguments, and the two are otherwise identical as far as a fingerprint can
 * see. Only the five-argument one is the real body; the synthetic one delegates to it.
 */
object LicenseDetailsCtorFingerprint : Fingerprint(
    definingClass = LICENSE_DETAILS,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        LICENSE_STATE,
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "Ljava/lang/String;",
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = LICENSE_DETAILS,
            type = LICENSE_STATE,
        ),
    ),
)
