/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.iiec.misc.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object EditorNavigationFingerprint : Fingerprint(
    strings = listOf("show_get_premium_side_nav"),
)

internal object PremiumUserFingerprint : Fingerprint(
    classFingerprint = EditorNavigationFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN, InstructionLocation.MatchFirst()),
        opcode(Opcode.RETURN, InstructionLocation.MatchAfterImmediately()),
    ),
)

internal object MoreIdesMenuItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "Landroid/view/MenuItem;"),
    strings = listOf("more_ide_promo"),
)

internal object AdsManagerConstructorFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("replace admob_add_id!"),
)

internal object ConsentInfoUpdateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("onCreate"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/ads/consent/ConsentInformation;",
            parameters = listOf("[Ljava/lang/String;", "Lcom/google/ads/consent/ConsentInfoUpdateListener;"),
            returnType = "V",
        ),
    ),
)
