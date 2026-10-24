/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.musicolet.misc.fix.cast

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val CAST_PLUGIN_PACKAGE = "in.krosbits.castplugin"

internal object CastPluginVersionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT),
        string(CAST_PLUGIN_PACKAGE),
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "getPackageInfo"),
        fieldAccess(definingClass = "Landroid/content/pm/PackageInfo;", name = "versionCode", opcode = Opcode.IGET),
    ),
)
